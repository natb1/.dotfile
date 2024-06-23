local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
local uv = vim.uv or vim.loop

-- Auto-install lazy.nvim if not present
if not uv.fs_stat(lazypath) then
  print('Installing lazy.nvim....')
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
  print('Done.')
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  {'fatih/vim-go'},
  {'alvan/vim-closetag'},
  {'karb94/neoscroll.nvim'},
  {'cseelus/vim-colors-lucid'},
  -- {'preservim/tagbar'},

  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-cmdline'},
  {'hrsh7th/nvim-cmp'},

  {'rafamadriz/friendly-snippets'},
  {'hrsh7th/cmp-vsnip'},
  {'hrsh7th/vim-vsnip'},

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "lucid",
    },
  },

  --
  -- {'AndrewRadev/splitjoin.vim'},
  -- {'ctrlpvim/ctrlp.vim'},
  -- {'williamboman/mason.nvim'},
  -- {'williamboman/mason-lspconfig.nvim'},
  -- -- LSP Support
  -- {
  --   'VonHeikemen/lsp-zero.nvim',
  --   branch = 'v3.x',
  --   lazy = true,
  --   config = false,
  -- },
  -- -- LSP Support
  -- {
  --   'neovim/nvim-lspconfig',
  --   dependencies = {
  --     {'hrsh7th/cmp-nvim-lsp'},
  --   }
  -- },
})

vim.opt.termguicolors = true

local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opts)

require('neoscroll').setup()
