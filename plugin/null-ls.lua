local status, null_ls = pcall(require, 'null-ls')
if not status then
  print('Null-ls is not installed!')
  return
end

local formatting = null_ls.builtins.formatting
local sources = {
  formatting.eslint,
  formatting.autopep8,
  formatting.stylua
}
