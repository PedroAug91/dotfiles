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

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
    callback = function(event)
        vim.keymap.set('n', "gr", require("telescope.builtin").lsp_references,
            { buffer = event.buf, desc = "[G]oto [R]eferences" })
        vim.keymap.set('n', "gd", require("telescope.builtin").lsp_definitions,
            { buffer = event.buf, desc = "[G]oto [D]efinition" })
        vim.keymap.set('n', "gs", require("telescope.builtin").lsp_document_symbols,
            { buffer = event.buf, desc = "[G]oto document [S]ymbol" })
        vim.keymap.set('n', "gw", require("telescope.builtin").lsp_workspace_symbols,
            { buffer = event.buf, desc = "[G]oto [W]orkspace symbol" })
        vim.keymap.set('n', "<leader>nn", function() vim.lsp.buf.rename() end,
            { buffer = event.buf, desc = "[N]ew [N]ame" })
        vim.keymap.set('n', "<leader>ca", function() vim.lsp.buf.code_action() end,
            { buffer = event.buf, desc = "[C]ode [A]ction" })
    end
})


