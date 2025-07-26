return {
	{
		'axkirillov/easypick.nvim',
		dependencies = 'nvim-telescope/telescope.nvim',
		config = function()
			local easypick = require 'easypick'
			local projectPath = '~/Elysium/Projects/'

			easypick.setup {
				pickers = {
					{
						-- name for your custom picker, that can be invoked using :Easypick <name> (supports tab completion)
						name = 'Projects',
						-- the command to execute, output has to be a list of plain text entries
						command = 'ls ' .. projectPath,
						-- specify your custom previwer, or use one of the easypick.previewers
						-- previewer = easypick.previewers.default(),
						-- the command to execute when selecting an entry
						action = easypick.actions.nvim_commandf('cd ' .. projectPath .. '%s | SessionRestore'),
						opts = require('telescope.themes').get_dropdown {},
					},
				},
			}

			vim.keymap.set('n', '<leader>sp', ':Easypick Projects<CR>', { desc = '[s]earch [p]rojects' })
		end,
	},
	{
		'rmagatti/auto-session',
		lazy = false,
		opts = {
			log_level = vim.log.levels.ERROR,
			allowed_dirs = { '~/Elysium/Projects/*', '~/Elysium/Projects/*/*', '~/.config/nvim', '~/Elysium/Obsidian Vault/' },
		},
		keys = {
			{ '<leader>os', '<cmd>SessionRestore<cr>', desc = '[o]pen [s]ession of current directory' },
			{ '<leader>or', '<cmd>RecentSession<cr>', desc = '[o]pen [r]ecent session' },
			{ '<leader>ss', '<cmd>Telescope session-lens<cr>', desc = '[s]earch [s]essions' },
		},
		config = function(_, opts)
			require('auto-session').setup(opts)
			require('telescope').load_extension 'session-lens'
		end,
	},
}
