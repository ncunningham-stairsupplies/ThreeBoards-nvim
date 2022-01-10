local map = require("utils").map

map("n", "<leader>av", "<cmd>AerialToggle!<CR>")
map("n", "<leader>as", "<cmd>Telescope aerial<CR>")

local aerial = {
	toggle = {
		mode = "n",
		keybind = "<leader>av",
		command = "<cmd>AerialToggle!<CR>",
	},
	telescope_toggle = {
		mode = "n",
		keybind = "<leader>as",
		command = "<cmd>Telescope aerial<CR>",
	},
}

return aerial
