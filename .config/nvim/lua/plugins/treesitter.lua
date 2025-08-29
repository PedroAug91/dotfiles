return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local path = vim.fn.expand("~/.local/share/nvim/parsers")
            vim.opt.runtimepath:append(path)

            local opts = {
                parser_install_dir = path,
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
    {
        "tjdevries/php.nvim",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("php").setup({})
        end
    }
}
