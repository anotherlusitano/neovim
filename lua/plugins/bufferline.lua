vim.pack.add {
  { src = 'https://github.com/akinsho/bufferline.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/famiu/bufdelete.nvim',
}

vim.keymap.set('n', '<leader>bd', '<Cmd>Bdelete<CR>', { desc = 'Delete Buffer', silent = true })
vim.keymap.set('n', '<S-l>', '<Cmd>bnext<CR>', { desc = 'Next Buffer', silent = true })
vim.keymap.set('n', '<S-h>', '<Cmd>bprevious<CR>', { desc = 'Previous Buffer', silent = true })

vim.opt.termguicolors = true
require('bufferline').setup({
  options = {
    offsets = {
      {
        filetype = "neo-tree",
        text = "Nvim Tree",
        separator = true,
        text_align = "left",
      }
    }
  }
})
