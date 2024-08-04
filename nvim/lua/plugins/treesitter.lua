return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        build = ":TSUpdate",
        opts = {
            ensure_installed = {
                "cpp", "c", "python",
                "json5", "javascript", "json",
                "typescript", "lua", "luadoc",
                "php", "php_only", "phpdoc",
                "htmldjango", "html", "css",
                "dockerfile", "yaml", "sql",
                "gitignore", "bash"
            },
            auto_install = true,
            highlight = {
                enable = true,
                disable = {"htmldjango"}
            },
            indent = { enable = true },
        },
        config = function(_, opts)
            ---@class ParserInfo[]
            local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
            parser_config.blade = {
                install_info = {
                    url = "https://github.com/EmranMR/tree-sitter-blade",
                    files = {
                        "src/parser.c",
                        -- 'src/scanner.cc',
                    },
                    branch = "main",
                    generate_requires_npm = true,
                    requires_generate_from_grammar = true,
                },
                filetype = "blade",
            }

            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    {
        "windwp/nvim-ts-autotag",
        ft = {
            "html", "css", "javascript",
            "typescript", "python", "c",
            "cpp", "markdown", "markdown_inline",
            "dockerfile", "json", "php"
        },
        opts = {},
    },
    {
        "HiPhish/rainbow-delimiters.nvim",
        config = function ()
            require('rainbow-delimiters.setup').setup {
                strategy = {
                },
                query = {
                },
                highlight = {
                },
            }
        end
    }
}
