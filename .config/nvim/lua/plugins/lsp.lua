return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        lazy = true,
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            {
                "hrsh7th/nvim-cmp",
                dependencies = {
                    "L3MON4D3/LuaSnip",
                    "hrsh7th/cmp-nvim-lsp",
                    "hrsh7th/cmp-path",
                    "hrsh7th/cmp-buffer",
                    "saadparwaiz1/cmp_luasnip"
                }
            }
        },
        opts = {
            autoformat = true,
            servers = {
                pyright = {},
                lua_ls = {}
            }
        },
        config = function(_, opts)
            require("mason").setup()

            local ensure_installed = {}
            for server, _ in pairs(opts.servers) do
                ensure_installed[#ensure_installed + 1] = server
                local capabilities = require("cmp_nvim_lsp").default_capabilities()
                local on_attach = function(_, bufnr)
                    local keymap_opts = { buffer = bufnr, remap = false }
                    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, keymap_opts)
                    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, keymap_opts)
                end
                local handlers = {
                    ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
                    ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
                    ["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
                        update_in_insert = true
                    })
                }
                local final_opts = vim.tbl_deep_extend("force", {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    handlers = handlers
                }, opts.servers[server] or {})
                require("lspconfig")[server].setup(final_opts)
            end

            require("mason-lspconfig").setup({
                ensure_installed = ensure_installed,
                automatic_installation = true
            })

            local cmp = require("cmp")

            cmp.setup({
                snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
                },
                window = {
                    completion = cmp.config.window.bordered(),
                    documentation = cmp.config.window.bordered(),
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = false })
                }),
                sources = cmp.config.sources(
                    {
                        { name = 'nvim_lsp' },
                        { name = 'luasnip' }
                    }, {
                        { name = 'buffer' }
                    }, {
                        { name = 'path' }
                    }
                )
            })

            cmp.setup.filetype('gitcommit', {
                sources = cmp.config.sources(
                    {
                        { name = 'git' }
                    }, {
                       { name = 'buffer' }
                    }
                )
            })

            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })
        end
    },
    {
        "jose-elias-alvarez/null-ls.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "nvim-lua/plenary.nvim"
        },
        lazy = false,
        config = function()
            require("null-ls").setup()
        end
    }
}
