return {{
    "nvim-treesitter/nvim-treesitter",
    config = function ()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "lua", "python" },
            sync_installed = false,
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false
            }
        })
        vim.cmd([[TSUpdate]])
    end
}}
