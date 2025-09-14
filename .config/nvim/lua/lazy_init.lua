local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
    { import = "plugins" }
}

if vim.g.vscode then
    vim.list_extend(plugins, {
        { "nvim-lualine/lualine.nvim", enabled = false },
        { "nanozuki/tabby.nvim",       enabled = false },
        { "stevearc/oil.nvim",         enabled = false },
        { "rose-pine/neovim",          name = "rose-pine",  enabled = false },
        { "theprimeagen/harpoon",      branch = "harpoon2", enabled = false },
    })
end

require("lazy").setup(plugins, {
    change_detection = {
        enabled = true,
        notify = false
    },
    ui = {
        border = "rounded",
        backdrop = 60
    }
})

vim.keymap.set('n', "<leader>l", ":Lazy home<CR>", { desc = "[L]azy neovim" })
