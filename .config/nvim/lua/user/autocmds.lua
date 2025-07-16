vim.api.nvim_create_autocmd("BufRead", {
    pattern = { "docker-compose.yaml", "docker-compose.yml" },
    callback = function()
        vim.bo.filetype = "yaml.docker-compose"
    end
})

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.cmd("startinsert")
    end
})

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})
