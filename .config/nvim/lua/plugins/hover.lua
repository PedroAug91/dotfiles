return {
    "lewis6991/hover.nvim",
    config = function ()
        require("hover").setup({
            init = function ()
                require("hover.providers.lsp")
            end,
            title = true,
            preview_opts = {
                border = "rounded",
                max_width = 80,
                max_height = 30,
            }
        })
        vim.keymap.set("n", "K", require("hover").hover, {desc = "hover.nvim"})
    end
}
