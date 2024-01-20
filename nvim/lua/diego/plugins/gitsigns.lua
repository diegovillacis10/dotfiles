return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local gitsigns = require('gitsigns')

    gitsigns.setup {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then return ']c' end
          vim.schedule(function() gs.next_hunk() end)
          return '<Ignore>'
        end, {expr=true})

        map('n', '[c', function()
          if vim.wo.diff then return '[c' end
          vim.schedule(function() gs.prev_hunk() end)
          return '<Ignore>'
        end, {expr=true})

        -- Actions
        map('n', '<leader>hs', gs.stage_hunk, { desc = 'Stage the diego at the cursor position' })
        map('n', '<leader>hr', gs.reset_hunk, { desc = 'Reset the lines of the hunk at the cursor position'})
        map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Stage the hunk at the cursor position' })
        map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, { desc = 'Reset the lines of the hunk at the cursor position' })
        map('n', '<leader>hS', gs.stage_buffer, { desc = 'Stage all hunks in current buffer' })
        map('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Undo the last call of stage_hunk' })
        map('n', '<leader>hR', gs.reset_buffer, { desc = 'Reset the lines of all hunks in the buffer' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview the hunk at he cursor position in a floating window' })
        map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview the hunk at he cursor position in a floating window' })
        map('n', '<leader>hb', function() gs.blame_line{full=true} end, { desc = 'Run git blame on the current line' })
        map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Toggle git blame for current line' })
        map('n', '<leader>hd', gs.diffthis, { desc = 'Perform vimdiff on the current buffer against the index' })
        map('n', '<leader>hD', function() gs.diffthis('~') end, { desc = 'Perform vimdiff against ~' })
        map('n', '<leader>td', gs.toggle_deleted, { desc = 'Toggle deleted lines at the cursor position' })

        -- Text object
        map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end
  }
  end,
}
