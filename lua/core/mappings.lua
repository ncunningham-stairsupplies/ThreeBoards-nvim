local map = require("utils").map
local user_mappings = require("user.mappings")

local core_mappings = {
	lsp = {
		declaration = {
			mode = "n",
			keybind = "gD",
			command = "<cmd>lua vim.lsp.buf.declaration()<CR>",
		},
		definition = {
			mode = "n",
			keybind = "gd",
			command = "<cmd>lua vim.lsp.buf.definition()<CR>",
		},
		implementation = {
			mode = "n",
			keybind = "gi",
			command = "<cmd>lua vim.lsp.buf.implementation()<CR>",
		},
		get_references = {
			mode = "n",
			keybind = "gr",
			command = "<cmd>lua vim.lsp.buf.references()<CR>",
		},
		hover = {
			mode = "n",
			keybind = "K",
			command = "<cmd>lua vim.lsp.buf.hover()<CR>",
		},
		signature_help = {
			mode = "n",
			keybind = "<C-k>",
			command = "<cmd>lua vim.lsp.buf.signature_help()<CR>",
		},
		format = {
			mode = "n",
			keybind = "<leader>la",
			command = "<cmd>lua vim.lsp.buf.formatting()<CR>",
		},
		code_action = {
			mode = "n",
			keybind = "<leader>la",
			command = "<cmd>lua vim.lsp.buf.code_action()<CR>",
		},
		diagnostics_window = {
			mode = "n",
			keybind = "<leader>ld",
			command = "<cmd>lua vim.diagnostic.open_float()<CR>",
		},
		type_definition = {
			mode = "n",
			keybind = "<leader>D",
			command = "<cmd>lua vim.lsp.buf.type_definition()<CR>",
		},
		rename = {
			mode = "n",
			keybind = "<leader>rn",
			command = "<cmd>lua vim.lsp.buf.rename()<CR>",
		},
		diagnostic_prev = {
			mode = "n",
			keybind = "[d",
			command = "<cmd>lua vim.diagnostic.goto_prev()<CR>",
		},
		diagnostic_next = {
			mode = "n",
			keybind = "]d",
			command = "<cmd>lua vim.diagnostic.goto_next()<CR>",
		},
	},
	nvim_tree = {},
	telescope = {},
}

local mappings = vim.tbl_extend("force", core_mappings, user_mappings)

for _, group in pairs(core_mappings) do
	for _, binding in pairs(group) do
		map(binding.mode, binding.keybind, binding.command)
	end
end
