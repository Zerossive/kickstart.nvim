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
				desc = '[f]ind files [s]mart',
			},
			{
				'<leader>ft',
				function()
					Snacks.picker()
				end,
				desc = '[f]ind picker [t]ypes',
			},
			{
				'<leader>fr',
				function()
					Snacks.picker.resume()
				end,
				desc = '[f]ind [r]esume',
			},
			-- find
			{
				'<leader>fc',
				function()
					Snacks.picker.files { cwd = vim.fn.stdpath 'config' }
				end,
				desc = '[f]ind [c]onfig files',
			},
			{
				'<leader>ff',
				function()
					Snacks.picker.files()
				end,
				desc = '[f]ind [f]iles',
			},
			{
				'<leader>fp',
				function()
					Snacks.picker.projects()
				end,
				desc = '[f]ind [p]rojects',
			},
			{
				'<leader>fo',
				function()
					Snacks.picker.recent()
				end,
				desc = '[f]ind [o]ld files',
			},
			{
				'<leader>fg',
				function()
					Snacks.picker.grep()
				end,
				desc = '[f]ind by [g]rep',
			},
			{
				'<leader>fw',
				function()
					Snacks.picker.grep_word()
				end,
				desc = '[f]ind current [w]ord',
				mode = { 'n', 'x' },
			},
			{
				'<leader>fn',
				function()
					Snacks.picker.notifications()
				end,
				desc = '[f]ind [n]otifications',
			},
			{
				'<leader>fd',
				function()
					Snacks.picker.diagnostics()
				end,
				desc = '[f]ind [d]iagnostics',
			},
			{
				'<leader>fh',
				function()
					Snacks.picker.help()
				end,
				desc = '[f]ind [h]elp',
			},
			{
				'<leader>fi',
				function()
					Snacks.picker.icons()
				end,
				desc = '[f]ind [i]cons',
			},
			{
				'<leader>fk',
				function()
					Snacks.picker.keymaps()
				end,
				desc = '[f]ind [k]eymaps',
			},
			{
				'<leader>fq',
				function()
					Snacks.picker.qflist()
				end,
				desc = '[f]ind [q]uickfix',
			},
			{
				'<leader>fu',
				function()
					Snacks.picker.undo()
				end,
				desc = '[f]ind [u]ndo tree',
			},
			-- Buffer
			{
				'<leader>fbf',
				function()
					Snacks.picker.buffers()
				end,
				desc = '[f]ind open [b]uffer [f]iles',
			},
			{
				'<leader>f/',
				function()
					Snacks.picker.lines()
				end,
				desc = '[f]ind in buffer [/]',
			},
			{
				'<leader>fbg',
				function()
					Snacks.picker.grep_buffers()
				end,
				desc = '[f]ind in open [b]uffers by [g]rep',
			},
			{
				'<leader>fbd',
				function()
					Snacks.picker.diagnostics_buffer()
				end,
				desc = '[f]ind open [b]uffer [d]iagnostics',
			},
			-- LSP
			{
				'gd',
				function()
					Snacks.picker.lsp_definitions()
				end,
				desc = '[g]oto [d]efinition',
			},
			{
				'gD',
				function()
					Snacks.picker.lsp_declarations()
				end,
				desc = '[g]oto [d]eclaration',
			},
			{
				'gr',
				function()
					Snacks.picker.lsp_references()
				end,
				nowait = true,
				desc = '[g]oto [r]eferences',
			},
			{
				'gI',
				function()
					Snacks.picker.lsp_implementations()
				end,
				desc = '[g]oto [I]mplementation',
			},
			{
				'gy',
				function()
					Snacks.picker.lsp_type_definitions()
				end,
				desc = '[g]oto t[y]pe definition',
			},

			-- [[ Notifier ]]
			{
				'<leader>nh',
				function()
					Snacks.notifier.hide()
				end,
				desc = '[n]otifier [h]ide',
			},
			{
				'<leader>nl',
				function()
					Snacks.notifier.show_history()
				end,
				desc = '[n]otifier [l]ist',
			},

			-- [[ Lazygit ]]
			{
				'<leader>gl',
				function()
					Snacks.lazygit()
				end,
				desc = '[l]azy git',
			},

			-- [[ GitHub ]]
			{
				'<leader>gi',
				function()
					Snacks.picker.gh_issue()
				end,
				desc = '[g]ithub [i]ssues',
			},
			{
				'<leader>gI',
				function()
					Snacks.picker.gh_issue { state = 'all' }
				end,
				desc = '[g]ithub [i]ssues (all)',
			},

			-- [[ Image ]]
			{
				'<leader>oi',
				function()
					Snacks.image.hover()
				end,
				desc = '[o]pen [i]mage',
			},
		},
	},
}
