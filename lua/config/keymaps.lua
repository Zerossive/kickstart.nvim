-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>cq', vim.diagnostic.setloclist, { desc = 'open diagnostic quickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- navigation
-- vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'move up 1/2 page and center' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'move down 1/2 page and center' })
for i = 1, 9 do
	vim.keymap.set({ 'n', 'i', 'v' }, '<m-' .. i .. '>', '<cmd>tabnext ' .. i .. '<cr>', {
		desc = 'go to tab ' .. i,
	})
end
vim.keymap.set({ 'n', 'i', 'v' }, '<m-0>', '<cmd>tablast<cr>', {
	desc = 'go to last tab',
})
vim.keymap.set({ 'n', 'i', 'v' }, '<m-.>', '<cmd>tabnext<cr>', {
	desc = 'go to next tab',
})
vim.keymap.set({ 'n', 'i', 'v' }, '<m-,>', '<cmd>tabprevious<cr>', {
	desc = 'go to pevious tab',
})
vim.keymap.set({ 'n', 'i', 'v' }, '<m->>', '<cmd>tabmove +1<cr>', {
	desc = 'move tab right',
})
vim.keymap.set({ 'n', 'i', 'v' }, '<m-<>', '<cmd>tabmove -1<cr>', {
	desc = 'move tab left',
})

-- sessions
vim.keymap.set('n', '<leader>on', ':cd ~/.config/nvim | AutoSession restore<CR>', { desc = 'open neovim config' })
vim.keymap.set('n', '<leader>oo', ':cd ~/Elysium/Obsidian\\ Vault/ | AutoSession restore<CR>', { desc = 'open obsidian vault' })
vim.keymap.set('n', '<leader>oq', ':e ~/Elysium/Obsidian\\ Vault/Quick\\ Note.md<CR>', { desc = 'open quick note' })
vim.keymap.set('n', '<leader>ol', ':!dolphin ~/.local/share/nvim/sessions &<CR>', { desc = 'open local session storage' })

-- file operations
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = 'write file' })
vim.keymap.set('n', '<leader>W', ':wall<CR>', { desc = 'Write all files' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = 'quit file' })
vim.keymap.set('n', '<leader>Q', ':qall<CR>', { desc = 'Quit all files' })

-- directory operations
vim.keymap.set('n', '<leader>o.', ':cd %:p:h<CR>', { desc = 'open . as root directory' })
vim.keymap.set('n', '<leader>od', ':!dolphin . &<CR>', { desc = 'open directory' })

-- text manipulation
vim.keymap.set('n', '<leader>by', function()
	local cursor_position = vim.api.nvim_win_get_cursor(0)
	vim.cmd 'normal GVggy'
	vim.api.nvim_win_set_cursor(0, cursor_position)
end, { desc = 'buffer yank' })
vim.keymap.set('i', '<C-8>', 'viW*Ncgn', { desc = 'replace current word' })
vim.keymap.set('n', '<C-8>', 'viW*Ncgn', { desc = 'replace current word' })
vim.keymap.set('i', '<C-e>', '<ESC>A', { desc = 'go to end of line' })
vim.keymap.set('i', 'jj', '<Escape>', { desc = 'normal mode' })

-- toggles
-- vim.keymap.set('n', '<leader>tw', '<cmd>setlocal wrap! wrap?<cr>', { desc = 'toggle wrap' }) -- handled by mini.basics

-- vim
vim.keymap.set('n', '<leader>pr', '<cmd>restart<cr>', { desc = 'restart' })

-- plugins
vim.keymap.set('n', '<leader>pu', function()
	vim.pack.update()
end, { desc = 'update plugins' })
vim.keymap.set('n', '<leader>pi', function()
	vim.pack.update(nil, { offline = true })
end, { desc = 'inspect plugin state' })

-- other
vim.keymap.set('n', '<leader>bo', ':BufOnly<CR>', { desc = 'close other buffers' })

vim.keymap.set('v', '<C-r>', ':RC ', { desc = 'run command on selected text' })
