local dap = {
	attach = {
		mode = "n",
		keybind = "<leader>da",
		command = "<cmd>lua require'dap'.continue()<CR>",
	},
	continue = {
		mode = "n",
		keybind = "<leader>dc",
		command = "<cmd>lua require'dap'.continue()<CR>",
	},
	breakpoint = {
		mode = "n",
		keybind = "<F5>",
		command = "<cmd>lua require'dap'.toggle_breakpoint()<CR>",
	},
	step_over = {
		mode = "n",
		keybind = "<F9>",
		command = "<cmd>lua require'dap'.step_over()<CR>",
	},
	step_into = {
		mode = "n",
		keybind = "<F10>",
		command = "<cmd>lua require'dap'.step_into()<CR>",
	},
	ui_open = {
		mode = "n",
		keybind = "<leader>du",
		command = "<cmd>lua require'dapui'.toggle()<CR>",
	},
}

return dap
