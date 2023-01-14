local status, telescope = pcall(require, 'telescope')
if not status then return end

local actions = require('telescope.actions')
local fb_actions = telescope.extensions.file_browser.actions


local function buffer_dir()
  return vim.fn.expand('%:p:h')
end

telescope.setup {
  defaults = {
    mappings = {
      ['i'] = {
        ['<C-l>'] = actions.close,
      },
      ['n'] = {
        ['<C-l>'] = actions.close
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    file_browser = {
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      hidden = true,
      mappings = {
        ['i'] = {
          ['<C-n>'] = fb_actions.create, -- Create file
          ['<C-d>'] = fb_actions.remove, -- Delete file
          ['<C-r>'] = fb_actions.rename, -- Rename file
          ['<C-b>'] = fb_actions.goto_parent_dir, -- Go to parent dir (Go back)
        }
      },
    }
  }
}

telescope.load_extension('file_browser')

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>of',
  "<Cmd>lua require('telescope').extensions.file_browser.file_browser({ path = '%:p:h', cwd = vim.fn.expand('%:p:h') })<CR>"
  , opts)
vim.keymap.set('n', '<leader>os',
  "<Cmd>lua require'telescope.builtin'.find_files({ find_command = { 'rg', '--files', '--hidden', '-g', '!.git' }})<CR>"
  , opts)
vim.keymap.set('n', '<leader>og', '<Cmd>Telescope live_grep<CR>', opts)
vim.keymap.set('n', '<leader>ob', '<Cmd>Telescope buffers<CR>', opts)
vim.keymap.set('n', '<leader>oh', '<Cmd>Telescope help_tags<CR>', opts)
