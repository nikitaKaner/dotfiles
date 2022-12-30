-- General
vim.o.mouse = 'a' -- Enable mouse
vim.o.hlsearch = false -- Disable highligh of matches when searching
vim.o.scrolloff = 8
vim.o.wrap = false -- No wrap lines
vim.o.shell = 'fish'
vim.o.signcolumn = 'yes'
vim.cmd [[:noswapfile]]

-- Tabs
vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = -1
vim.o.smarttab = true
vim.o.si = true -- Smart indent

-- Encoding
vim.sciptencoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.o.encoding = 'utf-8'

-- Cursor
vim.o.cursorline = true -- Highlight line that is cursor on
vim.o.cursorlineopt = 'number,line'
-- vim.o.guicursor = block -- Make cursor to be always block

-- Line numbers
vim.o.number = true
vim.o.relativenumber = true

-- Colors
vim.o.termguicolors = true
vim.o.wildoptions = 'pum'
vim.o.pumblend = 5
vim.o.background = 'dark'
vim.o.clipboard = 'unnamedplus'

-- Make so "some-word" will be treated as one word, but not two
vim.opt.iskeyword:append("-")
