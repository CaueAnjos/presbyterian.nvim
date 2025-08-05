local M = {}

---Check if Nix is installed and available
---@return boolean: True if Nix is installed
function M.is_nix_installed()
	local handle = io.popen("command -v nix 2>/dev/null")
	if not handle then
		return false
	end

	local result = handle:read("*a")
	handle:close()

	return result and result ~= ""
end

---Get the standard flake path
---@return string: The standard flake directory path
function M.get_std_flake_path()
	local config_path = vim.fn.stdpath("config")
	if not config_path then
		vim.notify("Presbyterian: Could not determine config path", vim.log.levels.ERROR)
		return ""
	end

	return config_path .. "/presbyterian"
end

return M
