local status, neotree = pcall(require, 'neo-tree')
if (not status) then
  print('Neotree is not installed')
  return
end

neotree.setup({
  window = {
    width = 36
  },
})


vim.keymap.set('n', '<leader>ot', '<Cmd>Neotree toggle<CR>', { noremap = true, silent = true })
