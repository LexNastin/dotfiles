return {{
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        vim.cmd.colorscheme("catppuccin")
        local palette = require("catppuccin.palettes").get_palette("mocha")
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
        vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = "none" })

        -- bar colors
        vim.api.nvim_set_hl(0, "BufferCurrent", { bg = "none", fg = palette.green })
        vim.api.nvim_set_hl(0, "BufferCurrentADDED", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferCurrentCHANGED", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferCurrentDELETED", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferCurrentERROR", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferCurrentHINT", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferCurrentIcon", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferCurrentIndex", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferCurrentINFO", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferCurrentMod", { bg = "none", fg = palette.red })
        vim.api.nvim_set_hl(0, "BufferCurrentNumber", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferCurrentSign", { bg = "none", fg = palette.green })
        vim.api.nvim_set_hl(0, "BufferCurrentSignRight", { bg = "none", fg = palette.green })
        vim.api.nvim_set_hl(0, "BufferCurrentTarget", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferCurrentWARN", { bg = "none" })

        vim.api.nvim_set_hl(0, "BufferInactive", { bg = "none", fg = palette.surface2 })
        vim.api.nvim_set_hl(0, "BufferInactiveADDED", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferInactiveCHANGED", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferInactiveDELETED", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferInactiveERROR", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferInactiveHINT", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferInactiveIcon", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferInactiveIndex", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferInactiveINFO", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferInactiveMod", { bg = "none", fg = palette.overlay1 })
        vim.api.nvim_set_hl(0, "BufferInactiveNumber", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferInactiveSign", { bg = "none", fg = palette.surface2 })
        vim.api.nvim_set_hl(0, "BufferInactiveSignRight", { bg = "none", fg = palette.surface2 })
        vim.api.nvim_set_hl(0, "BufferInactiveTarget", { bg = "none" })
        vim.api.nvim_set_hl(0, "BufferInactiveWARN", { bg = "none" })

        vim.api.nvim_set_hl(0, "BufferTabpageFill", { ctermbg = "black" })
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
