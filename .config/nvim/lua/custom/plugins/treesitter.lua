return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.configs', -- sets up main module such that opts can be directly passed
  opts = {
    ensure_installed      = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'latex', 'query', 'vim', 'vimdoc' },
    -- Autoinstall languages that are not installed
    auto_install          = true,
    highlight             = {
      enable = true,
      additional_vim_regex_highlighting = { 'ruby' },
    },
    indent                = { enable = true, disable = { 'ruby' } },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = '<c-space>',
        node_incremental = '<c-space>',
        scope_incremental = '<c-s>',
        -- node_decremental = '<M-space>', -- alt space doesn't work on this terminal/window manager
      },
    },
    textobjects           = {
      select = {
        enable = true,
        lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ['aa'] = '@parameter.outer',
          ['ia'] = '@parameter.inner',
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['ac'] = '@class.outer',
          ['ic'] = '@class.inner',
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          [']m'] = '@function.outer',
          [']]'] = '@class.outer',
        },
        goto_next_end = {
          [']M'] = '@function.outer',
          [']['] = '@class.outer',
        },
        goto_previous_start = {
          ['[m'] = '@function.outer',
          ['[['] = '@class.outer',
        },
        goto_previous_end = {
          ['[M'] = '@function.outer',
          ['[]'] = '@class.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ['<leader>a'] = '@parameter.inner',
        },
        swap_previous = {
          ['<leader>A'] = '@parameter.inner',
        },
      },
    },
  },
  config = function(_, opts)
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.mips = {
      install_info = {
        url = 'https://github.com/omeyenburg/tree-sitter-mips', -- You can use a local path for url if you prefer
        branch = 'main',
        files = { 'src/parser.c' },
        generate_requires_npm = false,
        requires_generate_from_grammar = false,
      },
      filetype = 'mips', -- note: a simple way to automatically set filetype is using modeline; e.g. `# vim: filetype=mips`
    }
    require("nvim-treesitter.configs").setup(opts)
    -- note: also need to do `cp ./queries/* $XDG_CONFIG_HOME/nvim/queries/mips/` to enable highlight
    -- see https://github.com/omeyenburg/tree-sitter-mips
  end,
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
}
