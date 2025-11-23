--- @type vim.lsp.Config
local opts = {
}
local client = "pyright"
vim.lsp.config(client, opts)
vim.lsp.enable(client)
