return {
	{ -- Fuzzy Finder (files, lsp, etc)
		'nvim-telescope/telescope.nvim',
		event = 'VimEnter',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				-- If encountering errors, see telescope-fzf-native README for install instructions
				'nvim-telescope/telescope-fzf-native.nvim',

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = 'make',

				-- `cond` is a condition used to determine whether this plugin should be
				-- installed and loaded.
				cond = function()
					return vim.fn.executable 'make' == 1
				end,
			},
			{ 'nvim-telescope/telescope-ui-select.nvim' },

			-- Useful for getting pretty icons, but requires a Nerd Font.
			-- { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
		},
		config = function()
			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
			require('telescope').setup {
				-- You can put your default mappings / updates / etc. in here
				--  All the info you're looking for is in `:help telescope.setup()`
				--
				defaults = {
					-- mappings = {
					--   i = { ['<c-enter>'] = 'to_fuzzy_refine' },
					-- },
					path_display = { 'truncate' },
					file_ignore_patterns = {
						'node_modules',
					},
				},
				extensions = {
					['ui-select'] = {
						require('telescope.themes').get_dropdown(),
					},
				},
			}

			-- Enable telescope extensions, if they are installed
			pcall(require('telescope').load_extension, 'fzf')
			pcall(require('telescope').load_extension, 'ui-select')

			-- See `:help telescope.builtin`
			local builtin = require 'telescope.builtin'
			vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[s]earch [h]elp' })
			vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[s]earch [k]eymaps' })
			vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[s]earch [f]iles' })
			vim.keymap.set('n', '<leader>st', builtin.builtin, { desc = '[s]earch [t]elescopes' })
			vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[s]earch current [w]ord' })
			vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[s]earch by [g]rep' })
			vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[s]earch [d]iagnostics' })
			vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[s]earch [r]esume' })
			vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = '[s]earch [o]ld files' })
			vim.keymap.set('n', '<leader>bs', builtin.buffers, { desc = '[b]uffer [s]earch' })
			vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = '[s]earch [b]buffer' })

			-- Slightly advanced example of overriding default behavior and theme
			vim.keymap.set('n', '<leader>/', function()
				-- You can pass additional configuration to telescope to change theme, layout, etc.
				--  Themes: get_dropdown, get_cursor, get_ivy
				builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
					-- winblend = 10, -- transparency
					previewer = false,
				})
			end, { desc = '[/] fuzzily search in current buffer' })

			-- Also possible to pass additional configuration options.
			--  See `:help telescope.builtin.live_grep()` for information about particular keys
			vim.keymap.set('n', '<leader>s/', function()
				builtin.live_grep {
					grep_open_files = true,
					prompt_title = 'Live Grep in Open Files',
				}
			end, { desc = '[s]earch [/] open files by grep' })

			-- Shortcut for searching your neovim configuration files
			vim.keymap.set('n', '<leader>sn', function()
				builtin.find_files { cwd = vim.fn.stdpath 'config' }
			end, { desc = '[s]earch [n]eovim files' })
		end,
	},
	{
		'benfowler/telescope-luasnip.nvim',
		config = function()
			require('telescope').load_extension 'luasnip'

			vim.keymap.set('n', '<leader>sl', ':Telescope luasnip<CR>', { desc = '[s]earch [l]uasnips' })
		end,
	},
	{
		'folke/flash.nvim',
		event = 'VeryLazy',
		opts = {
			keys = { 'f', 'F', 't', 'T', ';', ',' },
		},
		keys = {
			{
				's',
				mode = { 'n', 'x', 'o' },
				function()
					require('flash').jump()
				end,
				desc = 'Flash',
			},
		},
	},
	{
		'ziontee113/icon-picker.nvim',
		config = function()
			require('icon-picker').setup { disable_legacy_commands = true }
			-- vim.keymap.set('n', '<Leader>sc', '<cmd>IconPickerNormal<cr>', { noremap = true, silent = true, desc = '[s]earch [c]haracter symbols' })
			vim.keymap.set('n', '<Leader>sc', '<cmd>IconPickerYank<cr>', { noremap = true, silent = true, desc = '[s]earch [c]haracter symbols' }) --> Yank the selected icon into register
		end,
	},
}
