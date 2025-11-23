--- @type vim.lsp.Config
local opts = {
}
local client = "csharp_ls"
vim.lsp.config(client, opts)
vim.lsp.enable(client)
