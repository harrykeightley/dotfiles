local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.rustfmt,
    null_ls.builtins.diagnostics.fish,
    --null_ls.builtins.diagnostics.pylint,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.terraform_fmt,
    null_ls.builtins.formatting.raco_fmt.with({
      filetypes = {"racket", "scheme"}
    }),
  },
}
