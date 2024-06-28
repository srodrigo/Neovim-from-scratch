local function add_missing_imports()
	local params = {
		command = "_typescript.addMissingImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

local function fix_all()
	local params = {
		command = "_typescript.fixAll",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

return {
	commands = {
		AddMissingImports = {
			add_missing_imports,
			description = "Add Missing Imports",
		},
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
		FixAll = {
			fix_all,
			description = "Fix All",
		},
	},
}
