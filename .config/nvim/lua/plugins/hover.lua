return {
    "lewis6991/hover.nvim",
    config = function()
        require("hover").setup({
            title = true,
            preview_opts = {
                border = "rounded",
                max_width = 80,
                max_height = 30,
            },
            providers = {
                "hover.providers.diagnostic",
                "hover.providers.lsp"
            }
        })
        vim.keymap.set("n", "K", require("hover").hover, { desc = "hover.nvim" })
    end
}
