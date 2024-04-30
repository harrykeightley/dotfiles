Util = require("lazyvim.util")

return {
  "nvimtools/none-ls.nvim",
  event = "LazyFile",
  dependencies = { "mason.nvim" },
  init = function()
    Util.on_very_lazy(function()
      -- register the formatter with LazyVim
      Util.format.register({
        name = "none-ls.nvim",
        priority = 200, -- set higher than conform, the builtin formatter
        primary = true,
        format = function(buf)
          return Util.lsp.format({
            bufnr = buf,
            filter = function(client)
              return client.name == "null-ls"
            end,
          })
        end,
        sources = function(buf)
          local ret = require("null-ls.sources").get_available(vim.bo[buf].filetype, "NULL_LS_FORMATTING") or {}
          return vim.tbl_map(function(source)
            return source.name
          end, ret)
        end,
      })
    end)
  end,
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.root_dir = opts.root_dir
      or require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git")
    opts.sources = vim.list_extend(opts.sources or {}, {
      nls.builtins.formatting.fish_indent,
      nls.builtins.diagnostics.fish,
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.shfmt,
      -- nls.builtins.diagnostics.eslint_d.with({
      --   diagnostics_format = "[eslint] #{m}\n(#{c})",
      -- }),
      nls.builtins.formatting.prettierd,
      nls.builtins.formatting.rustfmt,
      nls.builtins.diagnostics.fish,
      --nls.builtins.diagnostics.pylint,
      nls.builtins.formatting.isort,
      nls.builtins.formatting.black,
      nls.builtins.formatting.terraform_fmt,
      nls.builtins.formatting.fnlfmt,
      nls.builtins.formatting.raco_fmt.with({
        filetypes = { "racket", "scheme" },
      }),
    })
  end,
}
