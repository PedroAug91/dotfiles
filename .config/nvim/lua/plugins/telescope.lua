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
                    -- height = 0.99,
                    -- width = 0.99,
                },
                file_ignore_patterns = {
                    "node_modules",
                    "%.git/",
                    "%__pycache__/",
                    "vendor",
                }
            }
        })

        pcall(require("telescope").load_extension, "fzf")
        pcall(require("telescope").load_extension, "ui-select")
        pcall(require("telescope").load_extension, "harpoon")

        local builtin = require("telescope.builtin")
        local ff_opts = {
            hidden = true
        }
        local lg_opts = {
            additional_args = function ()
                return { "--hidden" }
            end
        }

        vim.keymap.set('n', "<leader>tt", ":Telescope<CR>", { desc = "[T]oggle [T]elescope menu" })
        vim.keymap.set('n', "<leader>ft", builtin.colorscheme, { desc = "[F]ind [T]hemes" })
        vim.keymap.set('n', "<leader>ff", function() builtin.find_files(ff_opts) end, { desc = "[F]ind [F]iles" })
        vim.keymap.set('n', "<leader>fs", function() builtin.live_grep(lg_opts) end, { desc = "[F]ind [S]tring" })
        vim.keymap.set('n', "<leader>fk", builtin.keymaps, { desc = "[F]ind [K]eymaps" })
        vim.keymap.set('n', "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
        vim.keymap.set('n', "<leader>cb", builtin.git_branches, { desc = "[C]heckout [B]ranch" })
        vim.keymap.set('n', "<leader>/", builtin.current_buffer_fuzzy_find, { desc = "[/] Fuzzily find in current buffer"})
    end,
}

