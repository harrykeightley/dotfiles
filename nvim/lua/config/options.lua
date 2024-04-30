-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- vim.g.maplocalleader = ","

vim.opt.conceallevel = 0
vim.opt.guicursor = {}
vim.opt.foldenable = false

-- Backups
vim.opt.hidden = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
-- vim.opt.undodir = "~/.vim/undodir"

-- Disable conjure doc on K
vim.g["conjure#mapping#doc_word"] = false
