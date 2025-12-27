-- ROTATE_ROLE.lua
-- Usage:
--   lua ROTATE_ROLE.lua <period_days> <custodians_count> <contributors_file> <output_file>
-- Example:
--   lua ROTATE_ROLE.lua 14 3 contributors.lua custodians.lua
-- Status: dormant / future-use
-- Expected relevance: medium-to-long term (3–5 years)
-- This module is not currently used in the active runtime.
-- It exists as a forward-compatible primitive for future
-- decentralized coordination between devices.

local args = {...}
if #args < 4 then
  print("Usage: lua ROTATE_ROLE.lua <period_days> <custodians_count> <contributors_file> <output_file>")
  os.exit(1)
end

local period_days = tonumber(args[1])
local custodians_count = tonumber(args[2])
local contributors_file = args[3]
local output_file = args[4]

-- load contributors table from a Lua file that returns a table
local contributors_chunk, err = loadfile(contributors_file)
if not contributors_chunk then
  error("Failed to load contributors file: " .. tostring(err))
end
local ok, contributors = pcall(contributors_chunk)
if not ok then
  error("contributors file must return a table: " .. tostring(contributors))
end
if type(contributors) ~= "table" then
  error("contributors file must return a table")
end

-- default fields expected per contributor:
-- {
--   id = "tri_nd",
--   name = "Nguyen Duc Tri",
--   contribution_score = 123.45, -- numeric
--   last_role_at = 0,           -- unix timestamp of when they were last custodian (0 if never)
--   active = true               -- optional boolean
-- }

local now = os.time()
local period_seconds = (period_days or 14) * 24 * 3600

-- filter active contributors
local pool = {}
for _, c in ipairs(contributors) do
  if c.active == nil or c.active == true then
    -- normalize fields
    c.contribution_score = tonumber(c.contribution_score) or 0
    c.last_role_at = tonumber(c.last_role_at) or 0
    table.insert(pool, c)
  end
end

-- sort by:
-- 1) higher contribution_score first
-- 2) earlier last_role_at (older timestamp => higher priority)
-- 3) id lexical as stable tie-breaker
table.sort(pool, function(a,b)
  if a.contribution_score ~= b.contribution_score then
    return a.contribution_score > b.contribution_score
  end
  if a.last_role_at ~= b.last_role_at then
    return a.last_role_at < b.last_role_at
  end
  return tostring(a.id) < tostring(b.id)
end)

-- choose custodians_count that are eligible:
-- eligibility rule: if now - last_role_at >= period_seconds OR never held role
local selected = {}
local i = 1
while #selected < custodians_count and i <= #pool do
  local candidate = pool[i]
  local elapsed = now - (candidate.last_role_at or 0)
  -- if never had role (last_role_at == 0) OR elapsed >= period_seconds, select
  if (candidate.last_role_at == 0) or (elapsed >= period_seconds) then
    table.insert(selected, candidate)
  end
  i = i + 1
end

-- if not enough eligible, relax constraint: pick top remaining to fill slots
i = 1
while #selected < custodians_count and i <= #pool do
  local candidate = pool[i]
  local already = false
  for _, s in ipairs(selected) do if s.id == candidate.id then already = true; break end end
  if not already then table.insert(selected, candidate) end
  i = i + 1
end

-- update last_role_at for selected custodians
for _, s in ipairs(selected) do
  s.last_role_at = now
end

-- write output file (custodians list) and update contributors data (write back)
local function dump_lua_table(tbl)
  local function esc_str(s)
    s = tostring(s)
    s = s:gsub("\\", "\\\\")
    s = s:gsub("\"", "\\\"")
    s = s:gsub("\n", "\\n")
    return '"' .. s .. '"'
  end
  local parts = {}
  table.insert(parts, "{\n")
  for _, c in ipairs(tbl) do
    table.insert(parts, "  {\n")
    table.insert(parts, "    id = " .. esc_str(c.id) .. ",\n")
    table.insert(parts, "    name = " .. esc_str(c.name or "") .. ",\n")
    table.insert(parts, "    contribution_score = " .. (tostring(c.contribution_score or 0)) .. ",\n")
    table.insert(parts, "    last_role_at = " .. (tostring(c.last_role_at or 0)) .. ",\n")
    table.insert(parts, "    active = " .. (c.active == false and "false" or "true") .. ",\n")
    table.insert(parts, "  },\n")
  end
  table.insert(parts, "}\n")
  return table.concat(parts)
end

-- save custodians file
local out = io.open(output_file, "w")
if not out then error("Cannot write to " .. output_file) end

out:write("-- Auto-generated custodians file\n")
out:write("-- generated_at = " .. tostring(now) .. "\n\n")
out:write("return ")
out:write(dump_lua_table(selected))
out:close()

-- Optionally write back contributors with updated last_role_at (overwrites input file)
local back = io.open(contributors_file, "w")
if not back then error("Cannot write back to " .. contributors_file) end
back:write("-- contributors data (auto-updated last_role_at). Keep as Lua table.\n")
back:write("-- updated_at = " .. tostring(now) .. "\n\n")
back:write("return ")
back:write(dump_lua_table(contributors))
back:close()

print("Rotation complete. Selected custodians:")
for _, s in ipairs(selected) do
  print(string.format(" - %s (%s) score=%.2f last_role_at=%s", s.name or s.id, s.id, s.contribution_score or 0, tostring(s.last_role_at)))
end