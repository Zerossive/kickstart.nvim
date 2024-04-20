return {
	{ -- Autocompletion
		'hrsh7th/nvim-cmp',
		event = 'InsertEnter',
		dependencies = {
			{ -- Snippet Engine & its associated nvim-cmp source
				'L3MON4D3/LuaSnip',
				build = (function()
					-- Build Step is needed for regex support in snippets
					-- This step is not supported in many windows environments
					-- Remove the below condition to re-enable on windows
					if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
						return
					end
					return 'make install_jsregexp'
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					{
						'rafamadriz/friendly-snippets',
						config = function()
							require('luasnip.loaders.from_vscode').lazy_load()
							require('luasnip.loaders.from_vscode').load {
								paths = { './snippets' },
							}
						end,
					},
				},
				config = function()
					require('luasnip.loaders.from_lua').load {
						paths = { './snippets' },
					}
				end,
			},
			'saadparwaiz1/cmp_luasnip',

			-- Adds other completion capabilities.
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
		},
		config = function()
			-- See `:help cmp`
			local cmp = require 'cmp'
			local luasnip = require 'luasnip'
			luasnip.config.setup {}

			cmp.setup {
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = 'menu,menuone,noinsert' },
				mapping = cmp.mapping.preset.insert {
					-- Select the [n]ext item
					['<C-n>'] = cmp.mapping.select_next_item(),
					-- Select the [p]revious item
					['<C-p>'] = cmp.mapping.select_prev_item(),

					-- scroll the documentation window [b]ack / [f]orward
					['<C-b>'] = cmp.mapping.scroll_docs(-4),
					['<C-f>'] = cmp.mapping.scroll_docs(4),

					-- Accept ([y]es) the completion.
					['<C-y>'] = cmp.mapping.confirm { select = true },

					-- Manually trigger a completion from nvim-cmp.
					-- ['<C-a>'] = cmp.mapping.complete {},

					-- Think of <c-l> as moving to the right of your snippet expansion.
					['<C-l>'] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
							luasnip.expand_or_jump()
						end
					end, { 'i', 's' }),
					['<C-h>'] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { 'i', 's' }),
				},
				sources = {
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = 'path' },
				},
			}
		end,
	},
}
