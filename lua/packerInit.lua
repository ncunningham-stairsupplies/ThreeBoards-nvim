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

	-- lsp stuff
	use({
		"neovim/nvim-lspconfig",
		"williamboman/nvim-lsp-installer",
		"ray-x/lsp_signature.nvim",
	})
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})
	use("jose-elias-alvarez/nvim-lsp-ts-utils")
	use("simrat39/rust-tools.nvim")

	-- Which-Key Stuff
	use("folke/which-key.nvim")

	-- Lightsped stuff
	use("ggandor/lightspeed.nvim")

	-- Scroll smoothing
	use("karb94/neoscroll.nvim")

	-- TreeSitter Stuff
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("windwp/nvim-ts-autotag")

	-- Autocomplete stuff
	use({
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
	})

	-- autopairs
	use("windwp/nvim-autopairs")

	--git stuff
	use("lewis6991/gitsigns.nvim")

	--comment
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("numToStr/Comment.nvim")

	-- Find Stuff
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- File browser
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
	})

	-- Find functions
	use("stevearc/aerial.nvim")

	-- status bar
	use("nvim-lualine/lualine.nvim")

	-- temp colorscheme
	use({
		"wuelnerdotexe/vim-enfocado",
		"overcache/NeoSolarized",
		"jacoborus/tender.vim",
		"rebelot/kanagawa.nvim",
	})

	-- DB stuff
	use({
		"tpope/vim-dadbod",
		"kristijanhusak/vim-dadbod-ui",
	})

	-- git stuff
	use("tpope/vim-fugitive")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
