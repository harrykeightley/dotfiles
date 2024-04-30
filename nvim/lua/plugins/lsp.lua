local create_mapper = require("hjk.keymap").create_mapper

return {
  { import = "lazyvim.plugins.extras.lang.typescript" },

  {
    "neovim/nvim-lspconfig",
    ---@class PluginLspOpts
    opts = {
      ---@type lspconfig.options
      servers = {
        -- pyright will be automatically installed with mason and loaded with lspconfig
        pyright = {},
      },
    },
  },

  -- Ensure some treesitter filetypes are installed.
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "fish",
        "html",
        "toml",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "scss",
        "astro",
        "clojure",
      },
      autotag = { enable = true },
    },
  },
}
