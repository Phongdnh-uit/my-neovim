return {
	"rcarriga/nvim-notify",
	version = "*",
	config = function()
		local notify = require("notify")
		notify.setup({
			fps = 60,
			timeout = 500,
			stages = "fade_in_slide_out",
		})
		vim.notify = notify
	end,
}
