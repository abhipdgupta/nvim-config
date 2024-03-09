return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")

    local arts=require("ascii_arts")
    dashboard.section.header.val = arts.art_01
    dashboard.section.buttons.val = {

      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  Find Files", ":Telescope find_files<CR>"),
      dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
    }
    dashboard.section.footer.val = "NEO VIM ROCKS"
    alpha.setup(dashboard.opts)
  end,
}
