local settings = require("settings")

settings.before_config()

require("plugins")
require("diagnostic_lines")

require("opts")
require("config")
require("colors.catppuccin")
require("mappings")
require("autocmds")

settings.after_config()
