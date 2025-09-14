return {
    "neovim/nvim-lspconfig",
    dependencies = {
        { "williamboman/mason.nvim", opts = {} },
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        "hrsh7th/nvim-cmp",
    },
    config = function()
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
            callback = function(event)
                vim.keymap.set('n', "gr", require("telescope.builtin").lsp_references,
                    { buffer = event.buf, desc = "[G]oto [R]eferences" })
                vim.keymap.set('n', "gd", require("telescope.builtin").lsp_definitions,
                    { buffer = event.buf, desc = "[G]oto [D]efinition" })
                vim.keymap.set('n', "gs", require("telescope.builtin").lsp_document_symbols,
                    { buffer = event.buf, desc = "[G]oto document [S]ymbol" })
                vim.keymap.set('n', "gw", require("telescope.builtin").lsp_workspace_symbols,
                    { buffer = event.buf, desc = "[G]oto [W]orkspace symbol" })
                vim.keymap.set('n', "<leader>nn", function() vim.lsp.buf.rename() end,
                    { buffer = event.buf, desc = "[N]ew [N]ame" })
                vim.keymap.set('n', "<leader>ca", function() vim.lsp.buf.code_action() end,
                    { buffer = event.buf, desc = "[C]ode [A]ction" })
            end
        })

        vim.diagnostic.config({
            severity_sort = true,
            float = { border = "rounded", source = "if_many" },
            underline = true,
            signs = true,
            virtual_text = {
                source = "if_many",
                spacing = 2,
            },
        })

        local servers = {
            cssls = {},
            css_variables = {},
            docker_compose_language_service = {
                filetypes = {
                    "yaml", "yaml.docker-compose"
                }
            },
            dockerls = {},
            emmet_language_server = {
                filetypes = {
                    "html",
                    "htmldjango",
                    "php",
                    "blade",
                    "javascriptreact",
                    "typescriptreact",
                }
            },
            html = {
                filetypes = {
                    "html",
                    "htmldjango",
                    "php",
                    "blade",
                    "javascriptreact",
                    "typescriptreact",
                }
            },
            intelephense = {
                filetypes = {
                    "php", "php_only", "blade"
                }
            },
            sqlls = {},
            clangd = {},
            csharp_ls = {},
            pyright = {},
            ts_ls = {},
            lua_ls = {
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
            },
            tailwindcss = {},
        }

        local ensure_installed = vim.tbl_keys(servers or {})

        vim.keymap.set('n', "<leader>tm", ":Mason<CR>", { desc = "[T]oggle [M]ason" })
        require("mason-tool-installer").setup({
            ensure_installed = ensure_installed
        })

        for name, config in pairs(servers) do
            vim.lsp.config(name, config or {})
        end

        require("mason-lspconfig").setup({
            ensure_installed = {},
        })
    end
}
