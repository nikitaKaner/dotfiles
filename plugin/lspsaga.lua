local status, lspsaga = pcall(require, 'lspsaga')
if not status then return end

lspsaga.init_lsp_saga()

local opts = { noremap = true, silent = true }

-- Show line diagnostics
vim.keymap.set('n', '<leader>ld', '<Cmd>Lspsaga show_line_diagnostics<CR>', opts)

-- Show doc
vim.keymap.set('n', '<leader>ki', '<Cmd>Lspsaga hover_doc<CR>', opts)

-- Rename
vim.keymap.set('n', '<leader>rn', '<Cmd>Lspsaga rename<CR>', opts)

-- Diagnsotic jump can use `<c-o>` to jump back
vim.keymap.set("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
