return {
	{
		'catppuccin/nvim',
		name = 'catppuccin',
		priority = 1000, -- make sure to load this before all the other start plugins
		init = function()
			vim.cmd.colorscheme 'catppuccin-nvim'

			-- You can configure highlights by doing something like
			-- vim.cmd.hi 'Comment gui=none'
			-- local mocha = require('catppuccin.palettes').get_palette 'mocha'
			vim.o.pumblend = 0
			vim.o.winblend = 0
		end,
		opts = {
			flavour = 'mocha',
			transparent_background = true,
			integrations = {
				which_key = true,
				mason = true,
				notify = true,
				noice = true,
				fidget = true,
				nvim_surround = true,
				snacks = { enabled = true },
			},
			custom_highlights = function(colors)
				return {
					-- HI_GROUP = { fg = "COLOR", bg = "COLOR", style = { "STYLE" } },
					CmpBorder = { fg = colors.surface2 },
					Pmenu = { bg = colors.none },
					['@markup.italic'] = { fg = colors.mauve, style = { 'italic' } },
				}
			end,
		},
	},
	{
		'folke/which-key.nvim',
		event = 'VeryLazy',
		opts = {
			-- delay = 0,
			icons = {
				-- set icon mappings to true if you have a Nerd Font
				mappings = vim.g.have_nerd_font,
				-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
				-- default which-key.nvim defined Nerd Font icons, otherwise define a string table
				keys = vim.g.have_nerd_font and {} or {
					Up = '<Up> ',
					Down = '<Down> ',
					Left = '<Left> ',
					Right = '<Right> ',
					C = '<C-…> ',
					M = '<M-…> ',
					D = '<D-…> ',
					S = '<S-…> ',
					CR = '<CR> ',
					Esc = '<Esc> ',
					ScrollWheelDown = '<ScrollWheelDown> ',
					ScrollWheelUp = '<ScrollWheelUp> ',
					NL = '<NL> ',
					BS = '<BS> ',
					Space = '<Space> ',
					Tab = '<Tab> ',
					F1 = '<F1>',
					F2 = '<F2>',
					F3 = '<F3>',
					F4 = '<F4>',
					F5 = '<F5>',
					F6 = '<F6>',
					F7 = '<F7>',
					F8 = '<F8>',
					F9 = '<F9>',
					F10 = '<F10>',
					F11 = '<F11>',
					F12 = '<F12>',
				},
			},

			-- Document existing key chains
			spec = {
				-- normal mode
				{ '<leader><leader>', group = 'filetype specific commands', icon = { icon = '󰵆' } },
				{ '<leader>b', group = 'buffer', icon = { icon = '' } },
				{ '<leader>g', group = 'git', icon = { icon = '󰊢' } },
				{ '<leader>n', group = 'notifications', icon = { icon = '󰍡' } },
				{ '<leader>o', group = 'open', icon = { icon = '' } },
				{ '<leader>s', group = 'search', icon = { icon = '' } },
				{ '<leader>t', group = 'toggle', icon = { icon = '' } },
				{ '<leader>a', group = 'ai', icon = { icon = '󰧑' } },
				{ '<leader>f', group = 'find', icon = { icon = '󰈞' } },
				{ '<leader>p', group = 'plugin', icon = { icon = '󱐥' } },
				-- visual mode
				{ '<leader>c', group = 'code', mode = { 'v', 'n', 'x' }, icon = { icon = '' } },
				{ '<leader>h', group = 'hunk', mode = { 'v', 'n' }, icon = { icon = '' } },
				-- change icons for other commands
				{ '<leader>w', icon = { icon = '󰆓', color = 'green' } },
				{ '<leader>W', icon = { icon = '', color = 'green' } },
				{ '<leader>q', icon = { icon = '󰅗', color = 'red' } },
				{ '<leader>Q', icon = { icon = '', color = 'red' } },
				{ '<leader>x', group = 'toggle checkbox', icon = { icon = '󰄲' } },
			},
		},
	},
	{
		'folke/todo-comments.nvim',
		event = 'VimEnter',
		dependencies = { 'nvim-lua/plenary.nvim' },
		opts = {
			keywords = {
				H1 = {
					icon = '󰉫',
					color = '#74c7ec',
					alt = { 'h1', 'TITLE', 'title' },
				},
				H2 = {
					icon = '󰉬',
					color = '#CBA6F7',
					alt = { 'h2', 'SUBTITLE', 'subtitle' },
				},
				H3 = {
					icon = '󰉭',
					color = '#F38BA8',
					alt = { 'h3' },
				},
				H4 = {
					icon = '󰉮',
					color = '#A6E3A1',
					alt = { 'h4' },
				},
			},
			-- highlight = {
			-- 	comments_only = false,
			-- },
		},
	},
	{
		'catgoose/nvim-colorizer.lua',
		event = 'BufReadPre',
		opts = {
			filetypes = {
				'*',
				markdown = { names = false },
			},
			options = {
				parsers = {
					tailwind = {
						enable = true,
						lsp = true,
					},
					css = true,
				},
			},
		},
		config = function(_, opts)
			require('colorizer').setup(opts)

			vim.keymap.set('n', '<LEADER>tc', '<CMD>ColorizerToggle<CR>', { desc = 'toggle colorizer highlight' })
		end,
	},
	{
		'kevinhwang91/nvim-ufo',
		dependencies = { 'kevinhwang91/promise-async' },
		config = function()
			vim.opt.foldcolumn = '0'
			vim.opt.foldlevel = 99
			vim.opt.foldlevelstart = 99
			vim.opt.foldenable = true

			vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
			vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

			-- Option 3: treesitter as a main provider instead
			require('ufo').setup {
				---@diagnostic disable-next-line: unused-local
				provider_selector = function(bufnr, filetype, buftype)
					-- return { 'lsp', 'indent' }
					return { 'treesitter', 'indent' }
				end,
			}
		end,
	},
	{
		'MeanderingProgrammer/render-markdown.nvim',
		ft = 'markdown',
		opts = {
			render_modes = { 'n', 'i', 'c' },
			-- anti_conceal = { enabled = false },
			preset = 'obsidian',
			pipe_table = {
				preset = 'round',
			},
			heading = { left_pad = 1 },
		},
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
		-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
	},
}
