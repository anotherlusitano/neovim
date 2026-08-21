vim.pack.add {
  'https://github.com/rmagatti/auto-session',
}

vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- select a session to load
vim.keymap.set("n", "<leader>qs", "<Cmd>AutoSession search<CR>", { desc = '[S]earch Session' })

-- load the last session
vim.keymap.set("n", "<leader>qr", "<Cmd>AutoSession restore<CR>", { desc = '[R]estore Session' })

-- stop AutoSession => session won't be saved on exit
vim.keymap.set("n", "<leader>qd", "<Cmd>AutoSession disable<CR>", { desc = '[D]isable AutoSession' })

-- enable AutoSession => session will be saved on exit
vim.keymap.set("n", "<leader>qe", "<Cmd>AutoSession enable<CR>", { desc = '[E]nable AutoSession' })

require("auto-session").setup({
  auto_restore = false,
  auto_restore_last_session = false,
  bypass_save_filetypes = { "dashboard" },
})
