return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "golangci_lint_ls", "jsonls", "tsserver", "pyright", "tailwindcss" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspc = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspc.lua_ls.setup({ capabilities = capabilities })
      lspc.tsserver.setup({ capabilities = capabilities })
      
      local opts = {}
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
      vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
    end
  }
}
