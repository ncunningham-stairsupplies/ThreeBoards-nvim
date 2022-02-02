require("plugins.nvim-dap.mappings")

local ok, nvim_dap = pcall(require, "nvim-dap")
if not ok then
	return
end

nvim_dap.setup({})
