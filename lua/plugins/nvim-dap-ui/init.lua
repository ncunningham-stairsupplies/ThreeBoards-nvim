require("plugins.nvim-dap-ui.mappings")

local ok, dapui = pcall(require, "dapui")
if not ok then
	return
end

dapui.setup({})
