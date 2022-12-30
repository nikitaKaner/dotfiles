local status, bufferline = pcall(require, 'bufferline')
if (not status) then
  print('Bufferline is not installed')
  return
end

bufferline.setup({
  options = {
    mode = 'tabs',
    offsets = {
      -- Offset bufferline tabs when Neotree is opened, and print "File Explorer" on top of it
      {
        filetype = "neo-tree",
        text = "File Explorer",
        text_align = "center",
        separator = true
      }
    },
    diagnostics = 'nvim_lsp',
    show_close_icon = false,
    show_tab_indicators = true,
    separator_style = { '|', '|' },
    always_show_bufferline = false
  }
})


local opts = { noremap = true, silent = true }

-- Cycly though tabs
vim.keymap.set('n', '<Tab>', '<Cmd>BufferLineCycleNext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', opts)
-- Move tabs
vim.keymap.set('n', '<b', '<Cmd>BufferLineMovePrev<CR>', opts)
vim.keymap.set('n', '>b', '<Cmd>BufferLineMoveNext<CR>', opts)
-- Pick tab
vim.keymap.set('n', '<leader>pt', '<Cmd>BufferLinePick<CR>', opts)
