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

			vim.keymap.set('n', '<LEADER>ta', '<CMD>SupermavenToggle<CR>', { desc = 'toggle ai' })
		end,
	},
	{
		'folke/sidekick.nvim',
		opts = {
			nes = { enabled = false },
			-- add any options here
			cli = {
				mux = {
					backend = 'zellij',
					enabled = true,
				},
				win = { keys = { prompt = { '<a-p>', 'prompt', mode = 't', desc = 'insert prompt or context' } } },
				-- prompts = {
				-- 	test = 'explain the line of code at {position}',
				-- },
			},
		},
		keys = {
			-- {
			-- 	'<tab>',
			-- 	function()
			-- 		-- if there is a next edit, jump to it, otherwise apply it if any
			-- 		if not require('sidekick').nes_jump_or_apply() then
			-- 			return '<Tab>' -- fallback to normal tab
			-- 		end
			-- 	end,
			-- 	expr = true,
			-- 	desc = 'Goto/Apply Next Edit Suggestion',
			-- },
			{
				'<c-.>',
				function()
					require('sidekick.cli').focus()
				end,
				desc = 'Sidekick Focus',
				mode = { 'n', 't', 'i', 'x' },
			},
			{
				'<leader>aa',
				function()
					require('sidekick.cli').toggle()
				end,
				desc = 'Sidekick Toggle CLI',
			},
			{
				'<leader>as',
				function()
					require('sidekick.cli').select()
				end,
				-- Or to select only installed tools:
				-- require("sidekick.cli").select({ filter = { installed = true } })
				desc = 'Select CLI',
			},
			{
				'<leader>ad',
				function()
					require('sidekick.cli').close()
				end,
				desc = 'Detach a CLI Session',
			},
			{
				'<leader>at',
				function()
					require('sidekick.cli').send { msg = '{this}' }
				end,
				mode = { 'x', 'n' },
				desc = 'Send This',
			},
			{
				'<leader>af',
				function()
					require('sidekick.cli').send { msg = '{file}' }
				end,
				desc = 'Send File',
			},
			{
				'<leader>av',
				function()
					require('sidekick.cli').send { msg = '{selection}' }
				end,
				mode = { 'x' },
				desc = 'Send Visual Selection',
			},
			{
				'<leader>ap',
				function()
					require('sidekick.cli').prompt()
				end,
				mode = { 'n', 'x' },
				desc = 'Sidekick Select Prompt',
			},
			-- Example of a keybinding to open one directly
			-- {
			-- 	'<leader>ag',
			-- 	function()
			-- 		require('sidekick.cli').toggle { name = 'gemini', focus = true }
			-- 	end,
			-- 	desc = 'Sidekick Toggle Gemini',
			-- },
		},
	},
}
