vim.api.nvim_create_autocmd("BufRead", {
    pattern = { "docker-compose.yaml", "docker-compose.yml"},
    callback = function ()
        vim.bo.filetype = "yaml.docker-compose"
    end
})

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = "*",
    callback = function ()
        vim.cmd("startinsert")
    end
})

