return { -- Collection of various small independent plugins/modules
	'echasnovski/mini.nvim',
	config = function()
		-- [[ Mini AI ]]
		require('mini.ai').setup {
			-- Avoid conflicts with the built-in incremental selection mappings on Neovim>=0.12 (see `:help treesitter-incremental-selection`)
			mappings = {
				around_next = 'aa',
				inside_next = 'ii',
			},
			n_lines = 500,
		}

		-- [[ Mini Statusline ]]
		local statusline = require 'mini.statusline'
		-- set use_icons to true if you have a Nerd Font
		statusline.setup {
			use_icons = vim.g.have_nerd_font,
			content = {
				active = function() -- DEFAULT ACTIVE CONTENT
					local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
					local git = MiniStatusline.section_git { trunc_width = 75 }
					local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
					local filename = MiniStatusline.section_filename { trunc_width = 140 }
					local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
					local location = MiniStatusline.section_location { trunc_width = 75 }
					local search = MiniStatusline.section_searchcount { trunc_width = 75 }
					local wordcount = vim.fn.wordcount().words

					return MiniStatusline.combine_groups {
						{ hl = mode_hl, strings = { mode } },
						{ hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
						'%<', -- Mark general truncate point
						{ hl = 'MiniStatuslineFilename', strings = { filename } },

						'%=', -- End left alignment

						{ hl = 'MiniStatuslineFileinfo', strings = { fileinfo, wordcount == 0 and '' or wordcount .. ' words' } }, -- added wordcount
						{ hl = mode_hl, strings = { search, location } },
					}
				end,
				inactive = function()
					-- return '%#MiniStatuslineInactive#%F%=' -- DEFAULT INACTIVE CONTENT
					return '%#MiniStatuslineInactive#%F%m%r%h%w' -- added modified, readonly, help and preview flags
				end,
			},
		}

		-- You can configure sections in the statusline by overriding their
		-- default behavior. For example, here we set the section for
		-- cursor location to LINE:COLUMN
		---@diagnostic disable-next-line: duplicate-set-field
		statusline.section_location = function()
			return '%2l:%-2v'
		end

		-- [[ Mini Basics ]]
		local basics = require 'mini.basics'
		basics.setup { options = { extra_ui = true }, mappings = { windows = true, move_with_alt = true, option_toggle_prefix = [[<leader>t]] } }

		-- [[ Mini Indentscope ]]
		require('mini.indentscope').setup()

		-- [[ Mini Starter ]]
		local starter = require 'mini.starter'
		local art = '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⠀⠀⠀⣀⣤⣤⣤⣄⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀\n'
			.. '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣷⣄⡞⠁⠀⠀⠀⠈⠉⠛⠻⢶⣄⡀⠀⠀⠀⠀⠀⠀⠀\n'
			.. '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣶⡖⠀⠀⠀⠀⠀⠀⠀⠈⠻⢶⣄⠀⠀⠀⠀⠀\n'
			.. '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⣷⡀⠀⠀⠀\n'
			.. '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣆⠀⠀\n'
			.. '⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⡆⠀\n'
			.. '⠀⠀⠀⠀⢀⣠⣴⣶⣾⣿⣿⣿⣿⣿⣶⣶⣤⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⠀\n'
			.. '⠀⠀⣠⣾⣿⡿⠟⠋⠉⠁⠀⠀⠀⠉⠉⠙⠻⠿⣿⣷⣦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀\n'
			.. '⢀⣾⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣿⣶⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡿⠀\n'
			.. '⣸⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠻⣿⣷⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠃⠀\n'
			.. '⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⡿⠃⠀⠀\n'
			.. '⢹⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠿⣿⣶⣦⣤⣤⣤⣤⣤⣤⣶⡾⠟⠋⠀⠀⠀⠀\n'
			.. '⠀⢿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠛⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀'
		starter.setup {
			evaluate_single = true,
			header = art,
			footer = '',
			silent = true,
			items = {
				-- Neovim
				{ name = 'Edit', action = 'enew', section = 'Neovim' },
				{ name = 'Insert', action = 'enew | startinsert', section = 'Neovim' },
				{ name = 'Quit', action = 'qall', section = 'Neovim' },
				-- Custom
				{ name = 'Recent Session', action = 'RecentSession', section = 'Custom' },
				{ name = 'Projects', action = 'AutoSession search', section = 'Custom' },
				{ name = 'Obsidian Vault', action = 'cd ~/Elysium/Obsidian\\ Vault/ | AutoSession restore', section = 'Custom' },
				{ name = 'Neovim Config', action = 'cd ~/.config/nvim | AutoSession restore', section = 'Custom' },
				-- Recent Files
				starter.sections.recent_files(5, false, false),
			},
			content_hooks = {
				starter.gen_hook.adding_bullet(),
				starter.gen_hook.indexing('all', { 'Builtin actions', 'Neovim', 'Custom' }),
				starter.gen_hook.aligning('center', 'center'),
			},
		}

		-- [[ Mini Move ]]
		-- select and move text with alt + hjkl
		require('mini.move').setup()

		-- [[ Mini Splitjoin ]]
		-- join and split blocks with gS
		require('mini.splitjoin').setup()

		-- [[ Mini Cursorword ]]
		-- underline matching words of cursor
		require('mini.cursorword').setup { delay = 250 }

		-- [[ Mini Bracketed ]]
		-- go forwards/backward with square brackets
		require('mini.bracketed').setup()

		-- [[ Mini Icons ]]
		-- Icon provider
		require('mini.icons').setup()
		MiniIcons.mock_nvim_web_devicons()
	end,
}
