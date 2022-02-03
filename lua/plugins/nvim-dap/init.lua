require("plugins.nvim-dap.mappings")

local ok, dap = pcall(require, "dap")
if not ok then
	return
end

dap.setup({})
