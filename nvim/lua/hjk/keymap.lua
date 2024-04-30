local M = {}

M.map = function(mode, tbl)
  vim.keymap.set(mode, tbl[1], tbl[2], tbl[3])
end

M.nmap = function(tbl)
  return M.map("n", tbl)
end

M.imap = function(tbl)
  return M.map("i", tbl)
end

M.create_mapper = function(tbl)
  local mode = tbl[1]
  local opts = tbl[2]
  return function(tbl2)
    vim.keymap.set(mode, tbl2[1], tbl[2], opts)
  end
end

return M
