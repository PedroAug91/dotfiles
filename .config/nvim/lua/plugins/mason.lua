return {
    "williamboman/mason.nvim",
    dependencies = {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "neovim/nvim-lspconfig"
    },
    config = function()
        vim.diagnostic.config({
            severity_sort = true,
            float = { border = "rounded", source = "if_many" },
            underline = true,
            signs = true,
            virtual_text = {
                source = "if_many",
                spacing = 2,
            },
        })

        local servers = {
            "clangd",                            -- C/C++
            "csharp-language-server",            -- C#
            "css-variables-language-server",     -- CSS variables
            "docker-compose-language-service",   -- Docker Compose
            "dockerfile-language-server",        -- Dockerfile
            "emmet-language-server",             -- Emmet
            "gopls",                             -- Go
            "html-lsp",                          -- HTML
            "intelephense",                      -- PHP
            "lua-language-server",               -- Lua
            "pyright",                           -- Python
            "sqlls",                             -- SQL
            "tailwindcss-language-server",       -- Tailwind
            "typescript-language-server",        -- TS/JS
        }

        require("mason").setup({
            ui = {
                border = "rounded",
            }
        })
        require("mason-tool-installer").setup({
            ensure_installed = servers
        })

        vim.keymap.set('n', "<leader>tm", ":Mason<CR>", { desc = "[T]oggle [M]ason" })
    end
}
