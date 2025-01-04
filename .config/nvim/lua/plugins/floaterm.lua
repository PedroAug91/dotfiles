return {
    "voldikss/vim-floaterm",
    config = function ()

        vim.g.floaterm_title = "Terminal"
        vim.g.floaterm_width = 0.9
        vim.g.floaterm_height = 0.9
        vim.g.floaterm_autoclose = 2
        vim.g.floaterm_titleposition = "center"

        vim.keymap.set('n', "<leader>tt", ":FloatermToggle<CR>", { desc = "[T]oggle [T]erminal"})
        vim.keymap.set('n', "<leader>gpp", ":FloatermNew --autoclose=0 g++ % -Wall -o %< && %<<CR>", { desc = "[G]nu C [P]lus [P]lus compiler"})
        vim.keymap.set('n', "<leader>gcc", ":FloatermNew --autoclose=0 gcc % -Wall -o %< && ./%<<CR>", { desc = "[G] [C] [C]ompiler"})
        vim.keymap.set('n', "<C-c>", ":FloatermNew --height=1.0 --width=1.0 lazygit <CR>")
    end
}
