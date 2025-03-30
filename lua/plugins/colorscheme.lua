return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "frappe",
			background = {
				light = "latte",
				dark = "frappe",
			},
			transparent_background = true,
			integrations = {
				treesitter = true,
				telescope = true,
				gitsigns = true,
				cmp = true,
				lsp_saga = true,
				fidget = true,
				indent_blankline = { enabled = true },
				navic = { enabled = true, custom_bg = "NONE" },
			},
		})
		vim.cmd.colorscheme("catppuccin")
	end,
}
