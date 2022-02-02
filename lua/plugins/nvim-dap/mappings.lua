local nvim_dap = {
	continue = {
		mode = "n",
		keybind = "<leader>ddc",
		command = '<cmd>lua require"dap".continue()<CR>',
	},
	step_over = {
		mode = "n",
		keybind = "<leader>ddj",
		command = '<cmd>lua require"dap".step_over()<CR>',
	},
	step_into = {
		mode = "n",
		keybind = "<leader>ddl",
		command = '<cmd>lua require"dap".step_into()<CR>',
	},
	step_out = {
		mode = "n",
		keybind = "<leader>ddk",
		command = '<cmd>lua require"dap".step_out()<CR>',
	},
	toggle_breakpoint = {
		mode = "n",
		keybind = "<leader>db",
		command = '<cmd>lua require"dap".toggle_breakpoint()<CR>',
	},
	toggle_cond_breakpoint = {
		mode = "n",
		keybind = "<leader>dcb",
		command = '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>',
	},
	toggle_log_breakpoint = {
		mode = "n",
		keybind = "<leader>dlb",
		command = '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
	},
	show_scopes = {
		mode = "n",
		keybind = "<leader>ds",
		command = '<cmd>lua require"dap.ui.variables".scopes()<CR>',
	},
	show_hover = {
		mode = "n",
		keybind = "<leader>dh",
		command = '<cmd>lua require"dap.ui.variables".hover()<CR>',
	},
	visual_show_hover = {
		mode = "v",
		keybind = "<leader>dh",
		command = '<cmd>lua require"dap.ui.variables".visual_hover()<CR>',
	},
	widget_hover = {
		mode = "n",
		keybind = "<leader>dwh",
		command = '<cmd>lua require"dap.ui.widgets".hover()<CR>',
	},
	widget_scopes = {
		mode = "n",
		keybind = "<leader>dws",
		command = "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>",
	},
	repl_open = {
		mode = "n",
		keybind = "<leader>dro",
		command = '<cmd>lua require"dap".repl.open()<CR>',
	},
	repl_run_last = {
		mode = "n",
		keybind = "<leader>drr",
		command = '<cmd>lua require"dap".repl.run_last()<CR>',
	},
}
return nvim_dap
