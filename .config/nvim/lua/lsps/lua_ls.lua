--- @type vim.lsp.Config
local opts = {
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                },
                checkThirdParty = false,
            },
            completion = {
                callSnippet = "Replace",
            },
        },
    },
}
local client = "lua_ls"
vim.lsp.config(client, opts)
vim.lsp.enable(client)
