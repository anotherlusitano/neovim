vim.pack.add { 'https://github.com/stevearc/conform.nvim' }

require('conform').setup {
  notify_on_error = false,
  format_on_save = function(bufnr)
    -- You can specify filetypes to autoformat on save here:
    local enabled_filetypes = {
      lua = true,
      go = true,
      rust = true,
      javascript = true,
      javascriptreact = true,
      typescript = true,
      typescriptreact = true,
    }

    if enabled_filetypes[vim.bo[bufnr].filetype] then
      return { timeout_ms = 700 }
    else
      return nil
    end
  end,
  default_format_opts = {
    lsp_format = 'fallback',
  },

  formatters_by_ft = {
    lua = { 'stylua' },
    javascript = { 'prettier' },
    typescript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescriptreact = { 'prettier' },
    css = { 'prettier' },
    html = { 'prettier' },
    json = { 'prettier' },
    yaml = { 'prettier' },
    markdown = { 'prettier' },
  },
}

vim.keymap.set({ 'n', 'v' }, '<leader>f', function() require('conform').format { async = true } end, {
  desc = '[F]ormat buffer',
})
