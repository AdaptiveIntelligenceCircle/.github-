-- VOTING_PROTOCOL.lua
-- AIC Voting Protocol (simple, CI-friendly)
-- Usage:
--   lua VOTING_PROTOCOL.lua --proposal proposals/<id>.md [--dry-run] [--auto-merge]
--
-- Assumptions:
--  - Each proposal is a markdown file in /governance/proposals/
--  - Votes are files in /governance/votes/<proposal-id>/
--    each vote file is named <username>.vote and contains:
--      decision: "approve" or "reject"
--      commit: <git-commit-sha> (optional, for attribution)
--  - Git is available if --auto-merge requested (merge will be attempted).
--  - Thresholds and quorum are read from CONSENSUS_RULES.md (fallback to defaults below).

local lfs = require("lfs") -- LuaFileSystem for directory iteration (optional)
-- If lfs not available, we'll use io.popen fallbacks for listing
