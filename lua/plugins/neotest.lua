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
                -- TODO: record binds. List of mappings here, 
                -- https://github.com/nvim-neotest/neotest/blob/901891484db3d46ce43d56871273dc7d40621356/doc/neotest.txt#L166C1-L166C1
            }
        end
    },

    {
        "nvim-neotest/neotest-python",
    },

    {
        "Issafalcon/neotest-dotnet",
    },
}
