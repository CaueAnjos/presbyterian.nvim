local M = {}

--@return boolean
M.is_nix_installed = function()
	--TODO: check if nix
end

M.std_flake_path = vim.fn.stdpath("config") .. "/presbyterian"

return M
