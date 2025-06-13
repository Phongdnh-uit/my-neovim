return {
    "epwalsh/pomo.nvim",
    version = "*",
    lazy = true,
    cmd = { "TimerStart", "TimerRepeat", "TimerSession" },
    dependencies = {
        "rcarriga/nvim-notify",
    },
    config = function()
        local timer = require("pomo")
        timer.setup({
            update_interval = 1000,
            notifiers = {
                {
                    name = "Default",
                    opts = {
                        sticky = false,
                        -- title_icon = "󱎫",
                        -- text_icon = "󰄉",
                        title_icon = "⏳",
                        text_icon = "⏱️",
                    },
                },
            },
            sessions = {
                pomodoro = {
                    { name = "Work",        duration = "25m" },
                    { name = "Short Break", duration = "5m" },
                    { name = "Work",        duration = "25m" },
                    { name = "Short Break", duration = "5m" },
                    { name = "Work",        duration = "25m" },
                    { name = "Long Break",  duration = "15m" },
                },
            },
        })
    end,
}
