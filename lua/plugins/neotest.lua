return {
    {
        "nvim-neotest/neotest",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "antoinemadec/FixCursorHold.nvim"
        },
        config = function ()
            local customIcons = require("core.icons")
            local mySpinners = {
                bars = {"▁", "▂", "▃", "▄", "▅", "▆", "▇", "█", "▇", "▆", "▅", "▄", "▃", "▁"},
                square = {"◰","◳","◲","◱"},
                circle = {"◴","◷","◶","◵"},
                diamond = {"◇","◈","◆"},
            }
            require('neotest').setup{
                adapters = {
                  require("neotest-python")
                },
                icons = {
                    passed = customIcons.ui.Check,
                    failed = customIcons.ui.Close,
                    watching = customIcons.misc.Watch,
                    unknown = customIcons.diagnostics.Question,
                    running_animated = mySpinners.diamond
                }
            }
        end
    },

    {
        "nvim-neotest/neotest-python",
    }

}
