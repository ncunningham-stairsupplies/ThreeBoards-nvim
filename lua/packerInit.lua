local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  --lsp stuff
	use {
		'neovim/nvim-lspconfig',
		requires = {
		  { 'williamboman/nvim-lsp-installer' },
		},
	}

	use {
		'jose-elias-alvarez/nvim-lsp-ts-utils',
		requires = {
			'nvim-lua/plenary.nvim',
		}
	}

  -- Nvim Tree
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    }
  }

  -- temp colorscheme
  use {
	  'wuelnerdotexe/vim-enfocado'
  }

  use {
      'windwp/nvim-ts-autotag',
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-treesitter-refactor',
  }

  use({
    'CosmicNvim/cosmic-ui',
    requires = {
      'MunifTanjim/nui.nvim',
      'nvim-lua/plenary.nvim',
      'ray-x/lsp_signature.nvim',
    },
    config = function()
      require('plugins.cosmic-ui')
    end,
    after = 'nvim-lspconfig',
  })

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  })

	use({
    'hrsh7th/nvim-cmp',
    config = function()
      require('cosmic-ui').setup_autocomplete()
    end,
    requires = {
      { 'onsails/lspkind-nvim' },
      {
        'L3MON4D3/LuaSnip',
        config = function()
          require('plugins.luasnip')
        end,
        requires = {
          'rafamadriz/friendly-snippets',
        },
      },
      { 'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      {
        'windwp/nvim-autopairs',
        config = function()
          require('plugins.auto-pairs')
        end,
        after = 'nvim-cmp',
      },
    },
    event = 'InsertEnter',
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
