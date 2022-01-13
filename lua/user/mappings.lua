local map = require("utils").map

local user_mappings = {
	poop = {
		yeet = {
			mode = "n",
			keybind = "<leader>aa",
			command = "<cmd>lua vim.notify('poop yeet')<CR>",
		},
	},
}

return user_mappings
