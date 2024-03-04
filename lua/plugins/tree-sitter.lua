return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function () 
    require('nvim-treesitter.install').compilers = { 'zig'}
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "c","javascript", "typescript","lua","go" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },  
    })
  end
}
