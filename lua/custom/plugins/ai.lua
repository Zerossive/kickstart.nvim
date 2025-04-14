return {
	-- {
	-- 	'Exafunction/codeium.vim',
	-- 	event = 'BufEnter',
	-- 	config = function()
	-- 		vim.g.codeium_disable_bindings = 1
	--
	-- 		vim.keymap.set('i', '<C-a>', function()
	-- 			return vim.fn['codeium#Accept']()
	-- 		end, { expr = true, silent = true })
	--
	-- 		-- vim.keymap.set('i', '<c-;>', function()
	-- 		-- 	return vim.fn['codeium#CycleCompletions'](1)
	-- 		-- end, { expr = true, silent = true })
	--
	-- 		-- vim.keymap.set('i', '<c-,>', function()
	-- 		-- 	return vim.fn['codeium#CycleCompletions'](-1)
	-- 		-- end, { expr = true, silent = true })
	--
	-- 		vim.keymap.set('i', '<c-x>', function()
	-- 			return vim.fn['codeium#Clear']()
	-- 		end, { expr = true, silent = true })
	-- 	end,
	-- },
	{
		'supermaven-inc/supermaven-nvim',
		config = function()
			require('supermaven-nvim').setup {
				keymaps = {
					accept_suggestion = '<C-a>',
					-- accept_suggestion = '<Tab>',
					-- clear_suggestion = '<C-]>',
					-- accept_word = '<C-j>',
				},
				-- ignore_filetypes = { cpp = true }, -- or { "cpp", }
				-- color = {
				-- 	suggestion_color = '#ffffff',
				-- 	cterm = 244,
				-- },
				-- log_level = 'info', -- set to "off" to disable logging completely
				-- disable_inline_completion = false, -- disables inline completion for use with cmp
				-- disable_keymaps = false, -- disables built in keymaps for more manual control
				-- condition = function()
				-- 	return false
				-- end, -- condition to check for stopping supermaven, `true` means to stop supermaven when the condition is true.
			}

			vim.keymap.set('n', '<LEADER>ta', '<CMD>SupermavenToggle<CR>', { desc = '[]t]oggle [a]i' })
		end,
	},
}
