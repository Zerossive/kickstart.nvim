return {
	{
		'alexghergh/nvim-tmux-navigation',
		config = function()
			local nvim_tmux_nav = require 'nvim-tmux-navigation'

			nvim_tmux_nav.setup {
				disable_when_zoomed = true, -- defaults to false
			}

			vim.keymap.set('n', '<C-h>', nvim_tmux_nav.NvimTmuxNavigateLeft)
			vim.keymap.set('n', '<C-j>', nvim_tmux_nav.NvimTmuxNavigateDown)
			vim.keymap.set('n', '<C-k>', nvim_tmux_nav.NvimTmuxNavigateUp)
			vim.keymap.set('n', '<C-l>', nvim_tmux_nav.NvimTmuxNavigateRight)
			-- vim.keymap.set('n', "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
			-- vim.keymap.set('n', "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
		end,
	},
	{
		'epwalsh/obsidian.nvim',
		version = '*', -- recommended, use latest release instead of latest commit
		lazy = true,
		ft = 'markdown',
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
		--   "BufReadPre path/to/my-vault/**.md",
		--   "BufNewFile path/to/my-vault/**.md",
		-- },
		dependencies = {
			-- Required.
			'nvim-lua/plenary.nvim',
		},
		opts = {
			workspaces = {
				{
					name = 'Elysium',
					path = '~/Elysium/Obsidian Vault/',
				},
			},
			notes_subdir = 'Notes',
			daily_notes = {
				folder = 'Notes/Daily',
				template = 'Templates/Template Daily.md',
			},
			new_notes_location = 'notes_subdir',
			disable_frontmatter = true,
			templates = {
				subdir = 'Templates',
			},
			attachments = {
				img_folder = 'Files',
			},
		},
	},
}
