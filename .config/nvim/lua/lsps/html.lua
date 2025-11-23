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
local client = "html"
vim.lsp.config(client, opts)
vim.lsp.enable(client)
