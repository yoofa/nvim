-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

--vim.g.mapleader = " "
vim.g.username = "youfa"
vim.g.email = "vsyfar@gmail.com"
vim.g.license = "GPLv2"

vim.g.editorconfig = true

local opt = vim.opt
opt.list = true
vim.opt.listchars = {
  eol = "¬",
  tab = "▸ ", -- tab requires a string of two characters
  extends = "»",
  precedes = "«",
  trail = "·",
  space = "·",
}

-- opt.spell = true
-- opt.spelllang = { "en_us" }
