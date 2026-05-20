return {
	{ 'arborist-ts/arborist.nvim', opts = {} },
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
