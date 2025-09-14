local keymap = vim.keymap

keymap.set('v', "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move block to [J] (down)" })
keymap.set('v', "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move block to [K] (up)" })

keymap.set('v', "<C-y>", '"+y', { noremap = true, silent = true, desc = "[Y]ank to clipboard" })

keymap.set('n', "<space><space>", function() vim.lsp.buf.format() end, { desc = "Format file" })
keymap.set('n', "<C-space>", ":e %<CR>", { noremap = true, silent = true, desc = "Reload file" })

keymap.set('n', "<C-t>", function() ToggleTabLine() end, { desc = "[T]oggle tabline" })

-- Navigate around tabs and windows
keymap.set('n', "<C-j>", ":tabp<CR>", { noremap = true, silent = true, desc = "Go to previous tab" })
keymap.set('n', "<C-k>", ":tabn<CR>", { noremap = true, silent = true, desc = "Go to next tab" })
keymap.set('n', "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Go to left window" })
keymap.set('n', "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Go to right window" })
keymap.set('n', "<C-q>", "<C-w><C-q>", { desc = "Close window" })

-- Neovim Terminal related stuff
keymap.set('n', "<leader>gpp", ":$tab terminal g++ % -Wall -o %< && ./%<<CR>", { desc = "[G]nu C [P]lus [P]lus compiler" })
keymap.set('n', "<leader>gcc", ":$tab terminal gcc % -Wall -o %< && ./%<<CR>", { desc = "[G] [C] [C]ompiler" })
keymap.set('t', "<ESC><ESC>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Other stuff idk
keymap.set("n", "<leader>q", function()
    vim.diagnostic.setloclist({ open = false }) -- Populate location list with diagnostics
    require("telescope.builtin").loclist(require("telescope.themes").get_dropdown({
        previewer = true,
        prompt_title = "Diagnostics",
        width = 0.5,
        winblend = 10,
    }))
end, { desc = "Open diagnostics [Q]uickfix Dropdown" })

keymap.set('n', "<leader>tp", ":MarkdownPreviewToggle<CR>", { desc = "[T]oggle markdown [P]review " })

keymap.set('n', "<C-n>", ":Oil<CR>", { desc = "Open oil" })
