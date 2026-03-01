local dir_content_str = vim.fn.glob("$HOME/.config/nvim/lua/lsps/*")
local dir_content_list = vim.split(dir_content_str, '\n', {trimempty=true})
local lsps = {}

for i, lsp_path in pairs(dir_content_list) do
    local split_path = vim.split(lsp_path, "/")
end

Servers = {
    "clangd",
    "css_variables",
    "docker_compose_language_service",
    "docker_ls",
    "emmet_language_server",
    "html",
    "lua_ls",
    "pyright",
    "tailwindcss",
    "ts_ls",
}
print("LSPs:")
for i, file_path in ipairs(lsps) do
    print(lsps)
end


for _, server in ipairs(Servers) do
    require("lsps." .. server)
end
