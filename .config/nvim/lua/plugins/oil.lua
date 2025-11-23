return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    config = function ()
        local opts = {
            view_options = {
                show_hidden = true
            }
        }

        require("oil").setup(opts)
    end
}
