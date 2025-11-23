--- @type vim.lsp.Config
local opts = {
    filetypes = {
        "yaml", "yaml.docker-compose"
    }

}
local client = "docker_compose_language_service"
vim.lsp.config(client, opts)
vim.lsp.enable(client)
