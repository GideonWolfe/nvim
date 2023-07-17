-- Use the global icon set
local icons = require('core.icons')
require("notify").setup({
    -- background_colour = "NotifyBackground",
    -- fps = 30,
    icons = {
        DEBUG = "",
        ERROR = icons.diagnostics.Error,
        INFO = icons.diagnostics.Information,
        TRACE = "✎",
        WARN = icons.diagnostics.Warning
    },
    level = 2,
    minimum_width = 50,
    render = "default",
    stages = "static",
    timeout = 5000,
    top_down = true

})
