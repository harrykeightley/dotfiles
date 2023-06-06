local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

local create_mapper = require('hjk.keymap').create_mapper

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local buf_nnoremap = create_mapper({ 'n', opts })

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_nnoremap { 'gd', vim.lsp.buf.definition }
  buf_nnoremap { 'gD', vim.lsp.buf.declaration }
  buf_nnoremap { 'gt', vim.lsp.buf.type_definition }
  buf_nnoremap { 'gi', vim.lsp.buf.implementation }
  buf_nnoremap { 'gr', '<cmd>Telescope lsp_references<cr>'  }
  buf_nnoremap { 'gs', '<cmd>Telescope lsp_document_symbols<cr>'  }

  buf_nnoremap { 'K', vim.lsp.buf.hover }

  buf_nnoremap { '<leader>rn', vim.lsp.buf.rename }
  buf_nnoremap { '<leader>ca', vim.lsp.buf.code_action }

  buf_nnoremap { '<leader>f', vim.lsp.buf.format }

  -- Diagnostics (moved to after.plugin.diagnostic)
  -- buf_nnoremap { '<leader>dj', vim.diagnostic.goto_next }
  -- buf_nnoremap { '<leader>dk', vim.diagnostic.goto_prev }
  buf_nnoremap { '<leader>dl', '<cmd>Telescope diagnostics<cr>' }
end


protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}



-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities(
  vim.lsp.protocol.make_client_capabilities()
)

-- Bunch of lsps to setup with autocompletion
nvim_lsp.flow.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.terraformls.setup {}

nvim_lsp.tsserver.setup {
  on_attach = on_attach,
  filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
  capabilities = capabilities
}

nvim_lsp.pyright.setup {
  on_attach = on_attach,
  filetypes = { "python" },
  capabilities = capabilities
}

nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  filetypes = { "rust" },
  capabilities = capabilities,
}

nvim_lsp.lua_ls.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false
      },
    },
  },
}

nvim_lsp.tailwindcss.setup {
  settings = {
    classAttributes = { "class", "className", "ngClass", "style" }
  },
}

nvim_lsp.astro.setup {}

-- icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      spacing = 4,
      prefix = ''
    },
    severity_sort = true,
  }
)
