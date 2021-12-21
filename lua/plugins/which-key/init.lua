local ok, which_key = pcall(require, "which-key")
if not ok then
	return
end

which_key.setup({})

which_key.register({
	f = {
		name = "find",
	},
}, { prefix = "<leader>" })
