return {
	-- LSP
	"neovim/nvim-lspconfig", -- enable LSP
	"williamboman/mason.nvim", -- simple to use language server installer
	"williamboman/mason-lspconfig.nvim",
	"jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
	"RRethy/vim-illuminate",
	"ckipp01/stylua-nvim",
	build = "cargo install stylua",
	"simrat39/rust-tools.nvim",

	config = function()
		require('lsp')
	end
}
