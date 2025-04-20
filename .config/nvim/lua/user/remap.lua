local keymap = vim.keymap

keymap.set({'i', 'v'}, "ii", "<ESC>", { noremap = true, silent = true, desc = "[I]n[I]tiate Normal Mode"})

keymap.set('v', "J", ":m '>+1<CR>gv=gv", { noremap = true, silent = true, desc = "Move block to [J] (down)"})
keymap.set('v', "K", ":m '<-2<CR>gv=gv", { noremap = true, silent = true, desc = "Move block to [K] (up)"})

keymap.set('v', "<space>y", '"+y', { noremap = true, silent = true, desc = "[Y]ank to clipboard"})

keymap.set('n', "<space><space>", ":so %<CR>", { noremap = true, silent = true, desc = "Reload file"})

keymap.set('n', "<C-j>", ":tabp<CR>", { noremap = true, silent = true, desc = "Go to previous tab"})
keymap.set('n', "<C-k>", ":tabn<CR>", { noremap = true, silent = true, desc = "Go to next tab"})
keymap.set('n', "<C-h>", "<C-w>h", { noremap = true, silent = true, desc = "Go to left window"})
keymap.set('n', "<C-l>", "<C-w>l", { noremap = true, silent = true, desc = "Go to right window"})

keymap.set('t', "<ESC><ESC>", "<C-\\><C-n>", { desc = "Exit terminal mode"})

keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

keymap.set('n', "<leader>gpp", ":$tab terminal g++ % -Wall -o %< && %<<CR>", { desc = "[G]nu C [P]lus [P]lus compiler"})
keymap.set('n', "<leader>gcc", ":$tab terminal gcc % -Wall -o %< && ./%<<CR>", { desc = "[G] [C] [C]ompiler"})
keymap.set('n', "<C-g>", ":$tab terminal lazygit <CR>", { desc = "Open lazy[G]it" })
keymap.set('t', "<C-t>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap.set('n', "<leader>nt", ":$tab terminal<CR>", { desc = "[N]ew [T]erminal" })
keymap.set('n', "<C-t>", ":$tab terminal<CR>", { desc = "Open [T]erminal" })
