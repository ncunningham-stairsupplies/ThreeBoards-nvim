local telescope = {
	find_files = {
		mode = "n",
		keybind = "<leader>ff",
		command = ":Telescope find_files<cr>",
	},
	find_in_files = {
		mode = "n",
		keybind = "<leader>fg",
		command = "<cmd>Telescope live_grep<cr>",
	},
}

return telescope
