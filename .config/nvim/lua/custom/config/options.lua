-- See `:help vim.o`
-- - vim.o is a get-set interface for the variables
-- - vim.opt basically allows treating list style options as 
--   lua tables instead of comma delimited strings

-- set leader and local leader to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

vim.o.winborder = 'single'

-- Set highlight on search
-- vim.o.hlsearch        = false

-- Make hybrid line numbers default

vim.wo.number         = true
vim.wo.relativenumber = true

-- Enable mouse mode
vim.o.mouse           = 'a'

-- Enable break indent
vim.o.breakindent     = true

-- Save undo history
vim.o.undofile        = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase      = true
vim.o.smartcase       = true

-- Keep signcolumn on by default
vim.wo.signcolumn     = 'yes'

-- Decrease update time
vim.o.updatetime      = 250
vim.o.timeoutlen      = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt     = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
-- vim.o.termguicolors   = true

-- Use spaces
vim.o.expandtab       = true

-- render whitespace
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- change default splitting directions
vim.o.splitright = true

vim.o.scrolloff = 10

-- use dictionary completion
vim.opt.dictionary:append('/usr/share/dict/words')
