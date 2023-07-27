return {{
    "nvim-treesitter/nvim-treesitter",
    config = function ()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua",
                "python",
                "html",
                "rust",
                "javascript",
                "markdown",
                "bash",
                "vimdoc",
                "dockerfile"
            },
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
