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

        require("mason").setup({
            ui = {
                border = "rounded",
            }
        })
        require("mason-tool-installer").setup({
            ensure_installed = Servers
        })

        vim.keymap.set('n', "<leader>tm", ":Mason<CR>", { desc = "[T]oggle [M]ason" })
    end
}
