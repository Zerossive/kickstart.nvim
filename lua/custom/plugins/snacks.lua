return {
	{
		'folke/snacks.nvim',
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			notifier = { enabled = true },
			image = { enable = true },
			picker = { enable = true },
			scroll = { enable = true, animate_repeat = { delay = 1000 } },
			gh = { enable = true },
			input = { enable = true },
		},
		keys = {
			--  [[ Pickers ]]
			{
				'<leader>fs',
				function()
					Snacks.picker.smart()
				end,
				desc = 'find files smart',
			},
			{
				'<leader>ft',
				function()
					Snacks.picker()
				end,
				desc = 'find picker types',
			},
			{
				'<leader>fr',
				function()
					Snacks.picker.resume()
				end,
				desc = 'find resume',
			},
			-- find
			-- {
			-- 	'<leader>fc',
			-- 	function()
			-- 		Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
			-- 	end,
			-- 	desc = 'find config files',
			-- },
			{
				'<leader>ff',
				function()
					Snacks.picker.files()
				end,
				desc = 'find files',
			},
			{
				'<leader>fp',
				function()
					Snacks.picker.projects()
				end,
				desc = 'find projects',
			},
			{
				'<leader>fo',
				function()
					Snacks.picker.recent()
				end,
				desc = 'find old files',
			},
			{
				'<leader>fg',
				function()
					Snacks.picker.grep()
				end,
				desc = 'find by grep',
			},
			-- {
			-- 	'<leader>fw',
			-- 	function()
			-- 		Snacks.picker.grep_word()
			-- 	end,
			-- 	desc = 'find current word',
			-- 	mode = { 'n', 'x' },
			-- },
			{
				'<leader>fd',
				function()
					Snacks.picker.diagnostics()
				end,
				desc = 'find diagnostics',
			},
			{
				'<leader>fh',
				function()
					Snacks.picker.help()
				end,
				desc = 'find help',
			},
			{
				'<leader>fi',
				function()
					Snacks.picker.icons()
				end,
				desc = 'find icons',
			},
			{
				'<leader>fk',
				function()
					Snacks.picker.keymaps()
				end,
				desc = 'find keymaps',
			},
			{
				'<leader>fq',
				function()
					Snacks.picker.qflist()
				end,
				desc = 'find quickfix',
			},
			{
				'<leader>fu',
				function()
					Snacks.picker.undo()
				end,
				desc = 'find undo tree',
			},
			-- Buffer
			-- {
			-- 	'<leader>fbf',
			-- 	function()
			-- 		Snacks.picker.buffers()
			-- 	end,
			-- 	desc = 'find open buffer files',
			-- },
			{
				'<leader>f/',
				function()
					Snacks.picker.lines()
				end,
				desc = 'find in buffer /',
			},
			-- {
			-- 	'<leader>fbg',
			-- 	function()
			-- 		Snacks.picker.grep_buffers()
			-- 	end,
			-- 	desc = 'find in open buffers by grep',
			-- },
			-- {
			-- 	'<leader>fbd',
			-- 	function()
			-- 		Snacks.picker.diagnostics_buffer()
			-- 	end,
			-- 	desc = 'find open buffer diagnostics',
			-- },
			-- LSP
			{
				'gd',
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = 'goto definition',
			},
			{
				'gD',
				function()
					Snacks.picker.lsp_declarations()
				end,
				desc = 'goto declaration',
			},
			{
				'gr',
				function()
					Snacks.picker.lsp_references()
				end,
				nowait = true,
				desc = 'goto references',
			},
			{
				'gI',
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = 'goto Implementation',
			},
			{
				'gy',
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = 'goto type definition',
			},

			-- [[ Notifier ]]
			{
				'<leader>nh',
				function()
					Snacks.notifier.hide()
				end,
				desc = 'notifier hide',
			},
			{
				'<leader>nl',
				function()
					Snacks.notifier.show_history()
				end,
				desc = 'notifier list',
			},
			{
				'<leader>nf',
				function()
					Snacks.picker.notifications()
				end,
				desc = 'find notifications',
			},

			-- [[ Lazygit ]]
			{
				'<leader>gl',
				function()
					Snacks.lazygit()
				end,
				desc = 'lazy git',
			},

			-- [[ GitHub ]]
			{
				'<leader>gi',
				function()
					Snacks.picker.gh_issue()
				end,
				desc = 'github issues',
			},
			{
				'<leader>gI',
				function()
					Snacks.picker.gh_issue { state = 'all' }
				end,
				desc = 'github issues (all)',
			},

			-- [[ Image ]]
			{
				'<leader>oi',
				function()
					Snacks.image.hover()
				end,
				desc = 'open image',
			},
		},
	},
}
