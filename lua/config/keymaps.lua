-- Set our leader keybinding to space
-- Anywhere you see <leader> in a keymapping specifies the space key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Remove search highlights after searching
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Remove search highlights" })

-- Exit Vim's terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- OPTIONAL: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Easily split windows
vim.keymap.set("n", "<leader>wv", ":vsplit<cr>", { desc = "[W]indow Split [V]ertical" })
vim.keymap.set("n", "<leader>wh", ":split<cr>", { desc = "[W]indow Split [H]orizontal" })

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left in visual mode" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right in visual mode" })

-- Fred's Mappings

-- Set cursor to be fat in INSERT mode
vim.opt['guicursor'] = ''

vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'Center screen when navigating down' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'Center screen when navigating up' })
vim.keymap.set('n', 'n', 'nzzzv', { desc = 'Center screen when cycling search term' })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = 'Center screen when cycling search term' })
vim.keymap.set('n', '<leader>y', '"+y', { desc = '[Y]ank to system clipboard' })
vim.keymap.set('n', '<leader>Y', '"+Y', { desc = '[Y]ank to system clipboard' })
vim.keymap.set('n', '<leader>d', '"_d', { desc = '[D]elete to void register' })
vim.keymap.set('x', '<leader>p', '"_dP', { desc = '[P]aste to void register' })

vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move highlighted text down' })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move highlighted text down' })

vim.keymap.set('i', '<C-BS>', '<C-W>', { noremap = true }) -- Makes CTRL + Backspcae delete a word back

-- highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
