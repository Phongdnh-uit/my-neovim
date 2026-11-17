return {
	"b0o/incline.nvim",
	event = "BufReadPre",
	priority = 1200,
	config = function()
		local devicons = require("mini.icons")
		require("incline").setup({
			window = {
				padding = 0,
				margin = { horizontal = 0, vertical = 0 },
			},
			render = function(props)
				local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
				if filename == "" then
					filename = "[No Name]"
				end
				local ft_icon, ft_color = devicons.get("file", filename)
				local modified = vim.bo[props.buf].modified
				return {
					ft_icon and { " ", ft_icon, " ", guifg = ft_color } or "",
					{ " " .. filename .. " " },
					modified and { " [+] ", guifg = "#f38ba8", gui = "bold" } or "",
					guibg = "#313244",
				}
			end,
		})
	end,
}
