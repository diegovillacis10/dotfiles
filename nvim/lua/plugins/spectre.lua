return {
  {
    "windwp/nvim-spectre",
    enabled = true,
    event = "BufRead",
    dependencies = {
            "nvim-lua/plenary.nvim" },
    keys = {
      {
        "<leader>Rr",
        function()
          require("spectre").open()
        end,
        desc = "Replace",
      },
      {
        "<leader>Rw",
        function()
          require("spectre").open_visual({ select_word = true })
        end,
        desc = "Replace Word",
      },
      {
        "<leader>Rf",
        function()
          require("spectre").open_file_search()
        end,
        desc = "Replace Buffer",
      },
    },
    config = function()
      require("spectre").setup({
      color_devicons = true,
      open_cmd = "vnew",
      live_update = false, -- auto execute search again when you write to any file in vim
      lnum_for_results = true, -- show line number for search/replace results
      line_sep_start = "┌-----------------------------------------",
      result_padding = "¦  ",
      line_sep = "└-----------------------------------------",
      highlight = {
        ui = "String",
        search = "diffRemoved",
        replace = "diffChanged",
      },
      use_trouble_qf = true,
      is_insert_mode = true,
      find_engine = {
        -- rg is map with finder_cmd
        ["rg"] = {
          cmd = "rg",
          -- default args
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
          },
          options = {
            ["ignore-case"] = {
              value = "--ignore-case",
              desc = "ignore case",
              icon = " ",
            },
            ["hidden"] = {
              value = "--hidden",
              desc = "hidden file",
              icon = "󰘓 ",
            },
            -- you can put any rg search option you want here it can toggle with
            -- show_option function
          },
        },
      },
      replace_engine = {
        ["sed"] = {
          cmd = "sed",
          args = nil,
          options = {
            ["ignore-case"] = {
              value = "--ignore-case",
              desc = "ignore case",
              icon = "󰘓 ",
            },
          },
        },
      },
      default = {
        find = {
          --pick one of item in find_engine
          cmd = "rg",
          options = { "ignore-case" },
        },
        replace = {
          --pick one of item in replace_engine
          cmd = "sed",
        },
      },
      replace_vim_cmd = "cdo",
      is_open_target_win = true, --open file on opener window
      is_block_ui_break = false, -- mapping backspace and enter key to avoid ui break
      open_template = {
        -- an template to use on open function
        -- see the 'custom function' section below to learn how to configure the template
        -- { search_text = 'text1', replace_text = '', path = "" }
      },
    })
    end,
  },
}
