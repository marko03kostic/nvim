require('mason').setup({

})

require('mason-lspconfig').setup({
    ensure_installed = {"zls", "gopls", "ts_ls"}
})
