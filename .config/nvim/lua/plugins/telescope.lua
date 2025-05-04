return {
    "nvim-telescope/telescope.nvim",
    event = "VimEnter",
    dependencies = {
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make", lazy = true },
        { "polirritmico/telescope-lazy-plugins.nvim" },
        { 'nvim-telescope/telescope-ui-select.nvim' },
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
        { "nvim-lua/plenary.nvim" },
        { "duane9/nvim-rg" }
    },
    config = function ()
        require("telescope").setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown()
                }
            },
            defaults = {
                layout_strategy = "vertical",
                layout_config = {
                    height = 0.99,
                    width = 0.99
                },
                file_ignore_patterns = { "node_modules"}
            }
        })

        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")

        local builtin = require("telescope.builtin")
        vim.keymap.set('n', "<leader>tt", ":Telescope<CR>", { desc = "[T]oggle [T]elescope menu" })
        vim.keymap.set('n', "<leader>ft", builtin.colorscheme, { desc = "[F]ind [T]hemes" })
        vim.keymap.set('n', "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
        vim.keymap.set('n', "<leader>fs", builtin.live_grep, { desc = "[F]ind [S]tring" })
        vim.keymap.set('n', "<leader>cb", builtin.git_branches, { desc = "[C]heckout [B]ranch" })
        vim.keymap.set('n', "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
        vim.keymap.set('n', "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
        vim.keymap.set('n', "<leader>/", function ()
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
                winblend = 10,
                previewer = false
            })
        end, { desc = "[/] Fuzzily find in current buffer"})
    end,
}

