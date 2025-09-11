return {
	"olimorris/codecompanion.nvim",
	opts = {},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
		"ravitemer/mcphub.nvim",
	},
	config = function()
		require("codecompanion").setup({
			display = {
				action_palette = {
					opts = {
						show_default_actions = true,
						show_default_prompt_library = true,
					},
				},
				chat = {
					show_header_separator = true,
					separator = "─",
					show_context = true,
					show_token_count = true,
				},
			},
			strategies = {
				chat = {
					adapter = "copilot",
					keymaps = {
						send = {
							modes = { i = "<C-CR>", n = "<CR>" },
						},
					},
				},
				inline = {
					adapter = "copilot",
				},
				cmd = {
					adapter = "copilot",
				},
			},
			mcphub = {
				callback = "mcphub.extensions.codecompanion",
				opts = {
					make_vars = true,
					make_slash_commands = true,
					show_result_in_chat = true,
				},
			},
		})

		vim.keymap.set(
			{ "n", "v" },
			"<leader>cc",
			":CodeCompanionChat Toggle<CR>",
			{ noremap = true, silent = true, desc = "[C]ode [C]ompanion [C]hat" }
		)
		vim.keymap.set(
			{ "n", "v" },
			"<leader>a",
			":CodeCompanionActions<CR>",
			{ noremap = true, silent = true, desc = "[C]ode [A]ctions" }
		)
		vim.keymap.set(
			{ "v" },
			"<leader>ga",
			":CodeCompanionChat Add<CR>",
			{ noremap = true, silent = true, desc = "[C]ode [C]ompanion [C]hat [A]dd" }
		)
	end,
}
