return {
	"nvim-neotest/neotest-vim-test",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-plenary",
		"nvim-neotest/neotest-vim-test",
		"antoinemadec/FixCursorHold.nvim",
		"haydenmeade/neotest-jest",
		"rouge8/neotest-rust",
	},

	config = function()
		local status_ok, neotest = pcall(require, "neotest")
		if not status_ok then
			return
		end

		neotest.setup({
			adapters = {
				require("neotest-jest")({
					jestCommand = "npm test --",
					env = { CI = true },
					cwd = function(path)
						return vim.fn.getcwd()
					end,
				}),
				require("neotest-rust"),
				require("neotest-plenary"),
				require("neotest-vim-test")({
					-- ignore_file_types = { "python", "vim", "lua" },
				}),
			},
		})

		neotest_run_on_save = true

		vim.cmd([[
			augroup neotest
				autocmd!
				autocmd BufWritePost  '<cmd><cr>'
			augroup end
		]])

		vim.api.nvim_create_autocmd("BufWritePost", {
			group = "neotest",
			pattern = {
				"*.spec.js",
				"*.test.js",
				"*.spec.jsx",
				"*.test.jsx",
				"*.spec.ts",
				"*.test.ts",
				"*.spec.tsx",
				"*.test.tsx",
			},
			callback = function()
				if neotest_run_on_save then
					require("neotest").run.run(vim.fn.expand("%"))
				end
			end,
		})
	end
}
