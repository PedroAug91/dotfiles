--- @type vim.lsp.Config
local opts = {
}
local client = "dockerls"
vim.lsp.config(client, opts)
vim.lsp.enable(client)
