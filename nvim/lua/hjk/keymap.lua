local M = {}

M.imap = function(tbl)
  vim.keymap.set("i", tbl[1], tbl[2], tbl[3])
end

M.nmap = function(tbl)
  vim.keymap.set("n", tbl[1], tbl[2], tbl[3])
end

M.create_mapper = function(tbl)
  local mode = tbl[1]
  local opts = tbl[2]
  return function (tbl2)
    vim.keymap.set(mode, tbl2[1], tbl2[2], opts)
  end
end

return M
