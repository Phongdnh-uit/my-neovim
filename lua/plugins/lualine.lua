return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "material",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{
						"mode",
						icons_enabled = true,
						icon = " ",
						--   separator = { left = '', right = ''}
						padding = 1,
					},
				},

				lualine_b = {
					{
						"branch",
						icon = { "", color = { fg = "#FDAB9E" } },
					},
					{
						"diff",
						icon = { "" , color = {fg = "#F5004F"}},
						colored = true,
					},
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
				lualine_y = {
					{ "progress", icon = { "" , color={fg="#FFEB00"}} },
				},

				lualine_z = {
					{
						"location",
						icon = "",
					},
				},
			},
		})
	end,
}
