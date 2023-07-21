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
local function cool_indent()
    local keys = vim.api.nvim_replace_termcodes("<BS><Enter>", true, false, true)
    vim.api.nvim_feedkeys(keys, "n", false)
end
vim.keymap.set("x", "<Tab>", "=")
vim.keymap.set("n", "i", function()
    vim.cmd.startinsert()
    if vim.fn.line(".") ~= 1 and vim.fn.col("$") == 1 then
        cool_indent()
    end
end)
vim.keymap.set("n", "a", function ()
    local keys = vim.api.nvim_replace_termcodes("a", true, false, true)
    vim.api.nvim_feedkeys(keys, "n", false)

    if vim.fn.line(".") ~= 1 and vim.fn.col("$") == 1 then
        vim.schedule(function ()
            cool_indent()
        end)
    end
end)
vim.keymap.set("n", "A", function ()
    local keys = vim.api.nvim_replace_termcodes("A", true, false, true)
    vim.api.nvim_feedkeys(keys, "n", false)

    if vim.fn.line(".") ~= 1 and vim.fn.col("$") == 1 then
        vim.schedule(function ()
            cool_indent()
        end)
    end
end)
vim.keymap.set("n", "p", function()
    local count = tostring(vim.v.count)
    if count == "0" then
        count = ""
    end

    local keys = vim.api.nvim_replace_termcodes(string.format("%sp", count), true, false, true)
    vim.api.nvim_feedkeys(keys, "n", false)

    vim.schedule(function()
        vim.cmd.undojoin()
        local final_line = vim.fn.line("']")
        local keys = vim.api.nvim_replace_termcodes(string.format("=%dG", final_line), true, false, true)
        vim.api.nvim_feedkeys(keys, "n", false)
    end)
end)
vim.keymap.set("n", "P", function()
    local count = tostring(vim.v.count)
    if count == "0" then
        count = ""
    end


    local keys = vim.api.nvim_replace_termcodes(string.format("%sP", count), true, false, true)
    vim.api.nvim_feedkeys(keys, "n", false)

    vim.schedule(function()
        vim.cmd.undojoin()
        local final_line = vim.fn.line("']")
        local keys = vim.api.nvim_replace_termcodes(string.format("=%dG", final_line), true, false, true)
        vim.api.nvim_feedkeys(keys, "n", false)
    end)
end)
vim.keymap.set("i", "<Tab>", function()
    if vim.fn.col("$") == 1 then
        cool_indent()
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
