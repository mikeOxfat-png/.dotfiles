-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Clear highlight with esc in normal mode
-- see `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- [[ Highlight on yank ]]
-- See `:help vim.hl.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.hl.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Custom Keymaps/Keybinds ]]
-- vim.keymap.set('i', '<C-s>', '<C-o>:update<CR>', { desc = "Save file with ctrl-s when in insert mode" }) -- ctrl s saves the file in insert mode
vim.keymap.set({ 'n' }, '<leader>cp', '<cmd>%y+<CR>', { desc = "Copy file contents to system clipboard" })

vim.api.nvim_create_user_command("W", "write", {}) -- avoid typos


-- move lines using alt+J, alt+K

-- single-line
vim.keymap.set("n", "<A-j>", ":move .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":move .-2<CR>==")
-- multi-line
vim.keymap.set("v", "<A-j>", ":move '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":move '<-2<CR>gv=gv")

-- leader y yanks into the system clipboard
vim.keymap.set({ 'v', 'n' }, '<leader>y', '"+y', { desc = "Yank into system clipboard" })

-- yc copies content of default register to the system clipboard
local function regmove(r1, r2) vim.fn.setreg(r1, vim.fn.getreg(r2)) end -- function is sort of unnecessary, but it is what it is
vim.keymap.set({ 'n' }, 'yc', function() regmove('+', '"') end, { desc = "Copy contents of \" register to the clipboard", noremap=true })

-- when in visual mode leader p replaces the selection with yanked text without losing the yank
vim.keymap.set("x", "<leader>p", [["_dP]], {desc = "Replace visual selection"})
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], {desc = "Delete into void register"}) -- deletes into the void register

vim.keymap.set('n',
  '<leader>ww',
  function()
    vim.wo.wrap = not vim.wo.wrap;
    vim.notify("toggled wordwrap to " .. (vim.wo.wrap and "ON" or "OFF"), vim.log.levels.INFO)
  end,
  { desc = "toggle word [W]rap" })

vim.keymap.set('n',
  '<leader>m',
  '<cmd>update<CR><cmd>make<CR>',
  {desc = "save and Make"}
)

vim.keymap.set('n',
  '<leader>tw',
  -- note: The cursor currently needs to be on a non keyword character
  -- note: the pattern has that \r and gJ to ensure that cursor position is restored
  '<cmd>substitute,\\v(\\k+)([^[:keyword:]]*%#[^[:keyword:]]*)(\\k+),\\3\\2\\1\\r,<CR>kgJ<cmd>nohl<CR>',
  {desc = "transpose words"}
)
