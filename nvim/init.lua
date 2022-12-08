local settings = require("settings")

settings.before_config()

require("plugins")

require("opts")
require("config")
require("mappings")
require("autocmds")

settings.after_config()
