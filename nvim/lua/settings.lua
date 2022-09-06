local settings = {
	before_config = function() end,
	after_config = function() end,
	null_ls_sources = nil,
	nvim_lsp_servers = nil,
	file_find_cmd = nil,
}

local present, _ = pcall(require, "local")

if present then
	local overrides = require("local")

	for k, v in pairs(overrides) do
		settings[k] = v
	end
end

return settings
