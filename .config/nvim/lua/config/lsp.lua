local servers = {
    "clangd",
    "csharp_ls",
    "css_variables",
    "docker_compose_language_service",
    "docker_ls",
    "emmet_language_server",
    "gopls",
    "html",
    "intelephense",
    "lua_ls",
    "pyright",
    "sqlls",
    "tailwindcss",
    "ts_ls",
}

for _, server in ipairs(servers) do
    require("lsps." .. server)
end
