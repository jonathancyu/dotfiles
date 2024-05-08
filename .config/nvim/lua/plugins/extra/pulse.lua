return {
    'linguini1/pulse.nvim',
    version = "*", -- Latest stable release
    config = function()
        local pulse = require("pulse")
        pulse.setup()
        pulse.add('break-timer', {
            interval = 30,
            message = 'Take a break',
            enabled = true
        })
    end
}
