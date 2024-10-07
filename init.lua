vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
    config = function()
      require "options"
    end,
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope fd<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>s', ':vsplit <CR>', { noremap = true, silent = true })


-- Disable arrow keys in normal mode
vim.api.nvim_set_keymap('n', '<Up>',    '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>',  '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>',  '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<NOP>', { noremap = true, silent = true })

-- Disable arrow keys in insert mode
--vim.api.nvim_set_keymap('i', '<Up>',    '<NOP>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('i', '<Down>',  '<NOP>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('i', '<Left>',  '<NOP>', { noremap = true, silent = true })
--vim.api.nvim_set_keymap('i', '<Right>', '<NOP>', { noremap = true, silent = true })

-- Disable arrow keys in visual mode
vim.api.nvim_set_keymap('v', '<Up>',    '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Down>',  '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Left>',  '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Right>', '<NOP>', { noremap = true, silent = true })
