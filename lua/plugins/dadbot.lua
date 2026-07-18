return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		-- Your DBUI configuration
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_show_database_icon = 1

		vim.g.db_ui_win_position = "right"
		vim.g.db_ui_winwidth = 40

		vim.g.db_ui_use_nvim_notify = 1
	end,
}
-- { -- optional saghen/blink.cmp completion source
-- 	"saghen/blink.cmp",
-- 	opts = {
-- 		sources = {
-- 			default = { "lsp", "path", "snippets", "buffer" },
-- 			per_filetype = {
-- 				sql = { "snippets", "dadbod", "buffer" },
-- 			},
-- 			-- add vim-dadbod-completion to your completion providers
-- 			providers = {
-- 				dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
-- 			},
-- 		},
-- 	},
-- }
