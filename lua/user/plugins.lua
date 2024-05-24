local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	use({ "wbthomason/packer.nvim", commit = "ea0cc3c59f67c440c5ff0bbe4fb9420f4350b9a3" }) -- Have packer manage itself
	use({ "nvim-lua/plenary.nvim", commit = "a3e3bc82a3f95c5ed0d7201546d5d2c19b20d683" }) -- Useful lua functions used by lots of plugins
	use({ "windwp/nvim-autopairs", commit = "c15de7e7981f1111642e7e53799e1211d4606cb9" }) -- Autopairs, integrates with both cmp and treesitter
	use({ "numToStr/Comment.nvim", commit = "0236521ea582747b58869cb72f70ccfa967d2e89" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring", commit = "cb064386e667def1d241317deed9fd1b38f0dc2e" })
	use({ "kyazdani42/nvim-web-devicons", commit = "e37bb1feee9e7320c76050a55443fa843b4b6f83" })
	use({ "kyazdani42/nvim-tree.lua", commit = "2bc725a3ebc23f0172fb0ab4d1134b81bcc13812" })
	use({ "akinsho/bufferline.nvim", commit = "99337f63f0a3c3ab9519f3d1da7618ca4f91cffe", requires = 'nvim-tree/nvim-web-devicons' })
	use({ "moll/vim-bbye", commit = "25ef93ac5a87526111f43e5110675032dbcacf56" })
	use({ "nvim-lualine/lualine.nvim", commit = "0a5a66803c7407767b799067986b4dc3036e1983" })
	use({ "akinsho/toggleterm.nvim", commit = "fee58a0473fd92b28c34f8f724e4918b15ba30a3" })
	use({ "ahmedkhalf/project.nvim", commit = "8c6bad7d22eef1b71144b401c9f74ed01526a4fb" })
	use({ "lewis6991/impatient.nvim", commit = "47302af74be7b79f002773011f0d8e85679a7618" })
	use({ "lukas-reineke/indent-blankline.nvim", commit = "d98f537c3492e87b6dc6c2e3f66ac517528f406f" })
	use({ "goolord/alpha-nvim", commit = "41283fb402713fc8b327e60907f74e46166f4cfd" })
	use({ "folke/which-key.nvim" })

	-- Colorschemes
	use({ "folke/tokyonight.nvim", commit = "b9b494fa7f7bbf2fe0747b47fa290fb7a4eddcc7" })
	use({ "lunarvim/darkplus.nvim", commit = "75548e02e34ee21e8bdef1739f96f19125160000" })

	-- Cmp
	use({ "hrsh7th/nvim-cmp", commit = "5260e5e8ecadaf13e6b82cf867a909f54e15fd07" }) -- The completion plugin
	use({ "hrsh7th/cmp-buffer", commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa" }) -- buffer completions
	use({ "hrsh7th/cmp-path", commit = "91ff86cd9c29299a64f968ebb45846c485725f23" }) -- path completions
	use({ "saadparwaiz1/cmp_luasnip", commit = "05a9ab28b53f71d1aece421ef32fee2cb857a843" }) -- snippet completions
	use({ "hrsh7th/cmp-nvim-lsp", commit = "39e2eda76828d88b773cc27a3f61d2ad782c922d" })
	use({ "hrsh7th/cmp-nvim-lua", commit = "f12408bdb54c39c23e67cab726264c10db33ada8" })

	-- Snippets
	use({ "L3MON4D3/LuaSnip", commit = "878ace11983444d865a72e1759dbcc331d1ace4c" }) --snippet engine
	use({ "rafamadriz/friendly-snippets", commit = "dd2fd1281d4b22e7b4a5bfafa3e142d958e251f2" }) -- a bunch of snippets to use

	-- LSP
	use({ "neovim/nvim-lspconfig", commit = "b972e7154bc94ab4ecdbb38c8edbccac36f83996" }) -- enable LSP
	use({ "williamboman/mason.nvim", commit = "49ff59aded1047a773670651cfa40e76e63c6377" }) -- simple to use language server installer
	use({ "williamboman/mason-lspconfig.nvim", commit = "a4caa0d083aab56f6cd5acf2d42331b74614a585" })
	use({ "jose-elias-alvarez/null-ls.nvim", commit = "0010ea927ab7c09ef0ce9bf28c2b573fc302f5a7" }) -- for formatters and linters
	use({ "RRethy/vim-illuminate", commit = "5eeb7951fc630682c322e88a9bbdae5c224ff0aa" })
	use({ "ckipp01/stylua-nvim", run = "cargo install stylua", commit = "ce59a353f02938cba3e0285e662fcd3901cd270f" })
	use({ "simrat39/rust-tools.nvim", commit = "676187908a1ce35ffcd727c654ed68d851299d3e" })

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", commit = "5665d93988acfbb0747bdbf4f4cb583bcebc8930" })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = "8012b55eee65eba1d1ee4df0a186d30e72dcbe65",
	})

	-- Outline
	use({ "stevearc/aerial.nvim", commit = "bd5f141a547c082e9c1644026f38590407dad659" })

	-- Markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		ft = "markdown",
		config = function()
			vim.g.mkdp_auto_start = 1
		end,
	})

	-- HTML Autotag
	use({ "windwp/nvim-ts-autotag", commit = "8ae54b90e36ef1fc5267214b30c2cbff71525fe4" })

	-- Surround
	use({
		"tpope/vim-surround",

		-- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
		-- setup = function()
		--  vim.o.timeoutlen = 500
		-- end
	})

	-- Git
	use({ "lewis6991/gitsigns.nvim", commit = "cdfcd9d39d23c46ae9a040de2c6a8b8bf868746e" })
	use({ "sindrets/diffview.nvim", commit = "1ec7b56b959dab18f7030f541c33ae60e18a6f88" })
	use({ "tpope/vim-fugitive", commit = "4f59455d2388e113bd510e85b310d15b9228ca0d" })

	-- Testing
	use({
		"nvim-neotest/neotest-vim-test",
		commit = "75c4228882ae4883b11bfce9b8383e637eb44192",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-plenary",
			"nvim-neotest/neotest-vim-test",
			"antoinemadec/FixCursorHold.nvim",
			"haydenmeade/neotest-jest",
			"rouge8/neotest-rust",
		},
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
