local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
  return
end

local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
  return
end

-- enable keybinds only for when lsp server available
local on_attach = function(_, bufnr)
  -- keybind options
  -- local opts = { noremap = true, silent = true, buffer = bufnr }

  -- handy mapping function
  local nmap = function (keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, {
      noremap = true, silent = true, buffer = bufnr, desc = desc
    })
  end

  -- set keybinds
  nmap("gf", "<Cmd>Lspsaga finder<CR>", "[G]o to [F]inder")
  nmap("gf", "<Cmd>Lspsaga finder<CR>", "")
  nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "[G]o to [I]mplementation")
  nmap("gd", "<cmd>Lspsaga peek_definition<CR>", "[G]o to [D]efinition")
  nmap("gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", "[G]o to [D]eclaration")
  nmap("<leader>rn", "<cmd>Lspsaga rename<CR>", "[R]e[N]ame")
  nmap("<leader>do", "<cmd>Lspsaga code_action<CR>", "[DO] code action")
  nmap("<leader>D", "<cmd>Lspsaga show_line_diagnostics<CR>", "Show [D]iagnostics")
  nmap("<leader>d", "<cmd>Lspsaga show_cursor_diagnostics<CR>", "Show cursor [D]iagnostics")
  nmap("[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
  nmap("]d", "<cmd>Lspsaga diagnostic_jump_next<CR>")
  nmap("K", "<cmd>Lspsaga hover_doc<CR>")
  -- Diagnostic keymaps
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
  vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
  nmap("<leader>n", "<cmd>Lspsaga outline<CR>", "Show Outline") -- show buffer outline
--   -- Lesser used LSP functionality
--   nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
--   nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
--   nmap('<leader>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, '[W]orkspace [L]ist Folders')
--
   -- Create a command `:Format` local to the LSP buffer
   vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
     vim.lsp.buf.format()
   end, { desc = 'Format current buffer with LSP' })
 end

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

-- Change the Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- configure html server
lspconfig["html"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure typescript server
lspconfig["tsserver"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure css server
lspconfig["cssls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure tailwindcss server
lspconfig["tailwindcss"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
})

-- configure emmet language server
lspconfig["emmet_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
})

-- configure lua server (with special settings)
lspconfig["lua_ls"].setup({
  capabilities = capabilities,
  on_attach = on_attach,
  settings = { -- custom settings for lua
    Lua = {
      -- make the language server recognize "vim" global
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        checkThirdParty = false,
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
})

