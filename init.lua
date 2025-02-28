-- Bootstrap pckr.nvim
local function bootstrap_pckr()
  local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

  if not (vim.uv or vim.loop).fs_stat(pckr_path) then
    vim.fn.system({
      'git',
      'clone',
      "--filter=blob:none",
      'https://github.com/lewis6991/pckr.nvim',
      pckr_path
    })
  end

  vim.opt.rtp:prepend(pckr_path)
end

bootstrap_pckr()

require('pckr').add {
  'lewis6991/pckr.nvim',  -- Let pckr manage itself

  -- Add your desired plugins
  {'morhetz/gruvbox'},
  {'VonHeikemen/lsp-zero.nvim'},
  {'neovim/nvim-lspconfig'},
  {'nvim-lua/plenary.nvim'},
  {'nvim-telescope/telescope.nvim'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-cmdline'},
  {'hrsh7th/cmp-vsnip'},  -- Uncomment if using vsnip
  {'hrsh7th/vim-vsnip'},  -- Uncomment if using vsnip
  {'fatih/vim-go'},
    -- Uncomment these if using luasnip
    -- {'L3MON4D3/LuaSnip'},
    -- {'saadparwaiz1/cmp_luasnip'},
  -- Add other plugins here
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',  -- Automatically run TSUpdate after installation
  },
}

vim.opt.termguicolors = true
vim.cmd('colorscheme gruvbox')

-- Configure nvim-treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",  -- Install all parsers
  highlight = {
    enable = true,           -- Enable highlighting
    additional_vim_regex_highlighting = false,
  },
}

local cmp = require('cmp')

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)  -- For luasnip users
        end,
    },
    mapping = {
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm { select = true },
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
    },
})

-- LSP Configuration
local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
  local opts = { noremap=true, silent=true }
    -- Set a keymap for going to definition
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
end)

require('lspconfig').jdtls.setup{}
require('lspconfig').pylsp.setup{}
require('lspconfig').clangd.setup{}

-- Configure Go Language Server (gopls)
require('lspconfig').gopls.setup({
  cmd = { "gopls" },  -- Ensure gopls is in your PATH
  settings = {
    gopls = {
      gofumpt = true,  -- Use gofumpt for stricter formatting
    },
  },
})

-- Configure Zig Language Server (zls)
require('lspconfig').zls.setup({
  cmd = { "zls" },
  settings = {
      zls = {
          formatting = true,
    },
  },
})

require('lspconfig').ts_ls.setup({ })

-- Auto-save on text changes (after typing stops)
vim.api.nvim_create_autocmd({"TextChanged", "TextChangedI"}, {
  pattern = "*",
  callback = function()
    vim.cmd("silent! write")  -- Silent save to avoid confirmation prompts
  end
})

-- Go to next tab (Ctrl + PageDown)
vim.api.nvim_set_keymap('n', '<C-Tab>', ':tabnext<CR>', { noremap = true, silent = true })

-- Go to previous tab (Ctrl + PageUp)
vim.api.nvim_set_keymap('n', '<C-S-Tab>', ':tabprevious<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-S-w>', ':tabclose<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-n>', ':tabnew<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('v', '<C-c>', ':\'<,\'>w !wl-copy<CR><CR>', { noremap = true, silent = true})

vim.opt.list = true                           -- Show hidden characters
vim.opt.listchars = { tab = "▸ ", space = "·" }  -- Customize characters for tabs and spaces
vim.opt.number = true               -- Show absolute line numbers
vim.opt.relativenumber = true       -- Show relative line numbers

vim.opt.guifont = "Hack:h30"
vim.opt.tabstop = 4       -- Number of spaces in a tab
vim.opt.shiftwidth = 4     -- Number of spaces for (auto)indent
vim.opt.expandtab = true   -- Use spaces instead of tabs
