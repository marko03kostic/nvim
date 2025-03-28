vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.api.nvim_set_keymap('n', '<leader>`', ':e ~/.config/nvim/<CR>', { noremap = true, silent = true , desc = "Nvim config"})

vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>Y', '"+yy', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>P', '"+P', { noremap = true, silent = true })

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_set_keymap('n', '<Leader>h', '<C-w>h', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>j', '<C-w>j', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>k', '<C-w>k', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>l', '<C-w>l', { noremap = true, silent = true })

require("config.lazy")
require("config.lualine")
require("config.material")
require("config.nvim-tree")
require("config.telescope-fzf-finder")
require("config.telescope")
