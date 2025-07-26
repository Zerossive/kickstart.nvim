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
			note_path_func = function(spec)
				local path = spec.dir / tostring(spec.title)
				return path:with_suffix '.md'
			end,
			disable_frontmatter = true,
			templates = {
				subdir = 'Templates',
			},
			attachments = {
				img_folder = 'Files',
			},
			ui = {
				enable = false,
			},
			---@param url string
			follow_url_func = function(url)
				-- Open the URL in the default web browser.
				-- vim.fn.jobstart { 'open', url } -- Mac OS
				vim.fn.jobstart { 'xdg-open', url } -- linux
			end,
		},
	},
	{
		'uga-rosa/ccc.nvim',
		config = function()
			local ccc = require 'ccc'
			ccc.setup {
				default_color = '#40BFBF',
				inputs = {
					ccc.input.hsl,
					ccc.input.rgb,
				},
				mappings = {
					['?'] = function()
						vim.cmd ':split | :help ccc-action'
					end,
				},
			}
			vim.keymap.set('n', '<leader>op', ':CccPick<CR>', { desc = '[o]pen color [p]icker' })
		end,
	},
	{ -- Add surround support
		'kylechui/nvim-surround',
		version = '*', -- Use for stability; omit to use `main` branch for the latest features
		event = 'VeryLazy',
		opts = {},
	},
	{
		'nvim-orgmode/orgmode',
		event = 'VeryLazy',
		ft = { 'org' },
		config = function()
			-- Setup orgmode
			require('orgmode').setup {
				org_agenda_files = '~/Elysium/orgfiles/**/*',
				org_default_notes_file = '~/Elysium/orgfiles/refile.org',
				org_agenda_span = 'day',
				org_startup_folded = 'content',
				org_deadline_warning_days = 3,
			}
		end,
	},
	{
		'nguyenvukhang/nvim-toggler',
		loading = 'lazy',
		opts = {
			inverses = {
				['dark'] = 'light',
				['!=='] = '===',
				['[ ]'] = '[x]',
			},
			remove_default_keybinds = true,
			autoselect_longest_match = true,
		},
		keys = {
			{
				'<leader>ci',
				function()
					require('nvim-toggler').toggle()
				end,
				desc = '[c]ode [i]nvert',
			},
		},
	},
	{ 'tpope/vim-eunuch' },
}
