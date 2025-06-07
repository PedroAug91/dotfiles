return {
    "theprimeagen/harpoon",
    config = function ()
        vim.keymap.set("n", "<leader>hq", require("harpoon.ui").toggle_quick_menu, { desc = "[H]arpoon [Q]uick[M]enu"})
        vim.keymap.set("n", "<leader>hm", require("harpoon.mark").add_file, { desc = "[H]arpoon [M]ark" })
        vim.keymap.set("n", "<leader>hn", require("harpoon.ui").nav_next, { desc = "[H]arpoon [N]ext"})
        vim.keymap.set("n", "<leader>hp", require("harpoon.ui").nav_prev, { desc = "[H]arpoon [P]revious"})

        require("harpoon").setup({
            tabline = false
        })
    end

}
