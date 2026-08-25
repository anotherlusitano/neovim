require 'options'
require 'keymaps'
require 'pack'
require 'mason_config'
require 'lsp'
require 'format'
require 'autocomplete'
require 'treesitter'
require 'diagnostics'
require 'plugins'

vim.g.start_time = vim.uv.hrtime() -- Used for dashboard to display startup time
