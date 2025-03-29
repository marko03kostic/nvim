return {
    'neovim/nvim-lspconfig',
  lazy = false, -- REQUIRED: tell lazy.nvim to start this plugin at startup
  dependencies = {
    -- main one
    { "ms-jpq/coq_nvim", branch = "coq" },

    -- 9000+ Snippets
    { "ms-jpq/coq.artifacts", branch = "artifacts" },

    -- lua & third party sources -- See https://github.com/ms-jpq/coq.thirdparty
    -- Need to **configure separately**
    { 'ms-jpq/coq.thirdparty', branch = "3p" }
    -- - shell repl
    -- - nvim lua api
    -- - scientific calculator
    -- - comment banner
    -- - etc
  },
  init = function()
    vim.g.coq_settings = {
        auto_start = true, -- if you want to start COQ at startup
        -- Your COQ settings here
    }
  end,
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
