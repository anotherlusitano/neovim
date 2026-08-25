vim.pack.add { 'https://github.com/neovim/nvim-lspconfig' }

-- NOTE: Do not forget to add the packages to `mason_config.lua`
require 'lsp.lua'
require 'lsp.go'
require 'lsp.rust'

-- Notifications
vim.pack.add { 'https://github.com/j-hui/fidget.nvim' }
require('fidget').setup {}

--  This function gets run when an LSP attaches to a particular buffer.
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('another-lsp-attach', { clear = true }),
  callback = function(event)
    -- Helper function
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })

    map('<leader>cr', vim.lsp.buf.rename, '[R]ename')

    map('<leader>cc', vim.lsp.codelens.run, 'Run [C]odelens', { 'n', 'x' })

    map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
    map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
    map('gy', vim.lsp.buf.type_definition, '[G]oto T[y]pe Definition')

    -- The following two autocommands are used to highlight references of the
    -- word under your cursor when your cursor rests there for a little while.
    -- When you move your cursor, the highlights will be cleared (the second autocommand).
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client:supports_method('textDocument/documentHighlight', event.buf) then
      local highlight_augroup = vim.api.nvim_create_augroup('another-lsp-highlight', { clear = false })
      vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd('LspDetach', {
        group = vim.api.nvim_create_augroup('another-lsp-detach', { clear = true }),
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = 'another-lsp-highlight', buffer = event2.buf }
        end,
      })
    end

    -- The following code creates a keymap to toggle inlay hints in your
    -- code, if the language server you are using supports them
    if client and client:supports_method('textDocument/inlayHint', event.buf) then
      map(
        '<leader>th',
        function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }) end,
        '[T]oggle Inlay [H]ints'
      )
    end
  end,
})
