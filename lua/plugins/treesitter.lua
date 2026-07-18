return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = { "java" },
			auto_install = true,
			highlight = {
				enable = true,
				disable = { "latex", "tex" },
				additional_vim_regex_highlighting = { "latex", "markdown" },
			},
			indent = { enable = true },
			fold = { enable = true },
		})
	end,
}
