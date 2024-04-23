return {
	{
		'Exafunction/codeium.vim',
		event = 'BufEnter',
		config = function()
			vim.g.codeium_disable_bindings = 1

			vim.keymap.set('i', '<C-a>', function()
				return vim.fn['codeium#Accept']()
			end, { expr = true, silent = true })

			-- vim.keymap.set('i', '<c-;>', function()
			-- 	return vim.fn['codeium#CycleCompletions'](1)
			-- end, { expr = true, silent = true })

			-- vim.keymap.set('i', '<c-,>', function()
			-- 	return vim.fn['codeium#CycleCompletions'](-1)
			-- end, { expr = true, silent = true })

			vim.keymap.set('i', '<c-x>', function()
				return vim.fn['codeium#Clear']()
			end, { expr = true, silent = true })
		end,
	},
	-- {
	-- 	'jackMort/ChatGPT.nvim',
	-- 	event = 'VeryLazy',
	-- 	config = function()
	-- 		require('chatgpt').setup {}
	-- 	end,
	-- 	dependencies = {
	-- 		'MunifTanjim/nui.nvim',
	-- 		'nvim-lua/plenary.nvim',
	-- 		'folke/trouble.nvim',
	-- 		'nvim-telescope/telescope.nvim',
	-- 	},
	-- },
	-- {
	-- 	'Exafunction/codeium.nvim',
	-- 	dependencies = {
	-- 		'nvim-lua/plenary.nvim',
	-- 		'hrsh7th/nvim-cmp',
	-- 	},
	-- 	config = function()
	-- 		require('codeium').setup {}
	-- 	end,
	-- },
}
