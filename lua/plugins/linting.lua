return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- 1. Định nghĩa linter cho từng ngôn ngữ
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			go = { "golangci-lint" },
		}

		-- 2. Đảm bảo Neovim tìm thấy binary của Mason (Quan trọng nhất)
		-- Điều này giúp "which golangci-lint" hoạt động bên trong Neovim
		local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"
		if vim.fn.isdirectory(mason_bin) == 1 then
			vim.env.PATH = mason_bin .. ":" .. vim.env.PATH
		end

		-- 3. Tạo cơ chế chạy linter an toàn (không gây crash Neo-tree)
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				pcall(lint.try_lint)
			end,
		})

		-- Phím tắt để kiểm tra linter đang chạy (Hữu ích để debug)
		vim.keymap.set("n", "<leader>li", function()
			local names = lint._resolve_linter_by_ft(vim.bo.filetype)
			if #names > 0 then
				print("Linter for " .. vim.bo.filetype .. ": " .. table.concat(names, ", "))
			else
				print("No linter configured for " .. vim.bo.filetype)
			end
		end, { desc = "[L]int [I]nfo" })
	end,
}
