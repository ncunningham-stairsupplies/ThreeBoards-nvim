local cmp = require("cmp")

local get_formatting = function()
	local ok, _ = pcall(require, "lspkind")
	if not ok then
		return {}
	end

	return {
		format = require("lspkind").cmp_format({
			with_text = true,
			menu = {
				buffer = "[buf]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[VimApi]",
				path = "[path]",
				luasnip = "[snip]",
			},
		}),
	}
end

local get_mapping = function()
	return {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		-- Accept currently selected item. If none selected, `select` first item.
		-- Set `select` to `false` to only confirm explicitly selected items.
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}
end

cmp.setup({
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	formatting = get_formatting(),
	mapping = get_mapping(),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
		{ name = "luasnip" },
		{ name = "path" },
	}),
})

cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})
