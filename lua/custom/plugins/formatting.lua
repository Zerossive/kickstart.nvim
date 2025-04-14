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
				['*'] = { 'codespell' }, -- for all filetypes
				['_'] = { 'trim_whitespace' }, -- for filetypes not listed
			},
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				local lsp_format_opt
				if disable_filetypes[vim.bo[bufnr].filetype] then
					lsp_format_opt = 'never'
				else
					lsp_format_opt = 'fallback'
				end
				return {
					timeout_ms = 500,
					lsp_format = lsp_format_opt,
				}
			end,
			formatters = {
				prettierd = {
					prepend_args = { '--tab-width=4', '--use-tabs', '--no-semi', '--single-quote', '--jsx-single-quote' },
				},
				prettier = {
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
					require('conform').format { async = true, lsp_format = 'fallback' }
				end,
				mode = '',
				desc = '[C]ode [F]ormat',
			},
		},
	},
	{
		'numToStr/Comment.nvim',
		opts = {},
		lazy = false,
	},
	-- { 'tpope/vim-sleuth' }, -- Detect tabstop and shiftwidth automatically
	{ 'nmac427/guess-indent.nvim', opts = {} }, -- Detect tabstop and shiftwidth automatically
	-- { -- Autopairs
	-- 	'windwp/nvim-autopairs',
	-- 	event = 'InsertEnter',
	-- 	-- Optional dependency
	-- 	dependencies = { 'hrsh7th/nvim-cmp' },
	-- 	config = function()
	-- 		require('nvim-autopairs').setup {}
	-- 		-- If you want to automatically add `(` after selecting a function or method
	-- 		local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
	-- 		local cmp = require 'cmp'
	-- 		cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
	-- 	end,
	-- },
	-- { -- Add indentation guides even on blank lines
	-- 	'lukas-reineke/indent-blankline.nvim',
	-- 	-- Enable `lukas-reineke/indent-blankline.nvim`
	-- 	-- See `:help ibl`
	-- 	main = 'ibl',
	-- 	opts = {},
	-- },
	{
		'bullets-vim/bullets.vim',
		ft = 'markdown',
		config = function()
			vim.g.bullets_checkbox_markers = '                   x'
		end,
	},
	{
		'laytan/tailwind-sorter.nvim',
		dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
		build = 'cd formatter && npm ci && npm run build',
		opts = {
			on_save_enabled = true,
		},
	},
}
