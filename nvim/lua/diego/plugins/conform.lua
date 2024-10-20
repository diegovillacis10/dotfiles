return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  cmd = { "ConformInfo" },
  config = function()
    local conform = require("conform")
    local prettier_with_fallback = { "prettierd", "prettier", stop_after_first = true }

    conform.setup({
      formatters_by_ft = {
        javascript = prettier_with_fallback,
        typescript = prettier_with_fallback,
        javascriptreact = prettier_with_fallback,
        typescriptreact = prettier_with_fallback,
        handlebars = prettier_with_fallback,
        css = prettier_with_fallback,
        scss = prettier_with_fallback,
        sass = prettier_with_fallback,
        html = prettier_with_fallback,
        json = prettier_with_fallback,
        yaml = prettier_with_fallback,
        markdown = prettier_with_fallback,
        graphql = prettier_with_fallback,
        lua = { "stylua" },
        ruby = { "rubocop" },
        -- Use the "_" filetype to run formatters on filetypes that don't
        -- have other formatters configured.
        ["_"] = { "trim_whitespace" },
      },
      default_format_opts = {
        lsp_format = "fallback",
      },
      format_after_save = {
        lsp_format = "fallback",
      },
      format_on_save = function(bufnr)
        -- Disable autoformat on certain filetypes
        local ignore_filetypes = { "sql", "java", "scss" }
        if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then
          return
        end

        -- Disable with a global or buffer-local variable
        if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
          return
        end

        -- Disable autoformat for files in a certain path
        local bufname = vim.api.nvim_buf_get_name(bufnr)
        if bufname:match("/node_modules/") then
          return
        end

        return {
          lsp_format = "fallback",
          timeout_ms = 500,
        }
      end,
    })

    vim.api.nvim_create_user_command("Format", function(args)
      local range = nil
      if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
          start = { args.line1, 0 },
          ["end"] = { args.line2, end_line:len() },
        }
      end
      conform.format({ async = true, lsp_fallback = true, range = range })
    end, { range = true })

    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for current buffer
        vim.b.disable_autoformat = true
      else
        vim.g.disable_autoformat = true
      end
    end, {
      desc = "Disable autoformat-on-save",
      bang = true,
    })

    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.b.disable_autoformat = false
      vim.g.disable_autoformat = false
    end, {
      desc = "Re-enable autoformat-on-save",
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_format = "fallback",
        async = true,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
