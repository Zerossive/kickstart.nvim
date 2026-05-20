-- NOTE: when changing file tree plugins, make sure to update CLOSE command in AUTO-SESSION

return {
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
			-- {
			-- 	-- Open in the current working directory
			-- 	'<leader>oy',
			-- 	'<cmd>Yazi cwd<cr>',
			-- 	desc = "Open the file manager in nvim's working directory",
			-- },
			{
				-- NOTE: this requires a version of yazi that includes
				-- https://github.com/sxyazi/yazi/pull/1305 from 2024-07-18
				'<leader>_',
				'<cmd>Yazi toggle<cr>',
				desc = 'Resume the last yazi session',
			},
		},
		opts = {
			-- if you want to open yazi instead of netrw, see below for more info
			open_for_directories = false,

			-- enable these if you are using the latest version of yazi
			use_ya_for_events_reading = true,
			use_yazi_client_id_flag = true,

			keymaps = {
				show_help = 'g?',
			},
		},
	},
	{
		'stevearc/oil.nvim',
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			columns = { 'icon', 'size', 'mtime' },
			delete_to_trash = true,
			watch_for_changes = true,
		},
		keys = {
			{
				'-',
				'<cmd>Oil --preview<cr>',
				desc = 'Oil: Open parent directory',
				mode = 'n',
			},
		},
		lazy = false,
	},
}
