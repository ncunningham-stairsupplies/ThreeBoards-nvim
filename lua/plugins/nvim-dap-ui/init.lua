require("plugins.nvim-dap-ui.mappings")

local ok, nvim_dap_ui = pcall(require, "nvim-dap-ui")
if not ok then
	return
end

nvim_dap_ui.setup({})
