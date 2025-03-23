return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "dracula",
			},
			sections = {
				lualine_b = {
					{
						"branch",
						icon = " ",
					},
					"diff",
				},
				lualine_c = {
					{
						"diagnostics",
						symbols = { error = " ", warn = " ", info = " ", hint = " " },
					},
					{
						"lsp_status",
						icon = " ",
						ignore_lsp = {
							"null-ls",
						},
					},
				},
			},
		})
	end,
}
