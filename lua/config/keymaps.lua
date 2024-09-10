-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- This file is automatically loaded by lazyvim.config.init
local map = vim.keymap.set

-- floating terminal
map("n", "<leader>fT", "<cmd>ToggleTerm direction=float<cr>", { desc = "Terminal (float)" })
map("n", "<leader>ft", "<cmd>ToggleTerm direction=tab<cr>", { desc = "Terminal (new tab)" })
map("n", "<C-\\>", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Terminal (horizontal)" })
map("n", "<C-/>", "<cmd>ToggleTerm direction=tab<cr>", { desc = "Terminal (tab)", remap = true })

-- Terminal Mappings
map("t", "<esc><esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to left window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to lower window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to upper window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to right window" })
map("t", "<C-\\>", "<cmd>close<cr>", { desc = "Hide Terminal" })
map("t", "<c-_>", "<cmd>close<cr>", { desc = "which_key_ignore" })

-- tabs
map("n", "[b", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "]b", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
