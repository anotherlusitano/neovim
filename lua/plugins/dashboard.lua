vim.pack.add {
  'https://github.com/nvimdev/dashboard-nvim',
}

local logo = [[
                                                                   
      ████ ██████           █████      ██                    
     ███████████             █████                            
     █████████ ███████████████████ ███   ███████████  
    █████████  ███    █████████████ █████ ██████████████  
   █████████ ██████████ █████████ █████ █████ ████ █████  
 ███████████ ███    ███ █████████ █████ █████ ████ █████ 
██████  █████████████████████ ████ █████ █████ ████ ██████
]]

logo = string.rep("\n", 8) .. logo .. "\n\n"

require('dashboard').setup({
  theme = 'doom',
  config = {
    header = vim.split(logo, "\n"),
    center = {
      {
        icon = ' ',
        desc = 'Find File',
        key = 'f',
        action = 'Telescope find_files'
      },
      {
        icon = ' ',
        desc = 'New File',
        key = 'n',
        action = 'ene | startinsert'
      },
      {
        icon = ' ',
        desc = 'Find Text',
        key = 'g',
        action = 'Telescope live_grep'
      },
      {
        icon = ' ',
        desc = 'Config',
        key = 'c',
        action = 'lua require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })'
      },

      {
        icon = ' ',
        desc = 'Restore Session',
        key = 'r',
        action = "AutoSession restore"
      },
      {
        icon = ' ',
        desc = 'Quit',
        key = 'q',
        action = 'qa'
      },
    },
    footer = function()
      local time = (vim.uv.hrtime() - vim.g.start_time) / 1e6
      return { string.format("⚡ Neovim loaded in %.2f ms", time) }
    end,
  }})

