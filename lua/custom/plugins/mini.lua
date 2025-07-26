return { -- Collection of various small independent plugins/modules
	'echasnovski/mini.nvim',
	config = function()
		-- [[ Mini AI ]]
		require('mini.ai').setup { n_lines = 500 }

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
		basics.setup { options = { extra_ui = true }, mappings = { windows = true, move_with_alt = true } }

		-- [[ Mini Indentscope ]]
		require('mini.indentscope').setup()

		-- [[ Mini File Explorer ]]
		local files = require 'mini.files'
		files.setup {
			options = {
				-- permanent_delete = false,
				use_as_default_explorer = false,
			},
			windows = {
				preview = true,
				width_preview = 50,
			},
		}
		vim.keymap.set('n', '-', files.open, { desc = 'mini file explorer' })

		-- Opening in Splits
		local map_split = function(buf_id, lhs, direction)
			local rhs = function()
				-- Make new window and set it as target
				local new_target_window
				---@diagnostic disable-next-line: param-type-mismatch -- added to hide warning from default code
				vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
					vim.cmd(direction .. ' split')
					new_target_window = vim.api.nvim_get_current_win()
				end)

				MiniFiles.set_target_window(new_target_window)

				MiniFiles.go_in { close_on_file = false } -- added to open the file after setting it as a target
			end

			-- Adding `desc` will result into `show_help` entries
			local desc = 'Split ' .. direction
			vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
		end
		vim.api.nvim_create_autocmd('User', {
			pattern = 'MiniFilesBufferCreate',
			callback = function(args)
				local buf_id = args.data.buf_id
				-- Tweak keys to your liking
				map_split(buf_id, 'gs', 'belowright horizontal')
				map_split(buf_id, 'gv', 'belowright vertical')
			end,
		})

		-- Set cwd to current file's directory
		local files_set_cwd = function()
			-- Works only if cursor is on the valid file system entry
			local cur_entry_path = MiniFiles.get_fs_entry().path
			local cur_directory = vim.fs.dirname(cur_entry_path)
			vim.fn.chdir(cur_directory)
		end
		vim.api.nvim_create_autocmd('User', {
			pattern = 'MiniFilesBufferCreate',
			callback = function(args)
				vim.keymap.set('n', '`', files_set_cwd, { buffer = args.data.buf_id, desc = 'cd to the current directory' })
			end,
		})

		-- Toggling dotfiles
		local show_dotfiles = true
		local filter_show = function(fs_entry)
			return true
		end
		local filter_hide = function(fs_entry)
			return not vim.startswith(fs_entry.name, '.')
		end
		local toggle_dotfiles = function()
			show_dotfiles = not show_dotfiles
			local new_filter = show_dotfiles and filter_show or filter_hide
			MiniFiles.refresh { content = { filter = new_filter } }
		end
		vim.api.nvim_create_autocmd('User', {
			pattern = 'MiniFilesBufferCreate',
			callback = function(args)
				local buf_id = args.data.buf_id
				-- Tweak left-hand side of mapping to your liking
				vim.keymap.set('n', 'g.', toggle_dotfiles, { buffer = buf_id })
			end,
		})

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
				{ name = 'Projects', action = ':Easypick Projects', section = 'Custom' },
				{ name = 'Obsidian Vault', action = 'cd ~/Elysium/Obsidian\\ Vault/ | SessionRestore', section = 'Custom' },
				{ name = 'Neovim Config', action = 'cd ~/.config/nvim | SessionRestore', section = 'Custom' },
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

		-- [[ Mini Splitjoin ]]
		-- Split and join arguments using gS
		require('mini.splitjoin').setup()

		-- [[ Mini Icons ]]
		-- Icon provider
		require('mini.icons').setup()
		MiniIcons.mock_nvim_web_devicons()

		-- [[ Mini Pairs ]]
		-- Auto-closing paired characters
		-- require('mini.pairs').setup()
	end,
}
