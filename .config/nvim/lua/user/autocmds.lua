vim.api.nvim_create_autocmd("BufRead", {
    pattern = { "docker-compose.yaml", "docker-compose.yml", "compose.yml", "compose.yaml" },
    callback = function()
        vim.bo.filetype = "yaml.docker-compose"
    end
})

vim.api.nvim_create_autocmd("BufRead", {
    pattern = {".env.*"},
    callback = function()
        vim.bo.filetype = "sh"
    end
})

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function()
        vim.cmd("startinsert")
    end
})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    desc = "Change configs for a better C development",
    pattern = {"*c", "*h", "cpp"},
    callback = function ()
        vim.bo.cindent = true;
        vim.bo.shiftwidth = 8;
        vim.bo.softtabstop = 8;
        vim.bo.tabstop = 8;
        vim.bo.expandtab = false;
    end
})

