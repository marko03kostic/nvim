return {
    'neovim/nvim-lspconfig',
    config = function()
	require('lspconfig').pylsp.setup{}
	require('lspconfig').clangd.setup{}

	require('lspconfig').gopls.setup({
	  cmd = { "gopls" },
	  settings = {
	    gopls = {
	      gofumpt = true,
	    },
	  },
	})

	require('lspconfig').zls.setup({
	  cmd = { "zls" },
	  settings = {
	      zls = {
		  formatting = true,
	    },
	  },
	})

	require('lspconfig').ts_ls.setup({ })
    end,
}
