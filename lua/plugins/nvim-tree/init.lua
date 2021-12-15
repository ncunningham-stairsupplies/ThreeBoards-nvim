require("plugins.nvim-tree.mappings")
local icons = require("theme.icons")

vim.opt.termguicolors = true

vim.g.nvim_tree_icons = {
	default = "",
	symlink = icons.symlink,
	git = icons.git,
	folder = icons.folder,

	lsp = {
		hint = icons.hint,
		info = icons.info,
		warning = icons.warn,
		error = icons.error,
	},
}
require("nvim-tree").setup({
	auto_close = true,
	diagnostics = {
		enable = true,
	},
	update_focused_file = {
		enable = true,
	},
	view = {
		width = 35,
	},
})
