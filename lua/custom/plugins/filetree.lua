-- NOTE: when changing file tree plugins, make sure to update CLOSE command in AUTO-SESSION

return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    lazy = false,
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('neo-tree').setup {
        window = {
          mappings = {
            -- Disabled changed/unused keymaps
            ['<space>'] = 'noop',
            ['S'] = 'noop',
            ['C'] = 'noop',
            -- Changed/new keymaps
            ['l'] = 'toggle_node',
            ['h'] = 'close_node',
            ['s'] = 'open_split',
            ['v'] = 'open_vsplit',
            ['<C-p>'] = 'focus_preview',
          },
        },
        auto_clean_after_session_restore = true,
      }

      vim.keymap.set('n', '<leader>f', ':Neotree filesystem toggle left<CR>', { desc = '[F]ilesystem' })
      vim.keymap.set('n', '<leader>gs', ':Neotree float git_status<CR>', { desc = 'Neo-tree: [G]it [S]tatus' })
    end,
  },
  -- {
  --   'stevearc/oil.nvim',
  --   dependencies = { 'nvim-tree/nvim-web-devicons' },
  --   config = function()
  --     require('oil').setup {}
  --     -- vim.keymap.set('n', '-', ':Oil<CR>', { desc = 'Oil File Explorer' })
  --   end,
  -- },
}
