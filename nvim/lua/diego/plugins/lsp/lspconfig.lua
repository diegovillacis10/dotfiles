return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    "williamboman/mason-lspconfig.nvim",
  },

  config = function()
    local lspconfig = require("lspconfig")
    local windows = require("lspconfig.ui.windows")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local mason_lspconfig = require("mason-lspconfig")

    -- Change the Diagnostic symbols in the sign column (gutter)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    local border = {
      { "┌", "FloatBorder" },
      { "─", "FloatBorder" },
      { "┐", "FloatBorder" },
      { "│", "FloatBorder" },
      { "┘", "FloatBorder" },
      { "─", "FloatBorder" },
      { "└", "FloatBorder" },
      { "│", "FloatBorder" },
    }

    -- Add border to the diagnostic popup window
    vim.diagnostic.config({
      virtual_text = {
        prefix = "■ ", -- Could be '●', '▎', 'x', '■', , 
      },
      float = { border },
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local keymap = vim.keymap
        local opts = { buffer = ev.buf, silent = true }

        opts.desc = "Go to declaration"
        keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

        opts.desc = "Show LSP definitions"
        keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts) -- show lsp references

        opts.desc = "Show LSP implementations"
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

        opts.desc = "Show LSP document symbols with aerial"
        keymap.set("n", "gs", "<cmd>Telescope aerial<CR>", opts) -- show lsp document symbols with aerial

        opts.desc = "Show LSP document symbols"
        keymap.set("n", "gS", "<cmd>Telescope lsp_document_symbols<CR>", opts) -- show lsp document symbols

        opts.desc = "See avialable code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Show signature info for what is under cursor"
        keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Add the border on LSP ui
    windows.default_options.border = "single"

    -- Add the border on hover and on signature help popup window
    local border_handler = {
      ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
      ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
    }

    -- -- Enable the following language servers
    local lsp_servers = {
      "astro",
      "cssls",
      "ember",
      "emmet_ls",
      "html",
      "lua_ls",
      "tailwindcss",
      "ts_ls",
    }

    -- Ensure the servers above are installed
    mason_lspconfig.setup({
      ensure_installed = lsp_servers,
      -- auto-install configured servers (with lspconfig)
      automatic_installation = true, -- not the same as ensure_installed
    })

    local handlers = {
      -- The first entry (without a key) will be the default handler
      -- and will be called for each installed server that doesn't have
      -- a dedicated handler.
      function(server_name) -- default handler (optional)
        lspconfig[server_name].setup({
          capabilities = capabilities,
          handlers = border_handler,
        })
      end,
      -- Next, you can provide targeted overrides for specific servers.
      ["ember"] = function()
        lspconfig["ember"].setup({
          capabilities = capabilities,
          handlers = border_handler,
          filetypes = { "handlebars" },
        })
      end,
      ["emmet_ls"] = function()
        lspconfig["emmet_ls"].setup({
          capabilities = capabilities,
          handlers = border_handler,
          filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
        })
      end,
      ["tailwindcss"] = function()
        lspconfig["tailwindcss"].setup({
          capabilities = capabilities,
          handlers = border_handler,
          filetypes = {
            "html",
            "html.handlebars",
            "handlebars",
            "css",
            "scss",
            "astro",
            "typescriptreact",
            "javascriptreact",
          },
        })
      end,
      ["lua_ls"] = function()
        lspconfig["lua_ls"].setup({
          capabilities = capabilities,
          handlers = border_handler,
          settings = { -- custom settings for lua
            Lua = {
              -- make the language server recognize "vim" global
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                -- make language server aware of runtime files
                library = {
                  [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                  [vim.fn.stdpath("config") .. "/lua"] = true,
                },
              },
            },
          },
        })
      end,
    }

    require("mason-lspconfig").setup_handlers(handlers)
  end,
}
