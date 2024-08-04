local function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

local function nmap(shortcut, command)
	map('n', shortcut, command)
end

local function imap(shortcut, command)
	map('i', shortcut, command)
end

local function vmap(shortcut, command)
	map('v', shortcut, command)
end

-- Non plugin remaps

vim.api.nvim_set_keymap('t', '<ESC>', '<C-\\><C-n>', { noremap = true, silent = true})

imap("ii", "<ESC>")

vmap("ii", "<ESC>")

vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")

nmap("<leader><leader>", ":so %<CR>")

nmap("<C-j>", ":tabp<CR>")
nmap("<C-k>", ":tabn<CR>")

nmap("<C-h>", "<C-w>h")
nmap("<C-l>", "<C-w>l")
nmap("<leader>=", "<C-w>=")

-- Plugin remaps

nmap("<leader>l", ":Lazy home<CR>")

nmap("<leader>md", ":MarkdownPreviewToggle<CR>")

nmap("<leader>cl", ":FloatermToggle<CR>")
nmap("<leader>cpp", ":FloatermNew --autoclose=0 g++ % -Wall -o %< && %<<CR>")
nmap("<leader>cc", ":FloatermNew --autoclose=0 gcc % -Wall -o %< && %<<CR>")
nmap("<leader>cs", ":FloatermNew --autoclose=0 gcc % -Wall -lcs50 -o %< && %<<CR>")
nmap("<C-c>", ":FloatermNew --height=1.0 --width=1.0 lazygit <CR>")

nmap("<leader>ma", ":Mason<CR>")

