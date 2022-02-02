require("plugins.nvim-dap-virtual-text.mappings")

local ok, nvim_dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not ok then
	return
end

nvim_dap_virtual_text.setup({})
