return {{
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("catppuccin")
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    end
}}
-- return {{
--     "yashguptaz/calvera-dark.nvim",
--     priority = 1000,
--     config = function()
--         vim.g.calvera_transparent_bg = true
--
--         require("calvera").set()
--     end
-- }}
