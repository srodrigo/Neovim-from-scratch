return {
	spec = {
  		-- import your plugins
  		{ import = "plugins" },
  	},
  	-- Configure any other settings here. See the documentation for more details.
  	-- colorscheme that will be used when installing plugins.
  	install = { colorscheme = { "tokyonight" } },
  	-- automatically check for plugin updates
  	checker = { enabled = true },
	-- TODO: remove
  	-- "folke/neodev.nvim",
  	-- { "folke/neoconf.nvim", cmd = "Neoconf" },

	"nvim-lua/plenary.nvim", -- Useful lua functions used by lots of plugins
	"moll/vim-bbye",

	-- Colorschemes
	"folke/tokyonight.nvim",
	"lunarvim/darkplus.nvim",

	-- Snippets
	"L3MON4D3/LuaSnip", --snippet engine
	"rafamadriz/friendly-snippets", -- a bunch of snippets to use

	-- Markdown
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		ft = "markdown",
		config = function()
			vim.g.mkdp_auto_start = 1
		end,
	},

	-- HTML Autotag
	"windwp/nvim-ts-autotag",

	-- Surround
	{
		"tpope/vim-surround",

		-- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
		-- setup = function()
		--  vim.o.timeoutlen = 500
		-- end
	},
}
