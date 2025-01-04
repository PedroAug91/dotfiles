return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
        { "polirritmico/telescope-lazy-plugins.nvim" },
        { "nvim-lua/plenary.nvim" },
        { "duane9/nvim-rg" }
    },
    config = function ()
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
        vim.keymap.set('n', "<leader>fs", builtin.live_grep, { desc = "[F]ind a [S]tring" })
        vim.keymap.set('n', "<leader>cb", builtin.git_branches, { desc = "[C]heckout [B]ranch" })
        vim.keymap.set('n', "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
    end,
    -- keys = {
    --     {"<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "[F]ind [F]iles" }},
    --     {"<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "[F]ind a [S]tring" }},
    --     {"<leader>cb", "<cmd>Telescope git_branches<cr>", { desc = "[C]heckout [B]ranch" }},
    --     {"<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "[F]ind [K]eymaps" }}
    -- }
}

