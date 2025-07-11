return {
  --[[
 __  __          _      _
|  \/  |__ _ _ _| |____| |_____ __ ___ _
| |\/| / _` | '_| / / _` / _ \ V  V / ' \
|_|  |_\__,_|_| |_\_\__,_\___/\_/\_/|_||_|

    ]]
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'echasnovski/mini.icons', -- if you use standalone mini plugins
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      code = {
        -- position  = 'right',
        width     = 'block',
        -- left_pad  = 1,
        right_pad = 1,
        border    = 'thick', -- TODO: doesn't seem to do anything, see later
      },
      pipe_table = {
        preset = 'round',
        cell = 'trimmed',
      },
      latex = { enabled = false, },
      link = {
        custom = {
          wikipedia = { pattern = 'wikipedia%.org', icon = '󰖬 ' },
        },
      },
      heading = {
        sign = false,
        border = true,
        below = "▔",
        above = "▁",
        left_pad = 0,
        position = "inline",
        icons = {
          "█ ",
          "██ ",
          "███ ",
          "████ ",
          "█████ ",
          "██████ ",
        },
      },
    },
    ft = "markdown",
    cmd = "RenderMarkdown",
  },
  {
    'opdavies/toggle-checkbox.nvim',
    keys = {
      {'<leader>tt', 
      function ()
          require('toggle-checkbox').toggle()
      end,
        ft=markdown,
        desc = "Toggle markdown checkbox",
      }
    }
  }
}
