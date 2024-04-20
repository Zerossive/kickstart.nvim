return {
	{
		'catppuccin/nvim',
		priority = 1000, -- make sure to load this before all the other start plugins
		init = function()
			vim.cmd.colorscheme 'catppuccin'

			-- You can configure highlights by doing something like
			vim.cmd.hi 'Comment gui=none'
		end,
	},
	{
		'folke/which-key.nvim',
		event = 'VimEnter', -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require('which-key').setup()

			-- Document existing key chains
			require('which-key').register {
				['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
				['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
				['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
				['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
				['<leader>n'] = { name = '[N]otifications', _ = 'which_key_ignore' },
				['<leader>o'] = { name = '[O]pen', _ = 'which_key_ignore' },
				['<leader>h'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
				['<leader>t'] = { name = '[T]oggle', _ = 'which_key_ignore' },
			}
		end,
	},
	{ 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
	{
		'folke/noice.nvim',
		event = 'VeryLazy',
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			'MunifTanjim/nui.nvim',
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			'rcarriga/nvim-notify',
		},
		config = function()
			local noice = require 'noice'
			noice.setup {
				routes = {
					{
						view = 'notify',
						filter = { event = 'msg_showmode' },
					},
				},
			}
			require('telescope').load_extension 'noice'

			vim.keymap.set('n', '<leader>nc', '<cmd>Noice dismiss<CR>', { desc = '[C]lear Messages' })
			vim.keymap.set('n', '<leader>ns', '<cmd>Noice telescope<CR>', { desc = '[S]earch Messages' })
			vim.keymap.set('n', '<leader>nl', '<cmd>Noice last<CR>', { desc = '[L]ast Message' })
			vim.keymap.set('n', '<leader>ne', '<cmd>Noice enable<CR>', { desc = '[E]nable Noice' })
			vim.keymap.set('n', '<leader>nd', '<cmd>Noice disable<CR>', { desc = '[D]isable Noice' })
		end,
	},
	{ 'szw/vim-maximizer' },
	{
		'NvChad/nvim-colorizer.lua',
		opts = {
			user_default_options = {
				tailwind = true,
			},
		},
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

			require('ufo').setup {
				provider_selector = function(bufnr, filetype, buftype)
					return { 'lsp', 'indent' }
				end,
			}
		end,
	},
	-- { 'mhinz/vim-startify' },
}
