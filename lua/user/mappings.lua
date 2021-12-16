local map = require("utils").map

local user_mappings = {
	lsp = {
		log = { keybind = "<leader>lp" },
	},
	poop = {
		yeet = {
			mode = "n",
			keybind = "<leader>aa",
			command = "<cmd>lua vim.notify('poop yeet')<CR>",
		},
	},
	nvim_tree = {},
	telescope = {},
}

return user_mappings
