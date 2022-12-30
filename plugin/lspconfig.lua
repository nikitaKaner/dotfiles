local status, lspconfig = pcall(require, "lspconfig")
if not status then
  print('lspconfig is not installed!')
  return
end

local ts_status, typescript = pcall(require, 'typescript')
if not ts_status then
  print("Typescript.nvim is not installed!")
  return
end

local on_attach = function(client, bufnr)
  -- format on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = bufnr,
      callback = function() vim.lsp.buf.formatting_seq_sync() end
    })
  end

  local opts = { noremap = true, silent = true, buffer = bufnr }

  -- Keybindings
  vim.keymap.set("n", "gd", "<Cmd>Lspsaga peek_definition<CR>", opts)
  vim.keymap.set("n", "<leader>ca", "<Cmd>Lspsaga code_action<CR>", opts)
  vim.keymap.set("n", "<leader>rn", "<Cmd>Lspsaga rename<CR>", opts)

  if client.name == 'tsserver' then
    vim.keymap.set("n", "<leader>rf", "<Cmd>:TypescriptRenameFile<CR>")
  end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Python
lspconfig['pyright'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
}

-- Lua
lspconfig['sumneko_lua'].setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the 'vim' global
        globals = { 'vim' },
      },

      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      }
    }
  }
}

lspconfig['clangd'].setup {}

-- Typescript
typescript.setup {
  server = {
    capabilities = capabilities,
    on_attach = on_attach,
  }
}
