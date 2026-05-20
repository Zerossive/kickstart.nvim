return {
	{
		'epwalsh/obsidian.nvim',
		version = '*',
		lazy = true,
		ft = 'markdown',
		dependencies = {
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
	{ -- Add surround support
		'kylechui/nvim-surround',
		version = '*', -- Use for stability; omit to use `main` branch for the latest features
		event = 'VeryLazy',
		opts = {},
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
				desc = 'toggle/invert selection',
			},
		},
	},
	{
		'chomosuke/typst-preview.nvim',
		ft = 'typst',
		version = '1.*',
		opts = {}, -- lazy.nvim will implicitly calls `setup {}`
	},
	{
		'stevearc/quicker.nvim',
		ft = 'qf',
		---@module "quicker"
		---@type quicker.SetupOptions
		opts = {
			keys = {
				{
					'>',
					function()
						require('quicker').expand { before = 2, after = 2, add_to_existing = true }
					end,
					desc = 'Expand quickfix context',
				},
				{
					'<',
					function()
						require('quicker').collapse()
					end,
					desc = 'Collapse quickfix context',
				},
			},
		},
	},
}
