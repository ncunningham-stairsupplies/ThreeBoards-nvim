local nvim_dap_ui = {
	open = {
		mode = "n",
		keybind = "<leader>dui",
		command = '<cmd>lua require"dapui".toggle()<CR>',
	},
}

return nvim_dap_ui
