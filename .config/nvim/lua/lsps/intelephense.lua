--- @type vim.lsp.Config
local opts = {
    filetypes = {
        "php", "php_only", "blade"
    }
}
local client = "intelephense"
vim.lsp.config(client, opts)
vim.lsp.enable(client)
