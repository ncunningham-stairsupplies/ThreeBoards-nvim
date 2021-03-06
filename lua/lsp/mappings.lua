local map = require("utils").map

--map("n", "<leader>ll", "<cmd>lua vim.cmd('e'..vim.lsp.get_log_path())<CR>")
--

-- See `:help vim.lsp.*` for documentation on any of the below functions

local lsp = {
	declaration = {
		mode = "n",
		keybind = "gD",
		command = "<cmd>lua vim.lsp.buf.declaration()<CR>",
	},
	log = {
		mode = "n",
		keybind = "<leader>ll",
		command = "<cmd>lua vim.cmd('e'..vim.lsp.get_log_path())<CR>",
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
		keybind = "<leader>lf",
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
	organize_imports = {
		mode = "n",
		keybind = "<leader>lso",
		command = ":TSLspOrganize<CR>",
	},
	rename_file = {
		mode = "n",
		keybind = "<leader>lsr",
		command = ":TSLspRenameFile<CR>",
	},
	import_all = {
		mode = "n",
		keybind = "<leader>lsi",
		command = ":TSLspImportAll<CR>",
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
}

return lsp
