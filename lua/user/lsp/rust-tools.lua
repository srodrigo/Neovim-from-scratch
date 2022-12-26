local status_ok, rust_tools = pcall(require, "rust-tools")
if not status_ok then
	return
end

rust_tools.setup({
	tools = {
		hover_actions = {
			auto_focus = true,
		},
	},
	server = {
		standalone = true,
	},
})
