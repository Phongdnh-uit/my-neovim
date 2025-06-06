return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "eslint", "jdtls", "gopls", "rust_analyzer" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

			-- cpp config
			lspconfig.clangd.setup({})

			-- lua config
			lspconfig.lua_ls.setup({})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

			-- eslint config
			lspconfig.eslint.setup({
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						command = "EslintFixAll",
					})
				end,
			})

			-- tailwindcss config
			lspconfig.tailwindcss.setup({})

			-- go config
			lspconfig.gopls.setup({})

			-- rust config
			lspconfig.rust_analyzer.setup({
				settings = {
					["rust-analyzer"] = {
						cargo = {
							allFeatures = true,
						},
						checkOnSave = {
							command = "clippy",
						},
					},
				},
			})

			-- yaml config
			lspconfig.yamlls.setup({
				settings = {
					yaml = {
						schemas = {
							["https://json.schemastore.org/docker-compose.json"] = "docker-compose*.yml",
						},
						validate = true,
						format = {
							enable = true,
						},
						completion = true,
					},
				},
			})
			local nmap = function(keys, func, desc)
				if desc then
					desc = "LSP: " .. desc
				end

				vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
			end

			-- Useful LSP Keymaps
			nmap("<leader>gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
			nmap("<leader>gr", vim.lsp.buf.references, "[G]oto [R]eferences")
			nmap("<leader>gi", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
			nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
			nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
			nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
			nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
			nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
			nmap("<leader>lr", vim.lsp.codelens.run, "[R]un [C]odelens")

			-- See `:help K` for why this keymap
			nmap("<leader>K", vim.lsp.buf.hover, "Hover Documentation")
			nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation")

			-- Diagnostics
			nmap("gl", vim.diagnostic.open_float, "[O]pen [D]iagnostics")
			nmap("[d", vim.diagnostic.goto_prev, "[G]oto [P]revious Diagnostics")
			nmap("]d", vim.diagnostic.goto_next, "[G]oto [N]ext Diagnostics")
			vim.diagnostic.config({
				virtual_text = {
					prefix = " ",
					suffix = " 🤨",
					spacing = 4,
				},
				severity_sort = true,
				float = {
					severity_sort = true,
					border = "rounded",
				},
			})
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

			vim.lsp.handlers["textDocument/signatureHelp"] =
				vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
		end,
	},
}
