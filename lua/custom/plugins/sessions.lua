return {
	{
		'rmagatti/auto-session',
		lazy = false,
		opts = {
			log_level = vim.log.levels.ERROR,
			allowed_dirs = { '~/Elysium/Projects/*', '~/Elysium/Projects/*/*', '~/.config/nvim', '~/Elysium/Obsidian Vault/' },
		},
		keys = {
			{ '<leader>os', '<cmd>AutoSession restore<cr>', desc = 'open session of current directory' },
			{ '<leader>or', '<cmd>RecentSession<cr>', desc = 'open recent session' },
			-- { '<leader>ss', '<cmd>Telescope session-lens<cr>', desc = 'search sessions' },
		},
		config = function(_, opts)
			require('auto-session').setup(opts)
			require('telescope').load_extension 'session-lens'
		end,
	},
}
