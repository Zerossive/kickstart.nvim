local M = {}

-- [[ Custom Commands ]]

-- Example command
-- vim.api.nvim_create_user_command('BufOnly', function(opts)
-- 	local arguments = opts.args
-- 	vim.cmd(string.format('silent! source ~/.local/share/nvim/sessions/%s', opts.args)) -- %s is the argument
-- end, { nargs = 1|*|?|+, range = true|false, complete = ... }) -- number of expected arguments

-- Close all but current visible buffer
vim.api.nvim_create_user_command('BufOnly', function()
	local current_buffer = vim.fn.bufnr '%' -- Get the buffer number of the current buffer
	local visible_buffers = {}

	-- Iterate through all windows and add their visible buffers to the visible_buffers table
	for _, winid in ipairs(vim.api.nvim_list_wins()) do
		local bufnr = vim.api.nvim_win_get_buf(winid)
		visible_buffers[bufnr] = true
	end

	local buffers = vim.api.nvim_list_bufs()
	for _, buf in ipairs(buffers) do
		-- Check if the buffer is not in the list of visible buffers and not the current buffer
		if not visible_buffers[buf] and buf ~= current_buffer then
			local buf_modified = vim.fn.getbufvar(buf, '&modified') == 1
			if buf_modified then
				vim.api.nvim_err_writeln('Buffer ' .. buf .. ' has unsaved changes. Operation canceled.\n')
				return
			else
				vim.cmd('silent! bdelete ' .. buf)
			end
		end
	end
	vim.api.nvim_out_write 'All buffers closed\n'
end, { desc = 'Close all but current visible buffers' })

-- Source the most recent session
vim.api.nvim_create_user_command('RecentSession', function()
	local dir_path = '/home/danny/.local/share/nvim/sessions/'
	local cmd = 'bash -c "ls -rt ' .. dir_path .. '/* | tail -1"'
	local recent_file = vim.fn.system(cmd)
	recent_file = recent_file:gsub('%%', '\\%%') -- Escape %% characters
	vim.cmd('source ' .. recent_file)
end, { desc = 'Open most recent session' })

-- Open Oil with preview
vim.api.nvim_create_user_command('OilPreview', function()
	local oil_open = false
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_get_name(buf):match '^oil://' then
			oil_open = true
			break
		end
	end
	if not oil_open then
		vim.cmd 'Oil'
	end
	vim.cmd 'lua require("oil.util").run_after_load(0, function() require("oil").open_preview() end)'
end, { desc = 'Open Oil with preview' })

-- Open the daily note
vim.api.nvim_create_user_command('DailyNote', function()
	-- Function to expand a particular snippet by name
	local function expand_snippet_by_name(filetype, snippet_name)
		local ls = require 'luasnip'
		for _, snippet in ipairs(ls.get_snippets(filetype)) do
			if snippet.name == snippet_name then
				ls.snip_expand(snippet)
				return
			end
		end
		print('Snippet not found: ' .. snippet_name)
	end

	-- Open the daily note
	vim.cmd('edit ~/Elysium/Obsidian Vault/Notes/Daily/' .. os.date '%Y-%m-%d' .. '.md')
	-- Expand the daily note template if the buffer is empty
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	if #lines == 0 or (#lines == 1 and lines[1] == '') then
		expand_snippet_by_name('markdown', 'Daily Note Template')
		-- Exit insert mode
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc', true, false, false), 'i', false)
	end
end, { desc = 'Open the daily note' })

-- Run code on selected text and print result
vim.api.nvim_create_user_command('RC', function(opts)
	vim.cmd 'normal! gv"ay'
	local reg_a = vim.fn.getreg 'a'
	local result = vim.fn.system('echo ' .. reg_a .. ' | ' .. opts.args)
	print(result)
end, { desc = 'Run code on selected text and print result', range = true, nargs = '+', complete = 'shellcmd' })

return M
