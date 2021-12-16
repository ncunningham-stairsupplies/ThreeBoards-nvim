local map = require("utils").map
local user_mappings = require("user.mappings")

local core_mappings = {
	lsp = {
		--goto_declaration = map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>"),
		-- hover = map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>"),
		log = {
			mode = "n",
			keybind = "<leader>ll",
			command = "<cmd>lua vim.lsp.buf.hover()<CR>",
		},
	},
	nvim_tree = {},
	telescope = {},
}

local mappings = vim.tbl_deep_extend("force", core_mappings, user_mappings)

for _, group in ipairs(core_mappings) do
	print(group)
	for _, binding in ipairs(group) do
		print(binding)
		map(binding.mode, binding.keybind, binding.command)
	end
end
