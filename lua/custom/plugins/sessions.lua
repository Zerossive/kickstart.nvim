return {
	{
		'axkirillov/easypick.nvim',
		requires = 'nvim-telescope/telescope.nvim',
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

			vim.keymap.set('n', '<leader>sp', ':Easypick Projects<CR>', { desc = '[S]earch [P]rojects' })
		end,
	},
	{
		'rmagatti/auto-session',
		config = function()
			require('auto-session').setup {
				log_level = vim.log.levels.ERROR,
				-- auto_session_suppress_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
				auto_session_allowed_dirs = { '~/Elysium/Projects/*', '~/.config/nvim', '~/Elysium/Obsidian Vault/' },
				-- auto_session_enable_last_session = true,
				pre_save_cmds = { 'Neotree close' }, -- close filetree before saving to prevent errors
			}

			require('telescope').load_extension 'session-lens'

			vim.keymap.set('n', '<leader>os', ':SessionRestore<CR>', { desc = '[O]pen [S]ession of Current Directory' })
			vim.keymap.set('n', '<leader>ss', ':Telescope session-lens<CR>', { desc = '[S]earch [S]essions' })

			-- Keybind to source the most recently modified file in a directory
			local function source_recent_file(dir_path)
				local cmd = 'bash -c "ls -rt ' .. dir_path .. '/* | tail -1"'
				local recent_file = vim.fn.system(cmd)
				recent_file = recent_file:gsub('%%', '\\%%') -- Escape %% characters
				vim.cmd('source ' .. recent_file)
			end

			vim.keymap.set('n', '<leader>or', function()
				source_recent_file '/home/danny/.local/share/nvim/sessions/'
			end, { desc = '[O]pen [R]ecent Session' })
		end,
	},
}
