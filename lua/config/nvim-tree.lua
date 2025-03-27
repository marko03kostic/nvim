vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>q', ':NvimTreeClose<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>c', ':NvimTreeCollapse<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
