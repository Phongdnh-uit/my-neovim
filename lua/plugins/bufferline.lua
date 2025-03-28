return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				offsets = {
					{
						separator_style = "thick",
						filetype = "neo-tree",
						text = function()
							return " " .. vim.fn.getcwd()
						end,
						text_align = "center",
						separator = true,
						highlight = "Directory",
					},
				},
				color_icons = true,
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				highlights = {
					indicator_visible = {
						fg = "#14a8c6",
						bg = "#14a8c6",
					},
				},
				custom_areas = {
					right = function()
						local result = {}
						local seve = vim.diagnostic.severity
						local error = #vim.diagnostic.get(0, { severity = seve.ERROR })
						local warning = #vim.diagnostic.get(0, { severity = seve.WARN })
						local info = #vim.diagnostic.get(0, { severity = seve.INFO })
						local hint = #vim.diagnostic.get(0, { severity = seve.HINT })

						if error ~= 0 then
							table.insert(result, { text = "  " .. error, link = "DiagnosticError" })
						end

						if warning ~= 0 then
							table.insert(result, { text = "  " .. warning, link = "DiagnosticWarn" })
						end

						if hint ~= 0 then
							table.insert(result, { text = "  " .. hint, link = "DiagnosticHint" })
						end

						if info ~= 0 then
							table.insert(result, { text = "  " .. info, link = "DiagnosticInfo" })
						end
						return result
					end,
				},
			},
		})
	end,
}
