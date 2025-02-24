vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.cmd("set number")
vim.cmd("set clipboard=unnamedplus")
vim.g.mapleader = " "

USER = os.getenv("USER")
SWAPDIR = "/home/" .. USER .. "/.nvim/swap//"
BACKUPDIR = "/home/" .. USER .. "/.nvim/backup//"
UNDODIR = "/home/" .. USER .. "/.nvim/undo//"

if vim.fn.isdirectory(SWAPDIR) == 0 then
	vim.fn.mkdir(SWAPDIR, "p", "0o700")
end

if vim.fn.isdirectory(BACKUPDIR) == 0 then
	vim.fn.mkdir(BACKUPDIR, "p", "0o700")
end

if vim.fn.isdirectory(UNDODIR) == 0 then
	vim.fn.mkdir(UNDODIR, "p", "0o700")
end

-- Enable swap, backup, and persistant undo
vim.opt.directory = SWAPDIR
vim.opt.backupdir = BACKUPDIR
vim.opt.undodir = UNDODIR
vim.opt.swapfile = true
vim.opt.backup = true
vim.opt.undofile = true

-- Append backup files with timestamp
vim.api.nvim_create_autocmd("BufWritePre", {
	callback = function()
		local extension = "~" .. vim.fn.strftime("%Y-%m-%d-%H%M%S")
		vim.o.backupext = extension
	end,
})

vim.api.nvim_set_keymap('n', '<leader>f', ':Telescope fd<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>s', ':vsplit <CR>', { noremap = true, silent = true })


-- Disable arrow keys in normal mode
vim.api.nvim_set_keymap('n', '<Up>',    '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>',  '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>',  '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<NOP>', { noremap = true, silent = true })

-- Disable arrow keys in visual mode
vim.api.nvim_set_keymap('v', '<Up>',    '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Down>',  '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Left>',  '<NOP>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<Right>', '<NOP>', { noremap = true, silent = true })
