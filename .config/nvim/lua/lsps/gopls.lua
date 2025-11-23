--- @type vim.lsp.Config
local opts = {
}
local client = "gopls"
vim.lsp.config(client, opts)
vim.lsp.enable(client)
