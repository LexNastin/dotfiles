-- set leader for keymaps
vim.g.mapleader = " "

-- fix ctrl + bksp and unconfuse my macos brain
vim.keymap.set("i", "<A-BS>", "<C-w>")
vim.keymap.set("i", "<C-BS>", "<C-w>")

-- remap ctrl navigation bc macop
vim.keymap.set({"n", "x", "i"}, "<A-Left>", "<C-Left>")
vim.keymap.set({"n", "x", "i"}, "<A-Right>", "<C-Right>")

-- edit file
vim.keymap.set("n", "<leader>e", ":edit ")

-- nvim-tree
vim.keymap.set("n", "<leader>t", vim.cmd.NvimTreeToggle)

-- tab navigation
vim.keymap.set("n", "<leader>c", ":BufferClose!<CR>")
vim.keymap.set("n", ",", vim.cmd.BufferPrevious)
vim.keymap.set("n", ".", vim.cmd.BufferNext)
vim.keymap.set("n", "<", vim.cmd.BufferMovePrevious)
vim.keymap.set("n", ">", vim.cmd.BufferMoveNext)

-- creating splits
vim.keymap.set("n", "<leader>h", vim.cmd.vsplit)
vim.keymap.set("n", "<leader>v", vim.cmd.split)

-- split navigation
vim.keymap.set("n", "<C-h>", vim.cmd.SmartCursorMoveLeft)
vim.keymap.set("n", "<C-j>", vim.cmd.SmartCursorMoveDown)
vim.keymap.set("n", "<C-k>", vim.cmd.SmartCursorMoveUp)
vim.keymap.set("n", "<C-l>", vim.cmd.SmartCursorMoveRight)
vim.keymap.set("n", "<leader>r", vim.cmd.SmartResizeMode)

-- comments
vim.keymap.set("n", "<leader>/", vim.cmd.CommentToggle)
vim.keymap.set("x", "<leader>/", ":<C-u>call CommentOperator(visualmode())<CR>")


-- indent stuff
vim.keymap.set("x", "<Tab>", "=")
vim.keymap.set("i", "<Tab>", function()
    -- print(vim.fn.col("$") - 1)
    if vim.fn.col("$") == 1 then
        local keys = vim.api.nvim_replace_termcodes("-<Esc>=l$xa", true, false, true)
        vim.api.nvim_feedkeys(keys, "n", false)
        vim.schedule(function()
            if vim.fn.col("$") == 1 then
                local keys = vim.api.nvim_replace_termcodes("<Tab>", true, false, true)
                vim.api.nvim_feedkeys(keys, "n", false)
            end
        end)
    else
        local keys = vim.api.nvim_replace_termcodes("<Tab>", true, false, true)
        vim.api.nvim_feedkeys(keys, "n", false)
    end
end)
