vim.g.mapleader = " "

imap("ii", "<ESC>")

nmap("<leader>hl", "<CMD>set cursorline!<cr>")
nmap("<C-n>", "<CMD>Ex<cr>")
nmap("<C-r>", "<CMD>so<cr>")
nmap("<leader>ps", "<CMD>PackerSync<cr>")
nmap("<leader>ls", "<CMD>LiveServerStart<cr>")
nmap("<C-k>", "<cmd>cnext<CR>zz")
nmap("<C-j>", "<cmd>cprev<CR>zz")
nmap("<leader>cpp", "<cmd>!g++ -Wall % && ./a.out<cr>")

vmap("ii", "<ESC>")
vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")
