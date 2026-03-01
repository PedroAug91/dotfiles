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

for _, server in ipairs(Servers) do
    require("lsps." .. server)
end
