local set = vim.opt
local g = vim.g

g.mapleader = " "
g.have_nerd_font = true

set.nu = true
set.relativenumber = true
set.numberwidth = 5
set.scrolloff = 8

set.ruler = false
set.cmdheight = 1
set.showmode = false
set.cursorline = true
set.showtabline = 0
set.colorcolumn = "80"
set.signcolumn = "yes"

set.wrap = true
set.tabstop = 4
set.softtabstop = 4
set.shiftwidth = 4
set.smartindent = true
set.expandtab = true

set.backup = false
set.undodir = os.getenv("HOME") .. "/.vim/undodir"
set.undofile = true
set.swapfile = false

set.hlsearch = false
set.incsearch = true

set.mouse = "a"

set.termguicolors = true
set.background = "dark"

set.ignorecase = true
set.smartcase = true
