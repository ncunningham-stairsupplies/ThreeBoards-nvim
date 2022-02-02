local telescope_dap = {
	commands = {
		mode = "n",
		keybind = "<leader>dtc",
		command = '<cmd>lua require"telescope".extensions.dap.commands{}<CR>',
	},
	configurations = {
		mode = "n",
		keybind = "<leader>dto",
		command = '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>',
	},
	breakpoints = {
		mode = "n",
		keybind = "<leader>dtb",
		command = '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>',
	},
	variables = {
		mode = "n",
		keybind = "<leader>dtv",
		command = '<cmd>lua require"telescope".extensions.dap.variables{}<CR>',
	},
	frames = {
		mode = "n",
		keybind = "<leader>dtf",
		command = '<cmd>lua require"telescope".extensions.dap.frames{}<CR>',
	},
}
return telescope_dap
