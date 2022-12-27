local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	return
end

neotest.setup({
	adapters = {
		require("neotest-jest")({
			jestCommand = "npm test --",
			jestConfigFile = "custom.jest.config.ts",
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
