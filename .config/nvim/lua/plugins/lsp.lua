return {{
    "neovim/nvim-lspconfig",
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
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                -- ...
            },
            automatic_installation = true
        })
    end
}}
