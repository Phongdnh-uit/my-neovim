return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_install = { "java", "html", "javascript" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            fold = { enable = true },
        })

        vim.cmd([[
        set foldmethod=expr
        set foldexpr=nvim_treesitter#foldexpr()
        set nofoldenable
      ]])
    end,
}
