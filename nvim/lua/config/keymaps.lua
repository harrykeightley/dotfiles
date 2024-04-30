-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local nmap = require("hjk.keymap").nmap

-- diagnostic
local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go({ severity = severity, wrap = true, float = true })
  end
end

nmap({ "<leader>dj", diagnostic_goto(true), { desc = "Next Diagnostic" } })
nmap({ "<leader>dk", diagnostic_goto(false), { desc = "Previous Diagnostic" } })
nmap({ "<leader>ds", vim.diagnostic.open_float, { desc = "Line Diagnostics" } })
