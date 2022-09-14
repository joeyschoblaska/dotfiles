local settings = {
	before_config = function() end,
	after_config = function() end,
	null_ls_sources = function(null_ls)
		return nil
	end,
	nvim_lsp_servers = nil,
	file_find_cmd = nil,
	telescope_layout_strategy = nil,
	fzf_lua_layout_strategy = nil,
	lualine_context_fn = nil,
}

local present, _ = pcall(require, "local")

if present then
	local overrides = require("local")
	for k, v in pairs(overrides) do
		settings[k] = v
	end
end

return settings
