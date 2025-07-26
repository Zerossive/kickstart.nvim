return {
	{
		'folke/snacks.nvim',
		priority = 1000,
		lazy = false,
		---@type snacks.Config
		opts = {
			notifier = { enabled = true },
			terminal = { enabled = true },
			image = { enable = true, doc = { float = false } },
			picker = { enable = true },
		},
		keys = {
			--  [[ Pickers ]]
			-- Top Pickers & Explorer
			{
				'<leader>fs',
				function()
					Snacks.picker.smart()
				end,
				desc = '[f]ind files [s]mart',
			},
			{
				'<leader>fe',
				function()
					Snacks.explorer()
				end,
				desc = '[f]ile [e]xplorer',
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
				'<leader>fbf',
				function()
					Snacks.picker.buffers()
				end,
				desc = '[f]ind open [b]uffer [f]iles',
			},
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
			-- Grep
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
			-- search
			{
				'<leader>fd',
				function()
					Snacks.picker.diagnostics()
				end,
				desc = '[f]ind [d]iagnostics',
			},
			{
				'<leader>fbd',
				function()
					Snacks.picker.diagnostics_buffer()
				end,
				desc = '[f]ind open [b]uffer [d]iagnostics',
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
				'<leader>fr',
				function()
					Snacks.picker.resume()
				end,
				desc = '[f]ind [r]esume',
			},
			{
				'<leader>fu',
				function()
					Snacks.picker.undo()
				end,
				desc = '[f]ind [u]ndo tree',
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

			--  [[ Terminal ]]
			{
				'<A-\\>',
				function()
					Snacks.terminal.toggle()
				end,
				mode = { 'n', 'i', 't' },
				desc = 'snacks terminal',
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
			{
				'<leader>nf',
				function()
					Snacks.picker.notifications()
				end,
				desc = '[n]otifier [f]ind',
			},
			{
				'<leader>fn',
				function()
					Snacks.picker.notifications()
				end,
				desc = '[f]ind [n]otifications',
			},

			-- [[ Lazygit ]]
			{
				'<leader>gg',
				function()
					Snacks.lazygit()
				end,
				desc = 'lazy [g]it',
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
