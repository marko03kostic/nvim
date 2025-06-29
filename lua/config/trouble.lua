vim.api.nvim_set_keymap('n', '<leader>xx', ':Trouble diagnostics toggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xX', ':Trouble diagnostics toggle filter.buf=0<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cs', ':Trouble symbols toggle focus=false<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cl', ':Trouble lsp toggle focus=false win.position=right<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xL', ':Trouble loclist toggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xQ', ':Trouble qflist toggle<CR>', { noremap = true, silent = true })
