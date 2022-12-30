local status, ts = pcall(require, 'nvim-treesitter.configs')
if not status then return end

ts.setup {
  -- List of parsers that definitely will be installed
  ensure_installed = {
    'lua',
    'python',
    'typescript',
    'javascript',
    'bash',
    'tsx',
    'html',
    'css',
    'cpp',
  },

  highlight = {
    enable = true,
    disable = {}
  },

  indent = {
    enable = true,
  },

  autotag = {
    enable = true,
  }
}
