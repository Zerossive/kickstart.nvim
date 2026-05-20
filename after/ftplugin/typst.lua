-- [[ JavaScript]]

-- [[ Keymaps ]]
vim.keymap.set('n', '<leader><leader>p', '<cmd>TypstPreviewToggle<cr>', { desc = 'typst preview' })
vim.keymap.set('n', '<leader><leader>c', '<cmd>TypstPreviewFollowCursorToggle<cr>', { desc = 'typst follow cursor toggle' })
vim.keymap.set('n', '<leader><leader>s', '<cmd>TypstPreviewSyncCursor<cr>', { desc = 'typst sync cursor' })
-- { '<leader><leader>p', '<cmd>TypstPreviewToggle<cr>', desc = 'typst preview' },
-- { '<leader><leader>c', '<cmd>TypstPreviewFollowCursorToggle<cr>', desc = 'typst follow cursor toggle' },
-- { '<leader><leader>s', '<cmd>TypstPreviewSyncCursor<cr>', desc = 'typst sync cursor' },
