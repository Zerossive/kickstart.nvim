-- [[ JavaScript]]
-- INCLUDES: .js, .ts, .jsx, .tsx

-- [[ Keymaps ]]
vim.keymap.set('n', '<leader><leader>d', ':99TermExec cmd="npm run dev -- --host" name="NPM RUN DEV" dir=git_dir<CR>', { desc = 'npm run [d]ev & host' })
vim.keymap.set('n', '<leader><leader>b', ':TermExec cmd="npm run build" dir=git_dir<CR>', { desc = 'npm run [b]uild' })
vim.keymap.set('n', '<leader><leader>i', ':TermExec cmd="npm install" dir=git_dir<CR>', { desc = 'npm [i]nstall' })
vim.keymap.set('n', '<leader><leader>t', ':TermSelect<CR>', { desc = '[t]erminal select' })
