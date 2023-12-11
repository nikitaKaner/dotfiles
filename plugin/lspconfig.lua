local status, lspconfig = pcall(require, "lspconfig")
if not status then
  print('lspconfig is not installed!')
  return
end

-- local ts_status, typescript = pcall(require, 'typescript')
-- if not ts_status then
--   print("Typescript.nvim is not installed!")
--   return
-- end

local get_on_attach = function(format)
  return function(client, bufnr)
    -- format on save
    if format then
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("Format", { clear = true }),
          buffer = bufnr,
          callback = function() vim.lsp.buf.format() end
        })
      end
    end

    local opts = { noremap = true, silent = true, buffer = bufnr }

    -- Keybindings
    vim.keymap.set("n", "gd", "<Cmd>Lspsaga peek_definition<CR>", opts)
    vim.keymap.set("n", "<leader>hd", "<Cmd>Lspsaga hover_doc<CR>", opts)
    vim.keymap.set("n", "<leader>ca", "<Cmd>Lspsaga code_action<CR>", opts)
    vim.keymap.set("n", "<leader>rn", "<Cmd>Lspsaga rename<CR>", opts)

    if client.name == 'tsserver' then
      vim.keymap.set("n", "<leader>rf", "<Cmd>:TypescriptRenameFile<CR>")
    end
  end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Python
lspconfig['pyright'].setup {
  capabilities = capabilities,
  on_attach = get_on_attach(true),
}

-- Lua
lspconfig['sumneko_lua'].setup {
  capabilities = capabilities,
  on_attach = get_on_attach(false),
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
lspconfig['tsserver'].setup {
  on_attach = get_on_attach(false),
  filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
  cmd = { "typescript-language-server", "--stdio" }
}

lspconfig['gopls'].setup {}
lspconfig['clangd'].setup {}

-- typescript.setup {
--   server = {
--     capabilities = capabilities,
--     on_attach = on_attach,
--   }
-- }
