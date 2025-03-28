vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.api.nvim_set_keymap('n', '<leader>`', ':e ~/.config/nvim/<CR>', { noremap = true, silent = true , desc = "Nvim config"})

require("config.lazy")
require("config.lualine")
require("config.material")
require("config.nvim-tree")
require("config.telescope-fzf-finder")
require("config.telescope")
