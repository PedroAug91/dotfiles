return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({
            settings = {
                save_on_toggle = true,
            }
        })

        vim.keymap.set("n", "<leader>hq", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "[H]arpoon [Q]uick[M]enu" })
        vim.keymap.set("n", "<leader>hm", function() harpoon:list():add() end, { desc = "[H]arpoon [M]ark" })
        vim.keymap.set("n", "<leader>hn", function() harpoon:list():next() end, { desc = "[H]arpoon [N]ext" })
        vim.keymap.set("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "[H]arpoon [P]revious" })
    end

}
