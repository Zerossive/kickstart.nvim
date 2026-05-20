return {
	{ -- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		lazy = false,
		-- main = 'nvim-treesitter.configs', -- Sets main module to use for opts
		-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
		opts = {
			install = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'markdown_inline', 'query', 'regex' },
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = { enable = true },
		},
		-- There are additional nvim-treesitter modules that you can use to interact
		-- with nvim-treesitter. You should go explore a few and see what interests you:
		--
		--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
		--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
		--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
	},
	{ -- Automatically close brackets and parens
		'windwp/nvim-ts-autotag',
		-- opts = { enable_close = true, enable_rename = true, enable_close_on_slash = true }, -- disabled because of nonsense warning about v1.0?
		config = function()
			require('nvim-ts-autotag').setup {
				opts = { enable_close = true, enable_rename = true, enable_close_on_slash = true },
			}
		end,
	},
	{
		'JoosepAlviste/nvim-ts-context-commentstring',
		opts = {
			-- disable default autocmd for comment plugin integration
			enable_autocmd = false,
		},
		config = function()
			-- Integration with Comment.nvim
			require('Comment').setup {
				pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
			}
		end,
	},
}
