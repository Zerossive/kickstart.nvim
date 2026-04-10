-- [[ JavaScript]]

-- [[ Keymaps ]]
vim.keymap.set('n', '<leader><leader>p', '<cmd>TypstPreviewToggle<cr>', { desc = 'typst [p]review' })
vim.keymap.set('n', '<leader><leader>c', '<cmd>TypstPreviewFollowCursorToggle<cr>', { desc = 'typst follow [c]ursor toggle' })
vim.keymap.set('n', '<leader><leader>s', '<cmd>TypstPreviewSyncCursor<cr>', { desc = 'typst [s]ync cursor' })
-- { '<leader><leader>p', '<cmd>TypstPreviewToggle<cr>', desc = 'typst [p]review' },
-- { '<leader><leader>c', '<cmd>TypstPreviewFollowCursorToggle<cr>', desc = 'typst follow [c]ursor toggle' },
-- { '<leader><leader>s', '<cmd>TypstPreviewSyncCursor<cr>', desc = 'typst [s]ync cursor' },
