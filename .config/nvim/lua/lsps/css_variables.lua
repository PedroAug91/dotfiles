--- @type vim.lsp.Config
local opts = {
}
local client = "css_variables"
vim.lsp.config(client, opts)
vim.lsp.enable(client)
