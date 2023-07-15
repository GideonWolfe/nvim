local augend = require("dial.augend")
require("dial.config").augends:register_group {
    -- default augends used when no group name is specified
    default = {
        augend.integer.alias.decimal,  -- nonnegative decimal number (0, 1, 2, 3, ...)
        augend.integer.alias.hex,      -- nonnegative hex number  (0x01, 0x1a1f, etc.)
        augend.date.alias["%Y/%m/%d"], -- date (2022/02/19, etc.)
        augend.date.alias["%m/%d/%Y"], -- date (02/19/2022, etc.)
        augend.date.alias["%H:%M"],    -- time (4:32, etc.)
        augend.date.alias["%H:%M:%S"], -- time (4:32:01, etc.)
        augend.constant.alias.bool,    -- boolean value (true <-> false)
        augend.constant.alias.alpha,   -- lowercase alphabet
        augend.constant.alias.Alpha,   -- uppercase alphabet
        augend.semver.alias.semver,    -- semantic versions (0.3.0, 1.22.1, 3.9.1, ...)
    },
}
