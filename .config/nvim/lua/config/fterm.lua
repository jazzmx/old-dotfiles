require('FTerm').setup()

local term = require("FTerm.terminal")

local gitsh = term:new():setup({
    cmd = "gitsh",
    dimensions = {
        height = 0.8,
        width = 0.8
    }
})

 -- Use this to toggle gitui in a floating terminal
function _G.fterm_toggle_gitsh()
    gitsh:toggle()
end

-- Keybinding
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<C-t>', '<CMD>lua require("FTerm").toggle()<CR>', opts)
map('t', '<C-t>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', opts)

-- map('n', '<C-Space>', '<CMD>v:lua.fterm_toggle_gitsh()<CR>', opts)
-- map('t', '<C-Space>', '<C-\\><C-n><CMD>v:lua.fterm_toggle_gitsh()<CR>', opts)
