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
  --
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "lucid",
    },
  }
  --
  -- {'AndrewRadev/splitjoin.vim'},
  -- {'SirVer/ultisnips'},
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
  -- -- Autocompletion
  -- {
  --   'hrsh7th/nvim-cmp',
  --   dependencies = {
  --     {'L3MON4D3/LuaSnip'}
  --   },
  -- }
})

---
-- LSP setup
---
-- local lsp_zero = require('lsp-zero')
-- 
-- lsp_zero.on_attach(function(client, bufnr)
--   -- see :help lsp-zero-keybindings
--   -- to learn the available actions
--   lsp_zero.default_keymaps({buffer = bufnr})
-- end)

--- if you want to know more about lsp-zero and mason.nvim
--- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
-- require('mason').setup({})
-- require('mason-lspconfig').setup({
--   handlers = {
--     lsp_zero.default_setup,
--     lua_ls = function()
--       -- (Optional) configure lua language server
--       local lua_opts = lsp_zero.nvim_lua_ls()
--       require('lspconfig').lua_ls.setup(lua_opts)
--     end,
--   }
-- })

---
-- Autocompletion config
---
-- local cmp = require('cmp')
-- local cmp_action = lsp_zero.cmp_action()
-- 
-- cmp.setup({
--   mapping = cmp.mapping.preset.insert({
--     -- `Enter` key to confirm completion
--     ['<CR>'] = cmp.mapping.confirm({select = false}),
-- 
--     -- Ctrl+Space to trigger completion menu
--     ['<C-Space>'] = cmp.mapping.complete(),
-- 
--     -- Navigate between snippet placeholder
--     ['<C-f>'] = cmp_action.luasnip_jump_forward(),
--     ['<C-b>'] = cmp_action.luasnip_jump_backward(),
-- 
--     -- Scroll up and down in the completion documentation
--     ['<C-u>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-d>'] = cmp.mapping.scroll_docs(4),
--   })
-- })

vim.opt.termguicolors = true

local vimrc = vim.fn.stdpath("config") .. "/vimrc.vim"
vim.cmd.source(vimrc)
vim.keymap.set('n', '<leader>r', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opts)

require('neoscroll').setup()
