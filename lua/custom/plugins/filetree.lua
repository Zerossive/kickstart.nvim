-- NOTE: when changing file tree plugins, make sure to update CLOSE command in AUTO-SESSION

return {
	{
		'stevearc/oil.nvim',
		-- dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function(_, opts)
			require('oil').setup(opts)
			vim.keymap.set('n', '<leader>of', ':OilPreview<CR>', { desc = '[o]pen [f]ile explorer' })
			-- vim.api.nvim_set_hl(0, 'OilDir', { fg = '#1e1e2e', bg = '#74c7ec' })
		end,
		opts = {
			-- experimental_watch_for_changes = true,
			default_file_explorer = true,
			delete_to_trash = true,
			skip_confirm_for_simple_edits = true,
			keymaps = {
				['g?'] = 'actions.show_help',
				['<CR>'] = 'actions.select',
				['l'] = 'actions.select',
				['<C-v>'] = 'actions.select_vsplit',
				['<C-x>'] = 'actions.select_split',
				['<C-t>'] = 'actions.select_tab',
				['<C-p>'] = 'actions.preview',
				-- ['<C-c>'] = 'actions.close',
				['q'] = 'actions.close',
				-- ['<C-l>'] = 'actions.refresh',
				-- ['-'] = 'actions.parent',
				['h'] = 'actions.parent',
				['<BS>'] = 'actions.open_cwd',
				['`'] = 'actions.cd',
				['~'] = 'actions.tcd',
				['gs'] = 'actions.change_sort',
				['gx'] = 'actions.open_external',
				['g.'] = 'actions.toggle_hidden',
				['g\\'] = 'actions.toggle_trash',
				['gy'] = 'actions.copy_entry_path',
				['='] = 'actions.refresh',
				-- ['<CR>'] = 'actions.open_terminal',
			},
			use_default_keymaps = false,
			view_options = {
				show_hidden = true,
				natural_order = true,
				is_always_hidden = function(name, bufnr)
					return name == '..' or name == '.git' -- hides ../ ang .git/ directories when hidden files are shown
				end,
			},
			columns = {
				-- 	{ 'size', highlight = 'Special' },
				-- 	{ 'birthtime', highlight = 'OilSocket' },
				{ 'icon', add_padding = false },
			},
		},
	},
	{
		'mikavilpas/yazi.nvim',
		event = 'VeryLazy',
		keys = {
			-- 👇 in this section, choose your own keymappings!
			{
				'<leader>-',
				'<cmd>Yazi<cr>',
				desc = 'Open yazi at the current file',
			},
			{
				-- Open in the current working directory
				'<leader>oy',
				'<cmd>Yazi cwd<cr>',
				desc = "Open the file manager in nvim's working directory",
			},
			-- {
			-- 	-- NOTE: this requires a version of yazi that includes
			-- 	-- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
			-- 	'<c-up>',
			-- 	'<cmd>Yazi toggle<cr>',
			-- 	desc = 'Resume the last yazi session',
			-- },
		},
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,

			-- enable these if you are using the latest version of yazi
			use_ya_for_events_reading = true,
			use_yazi_client_id_flag = true,

			keymaps = {
				show_help = '<f1>',
			},
		},
	},
}
