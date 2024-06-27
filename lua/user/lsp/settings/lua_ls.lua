return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					library = { vim.env.VIMRUNTIME },
					checkThirdParty = false,
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
