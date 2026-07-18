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
			local mason_lspconfig = require("mason-lspconfig")

			mason_lspconfig.setup({
				automatic_installation = true,
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- java config
			-- vim.lsp.enable("jdtls")
			-- lspconfig.jdtls.setup({
			--     settings = {
			--         java = {
			--             configuration = {
			--                 runtimes = {
			--                     {
			--                         name = "JavaSE-24",
			--                         path = "/home/dang-phong/.sdkman/candidates/java/current",
			--                         default = true,
			--                     }
			--                 }
			--             }
			--         }
			--     }
			-- })

			-- cpp config
			-- vim.lsp.config("clangd", {})
			-- vim.lsp.enable("clangd")

			-- lua config
			vim.lsp.config("lua_ls", {})
			vim.lsp.enable("lua_ls")

			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
			})
			vim.lsp.enable("ts_ls")

			-- eslint config
			vim.lsp.config("eslint", {
				capabilities = capabilities,
			})
			vim.lsp.enable("eslint")

			-- tailwindcss config
			vim.lsp.config("tailwindcss", {})
			vim.lsp.enable("tailwindcss")

			-- go config
			vim.lsp.config("gopls", {})
			vim.lsp.enable("gopls")

			-- yaml config
			vim.lsp.config("yamlls", {
				settings = {
					yaml = {
						schemas = {
							["https://raw.githubusercontent.com/compose-spec/compose-go/master/schema/compose-spec.json"] = "docker-compose*.yml",
							["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
						},
						validate = true,
						format = {
							enable = true,
						},
						completion = true,
					},
				},
			})
			vim.lsp.enable("yamlls")

			-- vim.lsp.config("terraformls",{})
			-- vim.lsp.enable("terraformls")

			-- Rust config
			vim.lsp.config("rust_analyzer", {})
			vim.lsp.enable("rust_analyzer")

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
