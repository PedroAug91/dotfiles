return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
        { "polirritmico/telescope-lazy-plugins.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "duane9/nvim-rg" }
    },
    cmd = "Telescope",
    keys = {
        { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "find files" },
        { "<leader>ps", "<cmd>Telescope live_grep<cr>", desc = "find a string" },
        { "<leader>pg", "<cmd>Telescope git_branches<cr>", desc = "checkout branch" },
        { "<leader>pk", "<cmd>Telescope keymaps<cr>", desc = "find keymaps" },
    },
}

