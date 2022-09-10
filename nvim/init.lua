local settings = require("settings")

settings.before_config()

require("plugins")

require("opts")
require("colors.catppuccin")
require("mappings")
require("autocmds")

settings.after_config()
