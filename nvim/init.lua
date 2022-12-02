local settings = require("settings")

if vim.g.vscode then
	-- VSCode extension
else
	settings.before_config()

	require("plugins")

	require("opts")
	require("config")
	require("mappings")
	require("autocmds")

	settings.after_config()
end
