--- @type vim.lsp.Config
local opts = {
}
local client = "sqlls"
vim.lsp.config(client, opts)
vim.lsp.enable(client)
