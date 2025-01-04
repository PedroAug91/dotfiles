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

vmap("<leader>y", '"+y')
