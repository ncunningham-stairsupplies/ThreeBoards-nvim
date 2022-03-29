require("plugins.nvim-tree.mappings")
local icons = require("theme.icons")

local ok, nvim_tree = pcall(require, "nvim-tree")
if not ok then
	return
end

vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")

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
nvim_tree.setup({
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
