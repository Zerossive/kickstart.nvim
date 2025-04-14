-- [[ Markdown ]]

-- [[ Options ]]

vim.o.wrap = true
-- vim.o.spell = true
vim.diagnostic.enable(false)
vim.keymap.set('n', '\\d', function()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { silent = true, noremap = true, desc = 'toggle diagnostics' })

-- [[ Keymaps]]
vim.keymap.set('n', '<leader><leader>o', '<CMD>ObsidianTOC<CR>', { desc = '[o]utline' })
vim.keymap.set('n', '<leader><leader>n', '<CMD>ObsidianNew<CR>', { desc = '[n]ew note' })
vim.keymap.set('n', '<leader><leader>d', '<CMD>DailyNote<CR>', { desc = '[d]aily note' })
vim.keymap.set('n', '<leader><leader>r', '<CMD>ObsidianRename<CR>', { desc = '[r]ename note' })
vim.keymap.set('n', '<leader><leader>x', '<CMD>ObsidianToggleCheckbox<CR>', { desc = 'toggle checkbo[x]' })
vim.keymap.set('n', '<leader><leader>s', '<CMD>ObsidianQuickSwitch<CR>', { desc = 'quick [s]witch' })
vim.keymap.set('n', '<leader><leader>t', '<CMD>ObsidianTags<CR>', { desc = '[t]ags' })
vim.keymap.set('n', '<leader><leader>b', '<CMD>ObsidianBacklinks<CR>', { desc = '[b]acklinks' })
vim.keymap.set('n', '<leader><leader>m', '<CMD>RenderMarkdown toggle<CR>', { desc = 'toggle [m]arkview' })
vim.keymap.set('n', '<leader><leader>i', '<CMD>normal ysiW*<CR>', { desc = '[i]talic' })
vim.keymap.set('n', '<leader><leader>b', '<CMD>normal ysiW*.<CR>', { desc = '[b]old' })
vim.keymap.set('n', '<leader><leader>M', '<CMD>MarkdownPreview<CR>', { desc = 'preview [M]arkdown' })
vim.keymap.set('n', '<leader><leader>h', function()
	local cur_pos = vim.api.nvim_win_get_cursor(0) -- Get cursor position
	local line = vim.fn.getline '.'
	if line:match '^#+[%s ]' then
		vim.cmd 'normal! I#' -- Add # at the beginning, even if no space after existing #s
		cur_pos[2] = cur_pos[2] + 1 -- Adjust for adding 1 character
	else
		vim.cmd 'normal! I# ' -- Add '# ' at the beginning of a non-heading line
		cur_pos[2] = cur_pos[2] + 2 -- Adjust for adding 2 characters
	end
	vim.api.nvim_win_set_cursor(0, cur_pos) -- Restore cursor
end, { desc = 'add [h]eading' })
vim.keymap.set('n', '<leader><leader>H', function()
	local cur_pos = vim.api.nvim_win_get_cursor(0) -- Get cursor position
	local line = vim.fn.getline '.'
	if line:match '^#+[%s ]' then
		if line:match '^#%s' then -- Single # with space
			vim.cmd 'normal! 02x' -- Delete '# '
			cur_pos[2] = cur_pos[2] - 2 -- Adjust for deleting 2 characters
		else
			vim.cmd 'normal! 0f#x' -- Delete the first '#'
			cur_pos[2] = cur_pos[2] - 1 -- Adjust for deleting 1 character
		end
	end
	if cur_pos[2] < 0 then
		cur_pos[2] = 0 -- Account for negative cursor position
	end
	vim.api.nvim_win_set_cursor(0, cur_pos) -- Restore cursor
end, { desc = 'remove [H]eading' })
vim.keymap.set('n', '<leader><leader>p', function()
	vim.cmd 'normal! a[]()F]lpF[l'
	vim.cmd 'startinsert'
end, { desc = '[p]aste link' })
vim.keymap.set('n', '<leader><leader>P', function()
	local cur_pos = vim.api.nvim_win_get_cursor(0) -- Get cursor position
	vim.cmd 'normal ysiW]f]a()P'
	cur_pos[2] = cur_pos[2] + 1 -- Adjust for adding 1 character
	vim.api.nvim_win_set_cursor(0, cur_pos) -- Restore cursor
end, { desc = '[P]aste link into word' })
