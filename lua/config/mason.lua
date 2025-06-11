require('mason').setup({

})

require('mason-lspconfig').setup({
    ensure_installed = {"gopls", "ts_ls", "jsonls", "rust-analyzer"}
})
