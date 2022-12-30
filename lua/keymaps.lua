local map = vim.keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- Do not yank with x
map.set({ 'n', 'v' }, 'x', '"_x', opts)

-- Increment/Dicrement
map.set('n', '+', '<C-a>', opts)
map.set('n', '-', '<C-x>', opts)

-- Create new tab
map.set('n', 'te', '<Cmd>tabedit<CR>', opts)

-- Delete/close buffer
map.set('n', '<leader>db', '<Cmd>bdelete<CR>', opts)
