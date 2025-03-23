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
                ensure_installed = { "lua_ls", "ts_ls", "eslint", "jdtls" },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({})
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.eslint.setup({
                on_attach = function(client, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
                    })
                end,
            })
            require("java").setup({})
            lspconfig.jdtls.setup({
                settings = {
                    java = {
                        configuration = {
                            runtimes = {
                                {
                                    name = "JavaSE 23",
                                    path = "/usr/lib/jvm/jdk-23.0.1-oracle-x64",
                                    default = true,
                                },
                            },
                        },
                    },
                },
            })
            lspconfig.tailwindcss.setup({})
            local nmap = function(keys, func, desc)
                if desc then
                    desc = "LSP: " .. desc
                end

                vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
            end

            -- Useful LSP Keymaps
            nmap("<leader>gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
            nmap("<leader>gr", vim.lsp.buf.references, "[G]oto [R]eferences")
            nmap("<leader>gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
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
        end,
    },
}
