return {
	"saghen/blink.cmp",
	dependencies = {
		"saghen/blink.lib",
		-- optional: provides snippets for the snippet source
		"rafamadriz/friendly-snippets",
	},
	build = function()
		-- build the fuzzy matcher, optionally add a timeout to `pwait(timeout_ms)`
		-- you can use `gb` in `:Lazy` to rebuild the plugin as needed
		require("blink.cmp").build():pwait()
	end,

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = {
			-- preset = "default",
			preset = "none",
			["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },
		},

		completion = {
			documentation = {
				enabled = true,
				auto_show = true,
				auto_show_delay_ms = 500,
			},
			ghost_text = {
				show_with_menu = true,
			},
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			per_filetype = {
				sql = { "snippets", "dadbod", "buffer" },
			},
			providers = {
				dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
			},
		},

		fuzzy = { implementation = "rust" },

		cmdline = {
			-- enabled = true, -- default is true, set to false to disable cmdline completion
			completion = {
				ghost_text = { enabled = true },
				menu = { auto_show = true },
			},
		},

		snippets = {},

		appearance = {
			nerd_font_variant = "mono",
		},
	},
}
