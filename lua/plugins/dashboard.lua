return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require('alpha.themes.dashboard')

    dashboard.section.header.val = {
      [[`8.`888b                 ,8' .8.           8888888888',8888'  8 8888 8 888888888o.  ]],
      [[ `8.`888b               ,8' .888.                 ,8',8888'   8 8888 8 8888    `88. ]],
      [[  `8.`888b             ,8' :88888.               ,8',8888'    8 8888 8 8888     `88 ]],
      [[   `8.`888b     .b    ,8' . `88888.             ,8',8888'     8 8888 8 8888     ,88 ]],
      [[    `8.`888b    88b  ,8' .8. `88888.           ,8',8888'      8 8888 8 8888.   ,88' ]],
      [[     `8.`888b .`888b,8' .8`8. `88888.         ,8',8888'       8 8888 8 888888888P'  ]],
      [[      `8.`888b8.`8888' .8' `8. `88888.       ,8',8888'        8 8888 8 8888`8b      ]],
      [[       `8.`888`8.`88' .8'   `8. `88888.     ,8',8888'         8 8888 8 8888 `8b.    ]],
      [[        `8.`8' `8,`' .888888888. `88888.   ,8',8888'          8 8888 8 8888   `8b.  ]],
      [[         `8.`   `8' .8'       `8. `88888. ,8',8888888888888   8 8888 8 8888     `88 ]],
    }
    dashboard.section.buttons.val = {

      dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "  Find Files", ":Telescope find_files<CR>"),
      dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
    }
    dashboard.section.footer.val = "NEO VIM ROCKS"
    alpha.setup(dashboard.opts)
  end
};
