return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  -- See `:help lualine.txt`
  opts = {
    options = {
      -- icons_enabled = false,
      -- theme = 'catppuccin-mocha',
      theme = 'dracula',
      -- component_separators = '|',
      -- section_separators = '',
      -- always_show_tabline = false,
    },
    sections = {
      lualine_c = {
        {'filename', path = 4},
      },
    },
    extensions = {
      'quickfix',
      'fugitive',
      'lazy',
      'man',
      'mason',
      {
        filetypes = { 'CompetiTest' },
        sections = {
          lualine_b = { vim.b.competitest_title or 'CompetiTest' },
          lualine_y = { 'searchcount' },
          lualine_z = { "change this sometime" },
        },
        inactive_sections = {
          lualine_b = { vim.b.competitest_title or 'CompetiTest' },
        },
      } -- CompetiTest statusline
    }
  },
}
