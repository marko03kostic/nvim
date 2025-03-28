vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.api.nvim_set_keymap('n', '<leader>`', ':e ~/.config/nvim/<CR>', { noremap = true, silent = true , desc = "Nvim config"})

vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>Y', '"+yy', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>P', '"+P', { noremap = true, silent = true })

require("config.lazy")
require("config.lualine")
require("config.material")
require("config.nvim-tree")
require("config.telescope-fzf-finder")
require("config.telescope")
