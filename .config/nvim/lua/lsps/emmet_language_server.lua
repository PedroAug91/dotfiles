--- @type vim.lsp.Config
local opts = {
    filetypes = {
        "html",
        "htmldjango",
        "php",
        "blade",
        "javascriptreact",
        "typescriptreact",
    }

}
local client = "emmet_language_server"
vim.lsp.config(client, opts)
vim.lsp.enable(client)
