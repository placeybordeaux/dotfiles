-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("i", "asdf", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("t", "asdf", "<C-\\><C-n>", { noremap = true })
vim.cmd([[
  autocmd BufWinEnter,WinEnter term://* startinsert
  autocmd BufLeave term://* stopinsert
]])

vim.api.nvim_set_keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", { noremap = true })
-- tnoremap <A-h> <C-\><C-n><C-w>h
-- tnoremap <A-j> <C-\><C-n><C-w>j
-- tnoremap <A-k> <C-\><C-n><C-w>k
-- tnoremap <A-l> <C-\><C-n><C-w>l
-- nnoremap <A-h> <C-w>h
-- nnoremap <A-j> <C-w>j
-- nnoremap <A-k> <C-w>k
-- nnoremap <A-l> <C-w>l

vim.api.nvim_set_keymap("t", "<A-,>", "<C-\\><C-n>gT", { noremap = true })
vim.api.nvim_set_keymap("t", "<A-.>", "<C-\\><C-n>gt", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-,>", "gT", { noremap = true })
vim.api.nvim_set_keymap("n", "<A-.>", "gt", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-,>", "<Esc>gT", { noremap = true })
vim.api.nvim_set_keymap("i", "<A-.>", "<Esc>gt", { noremap = true })

-- neoterm stuff
vim.api.nvim_set_keymap("n", "<f9>", ":TREPLSendLine<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<f9>", ":TREPLSendSelection<cr>", { noremap = true, silent = true })

vim.g.neoterm_default_mod = "belowright"
vim.g.neoterm_autoscroll = 1
vim.g.terminal_scrollback_buffer_size = 1000000
