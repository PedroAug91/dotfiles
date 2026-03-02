local dir_content_str = vim.fn.glob("$HOME/.config/nvim/lua/lsps/*")
local dir_content_list = vim.split(dir_content_str, '\n', {trimempty=true})

--- @type string[]
Servers = {}

for _, lsp_path in ipairs(dir_content_list) do
    local split_path = vim.split(lsp_path, "/")
    local file_with_extension = split_path[#split_path]
    local dot = string.find(file_with_extension, ".", 1, true)
    table.insert(Servers, string.sub(file_with_extension, 1, dot - 1))
end

for _, server in ipairs(Servers) do
    require("lsps." .. server)
end
