local set = vim.opt
local g = vim.g

g.mapleader = " "

g.floaterm_title = "Terminal"
g.floaterm_width = 0.9
g.floaterm_height = 0.9
g.floaterm_autoclose = 2
g.floaterm_titleposition = "center"

set.nu = true
set.relativenumber = true
set.numberwidth = 5
set.scrolloff = 8

set.ruler = false
set.cmdheight = 1
set.showmode = false
set.cursorline = true
set.showtabline = 2

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
