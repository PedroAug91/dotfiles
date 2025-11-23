local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
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
        backdrop = 60,
        title = "Lazy Plugin Manager",
        titlepos = "center"
    }
})

vim.keymap.set("n", "<leader>l", ":Lazy home<CR>", { desc = "[L]azy neovim" })
