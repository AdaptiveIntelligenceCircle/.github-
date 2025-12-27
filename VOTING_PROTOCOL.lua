-- voting_protocol.lua
-- Purpose:
-- This module defines a local agreement mechanism
-- for system components, not for human governance.
-- It is designed for internal adaptive coordination.

local lfs = require("lfs") -- LuaFileSystem for directory iteration (optional)
-- If lfs not available, we'll use io.popen fallbacks for listing
