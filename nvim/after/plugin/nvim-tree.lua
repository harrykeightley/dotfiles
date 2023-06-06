require("nvim-tree").setup()

local create_mapper = require('hjk.keymap').create_mapper
local nmap = create_mapper({ 'n', {} })

nmap {';a', '<cmd>NvimTreeToggle<cr>'}
