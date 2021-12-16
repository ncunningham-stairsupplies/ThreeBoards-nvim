local map = require("utils").map
local user_mappings = require("user.mappings")

local core_mappings = {
	lsp = {
		definition = {
			mode = "n",
			keybind = "gd",
			command = "",
		},
		log = {
			mode = "n",
			keybind = "<leader>ll",
			command = "<cmd>lua vim.cmd('e'..vim.lsp.get_log_path())<CR>",
		},
	},
	nvim_tree = {},
	telescope = {},
}

local mappings = vim.tbl_deep_extend("force", core_mappings, user_mappings)

for _, group in pairs(mappings) do
	for _, binding in pairs(group) do
		map(binding.mode, binding.keybind, binding.command)
	end
end
