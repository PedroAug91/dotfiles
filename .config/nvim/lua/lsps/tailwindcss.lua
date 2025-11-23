--- @type vim.lsp.Config
local opts = {
}
local client = "tailwindcss"
vim.lsp.config(client, opts)
vim.lsp.enable(client)
