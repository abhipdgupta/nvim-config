return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    local opts = {}
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.selene,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.diagnostics.golangci_lint,
        --null_ls.builtins.diagnostics.staticcheck,
        require("none-ls.diagnostics.eslint_d"),
        require("none-ls.code_actions.eslint"),
      },
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, opts)
  end,
}
