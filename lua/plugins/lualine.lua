return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				theme = "catppuccin",
				disabled_filetypes = {},
				component_separators = { left = "", right = "" },
				-- section_separators = { left = " ", right = "" },
				section_separators = { right = "", left = "" },
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
						icon = { "", color = { fg = "#F5004F" } },
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
				lualine_x = {
					function()
						local ok, pomo = pcall(require, "pomo")
						if not ok then
							return ""
						end

						local timer = pomo.get_first_to_finish()
						if timer == nil then
							return ""
						end

						return "⏳ " .. tostring(timer)
					end,
					"encoding",
					"fileformat",
					"filetype",
				},
				lualine_y = {
					{ "progress", icon = { "", color = { fg = "#FFEB00" } } },
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
