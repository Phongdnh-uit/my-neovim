return {
	-- ui components
	{ "MunifTanjim/nui.nvim", lazy = true },

	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			indent = { enabled = true },
			input = { enabled = true },
			notifier = { enabled = false },
			picker = { enabled = true },
			scope = { enabled = true },
			scroll = { enabled = false },
			statuscolumn = { enabled = false },
			toggle = { enabled = true },
			words = { enabled = true },
		},
		keys = {
			-- Pickers (matching previous Telescope keymaps)
			{
				"<leader>ff",
				function()
					Snacks.picker.files()
				end,
				desc = "Find Files",
			},
			{
				"<leader>fg",
				function()
					Snacks.picker.grep()
				end,
				desc = "Live Grep",
			},
			{
				"<leader>fb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "Buffers",
			},
			{
				"<leader>ht",
				function()
					Snacks.picker.help()
				end,
				desc = "Help Tags",
			},
			{
				"<leader>gc",
				function()
					Snacks.picker.git_log()
				end,
				desc = "Git Commits",
			},
			{
				"<leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "Git Status",
			},
		},
	},
}
