local M = {}

function M.map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	print(mode, lhs, rhs)
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

function M.tbl_extend_merge(left, right)
	for groupName, group in pairs(left) do
	end
end

return M
