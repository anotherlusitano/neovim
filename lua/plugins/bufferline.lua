vim.pack.add {
  { src = 'https://github.com/akinsho/bufferline.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/famiu/bufdelete.nvim',
}

vim.keymap.set('n', '<leader>bd', '<Cmd>Bdelete<CR>', { desc = 'Delete Buffer', silent = true })
vim.keymap.set('n', '<S-l>', '<Cmd>bnext<CR>', { desc = 'Next Buffer', silent = true })
vim.keymap.set('n', '<S-h>', '<Cmd>bprevious<CR>', { desc = 'Previous Buffer', silent = true })
vim.keymap.set('n', '<leader>br', '<Cmd>BufferLineCloseRight<CR>', { desc = 'Delete Buffers to the Right' })
vim.keymap.set('n', '<leader>bl', '<Cmd>BufferLineCloseLeft<CR>', { desc = 'Delete Buffers to the Left' })

vim.opt.termguicolors = true
require('bufferline').setup {
  options = {
    offsets = {
      {
        filetype = 'neo-tree',
        text = 'Nvim Tree',
        separator = true,
        text_align = 'left',
      },
    },
    custom_filter = function(buf)
      if vim.bo[buf].filetype ~= 'terminal' and vim.bo[buf].buftype ~= 'terminal' then return true end
    end,
  },
}
