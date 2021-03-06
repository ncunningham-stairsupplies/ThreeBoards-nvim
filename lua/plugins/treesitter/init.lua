local ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not ok then
	return
end
treesitter.setup({
	ensure_installed = {
		"typescript",
		"javascript",
		"tsx",
		"html",
		"css",
		"lua",
		"json",
		"scss",
		"go",
	},
	highlight = {
		enable = true,
		use_languagetree = true,
	},
	indent = {
		enable = false,
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
	},
	refactor = {
		highlight_definitions = { enable = true },
		highlight_current_scope = { enable = false },
	},
})
