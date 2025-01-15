-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- remove lazy keymaps
vim.keymap.del("n", "<leader>L")
vim.keymap.del("n", "<leader>l")
vim.keymap.set("n", "<leader>L", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- code runner
vim.keymap.set("n", "<leader>r", "", { desc = "CodeRunner" })
vim.keymap.set("n", "<leader>rr", "<cmd>RunCode<cr>", { desc = "Run Code" })
vim.keymap.set("n", "<leader>rc", "<cmd>RunClose<cr>", { desc = "Run Close" })

-- leetcode.nvim
vim.keymap.set("n", "<leader>l", "", { desc = "LeetCode" })
vim.keymap.set("n", "<leader>lt", "<cmd>Leet test<cr>", { desc = "Leet test code" })
vim.keymap.set("n", "<leader>lc", "<cmd>Leet console<cr>", { desc = "Leet console" })
vim.keymap.set("n", "<leader>ls", "<cmd>Leet submit<cr>", { desc = "Leet submit" })
vim.keymap.set("n", "<leader>lo", "<cmd>Leet open<cr>", { desc = "Leet problem open in browser" })
vim.keymap.set("n", "<leader>lr", "<cmd>Leet reset<cr>", { desc = "Leet reset code" })
vim.keymap.set("n", "<leader>ll", "<cmd>Leet<cr>", { desc = "Open Leet" })
vim.keymap.set("n", "<leader>le", "<cmd>Leet exit<cr>", { desc = "Exit Leet" })
