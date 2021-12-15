local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	--lsp stuff
	use({
		"neovim/nvim-lspconfig",
		requires = {
			{ "williamboman/nvim-lsp-installer" },
		},
	})

	use({
		"jose-elias-alvarez/nvim-lsp-ts-utils",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("null-ls").setup({
				debug = true,
				on_attach = function(client)
					if client.resolved_capabilities.document_formatting then
						vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
					end
				end,
				sources = {
					require("null-ls").builtins.formatting.stylua,
					require("null-ls").builtins.formatting.eslint_d,
					require("null-ls").builtins.completion.spell,
				},
			})
		end,
		requires = { "nvim-lua/plenary.nvim" },
		after = "nvim-lspconfig",
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	-- Nvim Tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
	})

	-- temp colorscheme
	use({
		"wuelnerdotexe/vim-enfocado",
	})

	use({
		"windwp/nvim-ts-autotag",
		"JoosepAlviste/nvim-ts-context-commentstring",
		"nvim-treesitter/nvim-treesitter-refactor",
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.nvim-cmp")
		end,
		requires = {
			{ "onsails/lspkind-nvim" },
			{
				"L3MON4D3/LuaSnip",
				config = function()
					require("plugins.luasnip")
				end,
				requires = {
					"rafamadriz/friendly-snippets",
				},
			},
			{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
			{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{
				"windwp/nvim-autopairs",
				config = function()
					require("plugins.auto-pairs")
				end,
				after = "nvim-cmp",
			},
		},
		event = "InsertEnter",
	})

	if packer_bootstrap then
		require("packer").sync()
	end
end)
