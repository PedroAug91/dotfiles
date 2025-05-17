return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function ()
            local path = vim.fn.expand("~/.local/share/nvim/parsers")
            vim.opt.runtimepath:append(path)

            local opts = {
                parser_install_dir = path,
                ensure_installed = {
                    "javascript", "typescript", "html", "htmldjango",
                    "c", "cpp", "python", "bash", "gitignore", "yaml",
                    "dockerfile", "lua", "markdown", "markdown_inline",
                    "sql", "css",
                },
                auto_install = false,
                highlight = { enable = true, },
                indent = { enable = true },
                additional_vim_regex_highlighting = false,
            }

            require("nvim-treesitter.configs").setup(opts)
        end
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
}
