return {
	{
		'stevearc/conform.nvim',
		lazy = false,
		event = { 'BufReadPre', 'BufNewFile' },
		opts = {
			formatters_by_ft = {
				-- web languages
				javascript = { 'prettierd' },
				typescript = { 'prettierd' },
				javascriptreact = { 'prettierd' },
				typescriptreact = { 'prettierd' },
				svelte = { 'prettierd' },
				css = { 'prettierd' },
				html = { 'prettierd' },
				json = { 'prettierd' },
				yaml = { 'prettierd' },
				markdown = {},
				graphql = { 'prettierd' },
				-- other languages
				lua = { 'stylua' },
				sh = { 'shfmt' },
				['*'] = { 'codespell' }, -- for all filetypes
				['_'] = { 'trim_whitespace' }, -- for filetypes not listed
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
			formatters = {
				prettierd = {
					prepend_args = { '--tab-width=4', '--use-tabs', '--no-semi', '--single-quote', '--jsx-single-quote' },
				},
				stylua = {
					prepend_args = { '--indent-type=Tabs', '--indent-width=4' },
				},
			},
		},
		keys = {
			{
				'<leader>cf',
				function()
					require('conform').format { async = true, lsp_fallback = true }
				end,
				mode = '',
				desc = '[C]ode [F]ormat',
			},
		},
	},
	{ 'tpope/vim-commentary' },
	-- { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically
	{ 'JoosepAlviste/nvim-ts-context-commentstring' },
	{ -- Autopairs
		'windwp/nvim-autopairs',
		event = 'InsertEnter',
		-- Optional dependency
		dependencies = { 'hrsh7th/nvim-cmp' },
		config = function()
			require('nvim-autopairs').setup {}
			-- If you want to automatically add `(` after selecting a function or method
			local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
			local cmp = require 'cmp'
			cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
		end,
	},
	{ -- Add indentation guides even on blank lines
		'lukas-reineke/indent-blankline.nvim',
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = 'ibl',
		opts = {},
	},
	{ -- Automatically close brackets and parens
		'windwp/nvim-ts-autotag',
		version = '*',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		opts = {},
	},
}
