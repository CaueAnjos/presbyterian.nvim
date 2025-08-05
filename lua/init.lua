local util = require("util")

local M = {}
local config = {}

---@class Alias
---@field alias string The alias name
---@field bin string The binary path or command

---@class PresbyterianOpts
---@field aliases? Alias[] List of command aliases
---@field auto_load? boolean Whether to auto-load dependencies
---@field flake_location? string Path to the flake directory

-- Default configuration
local DEFAULT_CONFIG = {
	auto_load = true,
	aliases = {},
	flake_location = nil,
}

---Setup the Presbyterian plugin with user configuration
---@param opts PresbyterianOpts? User configuration options
function M.setup(opts)
	config = vim.tbl_deep_extend("force", DEFAULT_CONFIG, opts or {})

	if not config.flake_location then
		config.flake_location = util.get_std_flake_path()
	end

	if not config.flake_location or config.flake_location == "" then
		vim.notify("Presbyterian: Invalid flake_location", vim.log.levels.ERROR)
		return false
	end

	if config.auto_load then
		M.load_dependencies()
	end

	return true
end

function M.load_dependencies()
	if not util.is_nix_installed() then
		vim.notify("Presbyterian: Nix is not installed", vim.log.levels.WARN)
		return false
	end

	-- TODO: Implement dependency loading logic
	vim.notify("Presbyterian: Loading dependencies from " .. M.get_flake_location(), vim.log.levels.INFO)
	return true
end

---Get the current flake location
---@return string: The flake directory path
function M.get_flake_location()
	return config.flake_location or util.get_std_flake_path()
end

---Get the current configuration
---@return PresbyterianOpts: The current config table
function M.get_config()
	return vim.deepcopy(config)
end

return M
