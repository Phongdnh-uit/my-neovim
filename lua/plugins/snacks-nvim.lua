return {
	-- ui components
	{ "MunifTanjim/nui.nvim", lazy = true },

	{
		"folke/snacks.nvim",
		opts = {
			indent = { enabled = true },
			input = { enabled = true },
			notifier = { enabled = false },
			scope = { enabled = true },
			scroll = { enabled = true },
			statuscolumn = { enabled = false },
			toggle = { enabled = true },
			words = { enabled = true },
		},
	},
}
