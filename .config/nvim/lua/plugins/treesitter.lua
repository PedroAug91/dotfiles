return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function ()
            local opts = {
                -- ensure_installed = {
                --     "c",
                --     "cpp",
                --     "python",
                --     "json5",
                --     "json",
                --     "javascript",
                --     "typescript",
                --     "lua",
                --     "luadoc",
                --     "html",
                --     "htmldjango",
                --     "css",
                --     "dockerfile",
                --     "yaml",
                --     "sql",
                --     "gitignore",
                --     "bash"
                -- },
                parser_install_dir = vim.fn.expand("~/.local/share/nvim/parsers"),
                auto_install = false,
                highlight = {
                    enable = true,
                },
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
