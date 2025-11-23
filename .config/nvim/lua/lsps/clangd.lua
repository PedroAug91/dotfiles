--- @type vim.lsp.Config
local opts = {
}
local client = "clangd"
vim.lsp.config(client, opts)
vim.lsp.enable(client)
