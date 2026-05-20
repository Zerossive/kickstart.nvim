return {
	{
		'stevearc/conform.nvim',
		event = { 'BufReadPre', 'BufNewFile', 'BufWritePre' },
		cmd = { 'ConformInfo' },
		opts = {
			formatters_by_ft = {
				-- web languages
				javascript = { 'prettierd', 'prettier', stop_after_first = true },
				typescript = { 'prettierd', 'prettier', stop_after_first = true },
				javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
				typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
				svelte = { 'prettierd', 'prettier', stop_after_first = true },
				css = { 'prettierd', 'prettier', stop_after_first = true },
				html = { 'prettierd', 'prettier', stop_after_first = true },
				json = { 'prettierd', 'prettier', stop_after_first = true },
				yaml = { 'prettierd', 'prettier', stop_after_first = true },
				markdown = {},
				graphql = { 'prettierd', 'prettier', stop_after_first = true },
				-- other languages
				lua = { 'stylua' },
				sh = { 'shfmt' },
				-- rust = { 'rustfmt' },
				rust = { 'custom_rustfmt' }, -- use pre-installed rustfmt with rustup
				-- ['*'] = { 'codespell' }, -- for all filetypes
				['_'] = { 'trim_whitespace' }, -- for filetypes not listed
			},
			notify_on_error = true,
			notify_no_formatters = true,
			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				lsp_format = 'fallback',
			},
			formatters = {
				prettierd = {
					prepend_args = {
						'--tab-width=4',
						'--use-tabs',
						'--no-semi',
						'--single-quote',
						'--jsx-single-quote',
						'--trailing-comma=all',
						'--html-whitespace-sensitivity=ignore',
					},
				},
				prettier = {
					prepend_args = {
						'--tab-width=4',
						'--use-tabs',
						'--no-semi',
						'--single-quote',
						'--jsx-single-quote',
						'--trailing-comma=all',
						'--html-whitespace-sensitivity=ignore',
					},
				},
				stylua = {
					prepend_args = { '--indent-type=Tabs', '--indent-width=4' },
				},
				custom_rustfmt = {
					command = 'rustfmt',
				},
			},
		},
		keys = {
			{
				'<leader>cf',
				function()
					require('conform').format { async = true, lsp_format = 'fallback' }
				end,
				desc = 'code format',
			},
		},
	},
	{
		'numToStr/Comment.nvim',
		opts = {},
		lazy = false,
	},
	{ 'nmac427/guess-indent.nvim', opts = {} }, -- Detect tabstop and shiftwidth automatically
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
	{
		'bullets-vim/bullets.vim',
		ft = 'markdown',
		config = function()
			vim.g.bullets_checkbox_markers = '                   x'
		end,
	},
}
