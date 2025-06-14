return {
  "williamboman/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function(_, opts)
    local mason = require("mason")
    local mason_tool_installer = require("mason-tool-installer")

    local mason_conf = vim.tbl_deep_extend("keep", opts, {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    -- ^^^^^ Merge configuration with OPTS
    -- OPTS contains configurations defined elsewhere like nvim-java
    -- https://github.com/nvim-java/nvim-java/wiki/Q-&-A#method-3-if-you-really-want-to-use-config-property-for-some-reason-consider-the-default-values

    mason.setup(mason_conf)

    mason_tool_installer.setup({
      ensure_installed = {
        "prettierd",
        "eslint_d",
        "stylua",
        "shellcheck",
      },
    })
  end,
}
