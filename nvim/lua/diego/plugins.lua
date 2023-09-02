local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

  -- git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  {'akinsho/git-conflict.nvim', version = "*", config = true},

  -- detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- web icons
  'nvim-tree/nvim-web-devicons',

  -- when you just want to watch the world burn
  'eandrju/cellular-automaton.nvim',

  -- zen mode
  { 'folke/zen-mode.nvim', opts = {} },

  -- changes surroundings
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({})
    end
  },

  -- autoclosing
  'windwp/nvim-autopairs',
  { 'windwp/nvim-ts-autotag', after = "nvim-treesitter" },

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs, linters & formatters to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- {
      --   'nvimdev/lspsaga.nvim',
      --   config = function()
      --     require('lspsaga').setup({})
      --   end,
      --   dependencies = {
      --     'nvim-treesitter/nvim-treesitter',
      --     'nvim-tree/nvim-web-devicons'
      --   }
      -- },

      -- useful status updates for LSP
      { 'j-hui/fidget.nvim', tag = 'legacy', opts = {} },

      -- additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  {
    -- autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- autocomplete sources
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',

      -- snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  -- Adds git related signs to the gutter
  'lewis6991/gitsigns.nvim',

  {
    -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,

    config = function()
      vim.cmd.colorscheme 'onedark'
    end,
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
