-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "v" }, "<F1>", ":bprev<CR>")
vim.keymap.set({ "n", "v" }, "<F2>", ":bnext<CR>")
vim.keymap.set({ "n", "v" }, "<F3>", ":bp<bar>sp<bar>bn<bar>bd<CR>")
vim.keymap.set({ "n", "v" }, "<F4>", ":q!<CR>")
vim.keymap.set({ "n", "v" }, "<F5>", ":Neotree toggle<CR>")

-- DUplicated keymap - Fix it in nvim-tmux-navigator
vim.keymap.set("n", "<C-h>", "<Cmd>NvimTmuxNavigateLeft<CR>", {})
vim.keymap.set("n", "<C-j>", "<Cmd>NvimTmuxNavigateDown<CR>", {})
vim.keymap.set("n", "<C-k>", "<Cmd>NvimTmuxNavigateUp<CR>", {})
vim.keymap.set("n", "<C-l>", "<Cmd>NvimTmuxNavigateRight<CR>", {})
