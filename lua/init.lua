local util = require("util")

local config = nil
local M = {}
--@class Aliases
--@field public alias string
--@field public bin string

--@class PresbyterianOpts
--@field public aliases Aliases[]
--@field public auto_load boolean
--@field public flake_location string

--@param opts PresbyterianOpts?
M.setup = function(opts)
	config = opts or { auto_load = true, aliases = {}, flake_location = util.std_flake_path }
end

M.load_dependencies = function() end

--@return string
M.flake_location = config.flake_location or util.std_flake_path

return M
