return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
        "williamboman/mason.nvim",
        "jay-babu/mason-null-ls.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.google_java_format,
                require("none-ls.diagnostics.eslint_d"),
            },
        })

        require("mason-null-ls").setup({
            automatic_installation = true,
        })
        vim.keymap.set("n", "<S-M-F>", vim.lsp.buf.format, {})
    end,
}
