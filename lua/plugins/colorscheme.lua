return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "frappe",
			background = {
				light = "latte",
				dark = "mocha",
			},
			dim_inactive = {
				enabled = false,
				shade = "dark",
				percentage = 0.15,
			},
			transparent_background = true,
			styles = {
				-- italic, bold, underline, undercurl, underdotted, none
				comments = { "italic" },
				functions = { "bold", "italic" },
				keywords = { "italic" },
				operators = { "bold" },
				conditionals = { "bold", "italic" },
				loops = { "bold" },
				booleans = { "bold", "italic", "underdotted" },
				numbers = { "bold" },
				types = { "italic", "bold" },
				strings = { "italic" },
				variables = {},
				properties = { "italic" },
			},
			integrations = {
				cmp = true,
				dap = true,
				dap_ui = true,
				diffview = true,
				dropbar = { enabled = true, color_mode = true },
				fidget = true,
				flash = true,
				fzf = true,
				gitsigns = true,
				grug_far = true,
				hop = true,
				indent_blankline = { enabled = true, colored_indent_levels = true },
				lsp_saga = true,
				lsp_trouble = true,
				markdown = true,
				mason = true,
				mini = { enabled = true, indentscope_color = "" },
				native_lsp = {
					enabled = true,
					virtual_text = {
						errors = { "italic" },
						hints = { "italic" },
						warnings = { "italic" },
						information = { "italic" },
					},
					underlines = {
						errors = { "underline" },
						hints = { "underline" },
						warnings = { "underline" },
						information = { "underline" },
					},
				},
				notify = true,
				nvimtree = true,
				rainbow_delimiters = true,
				render_markdown = true,
				semantic_tokens = true,
				telescope = { enabled = true, style = "nvchad" },
				treesitter = true,
				treesitter_context = true,
				which_key = true,
			},
			custom_highlights = function(colors)
				return {
					LineNr = { fg = colors.subtext1 },
					CursorLineNr = { fg = colors.maroon, bold = true },
				}
			end,
		})
		vim.o.background = "dark"
		vim.cmd.colorscheme("catppuccin")
	end,
}
