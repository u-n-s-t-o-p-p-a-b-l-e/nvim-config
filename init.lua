vim.opt.number = true
vim.opt.autoindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.mouse = 'a'
vim.opt.clipboard:append('unnamedplus')
vim.opt.linebreak = true
vim.opt.breakindent = true
vim.opt.showbreak = 'Í±'
vim.opt.termguicolors = true
vim.opt.updatetime = 100

-- Set the cursor style for different modes
vim.api.nvim_create_autocmd("InsertEnter", {
    pattern = "*",
    command = "set cursorline"
})

vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    command = "set nocursorline"
})

-- -- Highlight NonText
-- vim.api.nvim_set_hl(0, 'NonText', { guifg = vim.opt.bg })
--

-- Highlight NonText
vim.api.nvim_set_hl(0, 'NonText', { fg = 'NONE' }) -- or specify the actual color


-- Set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Function to map keys
local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Remap Ctrl+S to save in all modes
map('n', '<C-s>', ':w<CR>')
map('i', '<C-s>', '<C-o>:w<CR>')
map('v', '<C-s>', '<C-c>:w<CR>')
map('c', '<C-s>', '<C-c>:w<CR>')
map('x', '<C-s>', '<C-c>:w<CR>')

-- Additional remaps
map('n', '<leader>q', ':q!<CR>')
map('n', '<leader>d', ':%d<CR>')
map('n', '<leader>so', ':source $MYVIMRC<CR>')

-- Install packer.nvim if not installed
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install plugins
packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Mason for managing LSP, DAP, linters, and formatters
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }

  -- Autocompletion plugin
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
    }
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
	  'nvim-telescope/telescope-media-files.nvim'
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
end)

-- Mason setup
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "rust_analyzer", "pyright" }
})

-- Telescope setup
require('telescope').setup{
    extensions = {
        media_files = {
            -- filetypes whitelist
            -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
            filetypes = {"png", "jpg", "jpeg", "mp4", "webm", "pdf"},
            find_cmd = "rg" -- find command (defaults to `fd`)
        }
    }
}

-- Load Telescope extensions
require('telescope').load_extension('media_files')


-- LSP settings
local lspconfig = require("lspconfig")

-- Example: Setup rust_analyzer
lspconfig.rust_analyzer.setup({
  -- Additional configuration if needed
})

-- Example: Setup pyright
lspconfig.pyright.setup({
  -- Additional configuration if needed
})

-- Autocompletion setup
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable,
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'buffer' },
  })
})

-- Use buffer source for '/'
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Telescope setup
require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key"
      }
    }
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
  extensions = {
  }
}

-- Treesitter setup
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "cpp", "lua", "python", "rust" }, -- list of languages to install parsers for
  sync_install = false,
  highlight = {
    enable = true,
  },
}

-- Example keybindings for Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fm', ":lua require('telescope').extensions.media_files.media_files()<CR>", { noremap = true, silent = true })


