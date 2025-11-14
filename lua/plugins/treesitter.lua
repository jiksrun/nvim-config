return {
    "nvim-treesitter/nvim-treesitter",
    opts = {
        ensure_installed = {
            "bash",
            "html",
            "css",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "c",
            "cpp",
            "query",
            "regex",
            "tsx",
            "typescript",
            "vim",
            "yaml",
            "java",
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = true
        },
        indent = {
            enable = true,
        },
        autotag = {
            enable = true,
        }
    },
}
