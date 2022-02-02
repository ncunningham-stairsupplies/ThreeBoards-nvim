local map = require("utils").map

local user_mappings = {
	poop = {
		yeet = {
			mode = "n",
			keybind = "<leader>aa",
			command = "<cmd>lua vim.notify('poop yeet')<CR>",
		},
		-- visual_move_up = {
		-- 	mode = "x",
		-- 	keybind = "<C-k>",
		-- 	command = ":m ’<-2<CR>gv=gv",
		-- },
		-- visual_move_down = {
		-- 	mode = "x",
		-- 	keybind = "<C-j>",
		-- 	command = ":m ‘>+1<CR>gv=gv",
		-- },
	},
	editor = {},
}

return user_mappings
