return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"zapling/mason-conform.nvim", -- Tự động cài đặt formatters từ Mason
	},
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				java = { "google-java-format" },
				go = { "goimports", "gofmt" },
			},
			-- Format khi lưu (tùy chọn)
			-- format_on_save = {
			-- 	lsp_fallback = true,
			-- 	async = false,
			-- 	timeout_ms = 500,
			-- },
		})

		-- Setup mason-conform để tự động cài các formatter ở trên
		require("mason-conform").setup()

		-- Keymap giống cũ của bạn
		vim.keymap.set({ "n", "v" }, "<S-M-F>", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "[F]ormat" })
	end,
}
