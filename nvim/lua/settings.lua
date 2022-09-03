local default_settings = {
	before_config = function() end,
	after_config = function() end,
}

local present, _ = pcall(require, "local")

if present then
	local overrides = require("local")

	for k, v in pairs(overrides) do
		default_settings[k] = v
	end
end

return default_settings