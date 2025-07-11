--- @brief
---
--- https://github.com/mattn/efm-langserver
---
--- General purpose Language Server that can use specified error message format generated from specified command.
---
--- Requires at minimum EFM version [v0.0.38](https://github.com/mattn/efm-langserver/releases/tag/v0.0.38) to support
--- launching the language server on single files.
---
--- Note: In order for neovim's built-in language server client to send the appropriate `languageId` to EFM, **you must
--- specify `filetypes` in your call to `vim.lsp.config`**. Otherwise the server will be launch on the `BufEnter` instead
--- of the `FileType` autocommand, and the `filetype` variable used to populate the `languageId` will not yet be set.
---
--- ```lua
--- vim.lsp.config('efm', {
---   filetypes = { 'python','cpp','lua' }
---   settings = ..., -- You must populate this according to the EFM readme
--- })
--- ```

local prettierd_config = {
  formatCanRange = true,
  formatCommand = "prettierd '${INPUT}' ${--range-start=charStart} ${--range-end=charEnd} "
    .. '${--tab-width=tabSize} ${--use-tabs=!insertSpaces}',
  formatStdin = true,
  rootMarkers = {
    '.prettierrc',
    '.prettierrc.json',
    '.prettierrc.js',
    '.prettierrc.yml',
    '.prettierrc.yaml',
    '.prettierrc.json5',
    '.prettierrc.mjs',
    '.prettierrc.cjs',
    '.prettierrc.toml',
    'prettier.config.js',
    'prettier.config.cjs',
    'prettier.config.mjs',
  },
  -- env = { string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand('~/.config/nvim/utils/linter-config/.prettierrc.json')), },
}

return {
  cmd = { 'efm-langserver' },
  root_markers = { '.git' },
  filetypes = {
    'javascript',
    'typescript',
    'javascriptreact',
    'typescriptreact',
  },
  init_options = {documentFormatting = true},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      typescript = {
        prettierd_config,
      },
      javascript = {
        prettierd_config,
      }
    }
  }
}
