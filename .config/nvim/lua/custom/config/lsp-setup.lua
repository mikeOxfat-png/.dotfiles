vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end
    -- Jump to the definition of the word under your cursor.
    --  This is where a variable was first declared, or where a function is defined, etc.
    --  To jump back, press <C-t>.
    map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')

    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    map('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')

    -- Fuzzy find all the symbols in your current workspace.
    map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    -- map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame') -- grn in nvim 0.11

    -- Execute a lsp code action
    -- map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' }) -- gra in nvim 0.11

    -- map('K', vim.lsp.buf.hover, 'Hover Documentation') -- default
    -- map('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation') -- CTRL-S in nvim 0.11

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header.
    map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')


    local client = vim.lsp.get_client_by_id(event.data.client_id)

    if client and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    end
    -- The following code creates a keymap to toggle inlay hints in your
    -- code, if the language server you are using supports them
    -- This may be unwanted, since they displace some of your code

    if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, '[T]oggle Inlay [H]ints')
    end
    map('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    map('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    map('<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end,
      '[W]orkspace [L]ist Folders')
    -- vim.api.nvim_buf_create_user_command(event.buf, 'Format', function(_) vim.lsp.buf.format() end, { desc = 'Format current buffer with LSP' })
    map('<leader>f', vim.lsp.buf.format, '[F]ormat current buffer with LSP')
  end,
})

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  severity_sort = true,
  float = {
    border = 'rounded',
    -- source = 'if_many'
    source = true,
  },
  underline = { severity = vim.diagnostic.severity.ERROR },
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
  virtual_text = {
    source = 'if_many',
    spacing = 2,
    format = function(diagnostic)
      local diagnostic_message = {
        [vim.diagnostic.severity.ERROR] = diagnostic.message,
        [vim.diagnostic.severity.WARN] = diagnostic.message,
        [vim.diagnostic.severity.INFO] = diagnostic.message,
        [vim.diagnostic.severity.HINT] = diagnostic.message,
      }
      return diagnostic_message[diagnostic.severity]
    end,
  },
}


vim.lsp.enable( { 
  'ts_ls',
  'html',
  'cssls',
  'jsonls',
  'eslint',
  'yamlls',
  'gitlab_ci_ls',
  'basedpyrightls',
  'ruff',
  'efm',
})
