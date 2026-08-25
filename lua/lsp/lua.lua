vim.lsp.config('emmylua_ls', {
  cmd = { 'emmylua_ls' },
  filetypes = { 'lua' },
  root_markers = { '.emmyrc.json', '.luarc.json', '.git' },
  settings = {
    emmylua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = vim.list_extend({
          vim.env.VIMRUNTIME,
        }, {
          -- Comment this line if you DO NOT want to index all the plugins.
          -- This is usefull to know what the `require("plugin")` has
          -- but consumes A LOT of RAM
          vim.fs.normalize '$HOME/.local/share/nvim/site/pack/core/opt',
        }),
      },
    },
  },
})

vim.lsp.enable 'emmylua_ls'
