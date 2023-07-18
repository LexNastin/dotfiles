return {{
    "gbprod/stay-in-place.nvim",
    config = function ()
        local stayinplace = require("stay-in-place")

        vim.keymap.set("x", ">", stayinplace.shift_right_visual, { noremap = true })
        vim.keymap.set("x", "<", stayinplace.shift_left_visual, { noremap = true })
        vim.keymap.set("x", "=", stayinplace.filter_visual, { noremap = true })
        stayinplace.setup({
            set_keymaps = false
        })
    end
}}
