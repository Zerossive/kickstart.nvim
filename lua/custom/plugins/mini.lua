return { -- Collection of various small independent plugins/modules
	'echasnovski/mini.nvim',
	config = function()
		-- [[ Mini AI ]]
		require('mini.ai').setup { n_lines = 500 }

		-- [[ Mini Surround ]]
		require('mini.surround').setup()

		-- [[ Mini Statusline ]]
		local statusline = require 'mini.statusline'
		-- set use_icons to true if you have a Nerd Font
		statusline.setup {
			use_icons = vim.g.have_nerd_font,
			content = {
				-- active = function() -- DEFAULT ACTIVE CONTENT
				-- 	local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
				-- 	local git = MiniStatusline.section_git { trunc_width = 75 }
				-- 	local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
				-- 	local filename = MiniStatusline.section_filename { trunc_width = 140 }
				-- 	local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
				-- 	local location = MiniStatusline.section_location { trunc_width = 75 }
				-- 	local search = MiniStatusline.section_searchcount { trunc_width = 75 }
				--
				-- 	return MiniStatusline.combine_groups {
				-- 		{ hl = mode_hl, strings = { mode } },
				-- 		{ hl = 'MiniStatuslineDevinfo', strings = { git, diagnostics } },
				-- 		'%<', -- Mark general truncate point
				-- 		{ hl = 'MiniStatuslineFilename', strings = { filename } },
				-- 		'%=', -- End left alignment
				-- 		{ hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
				-- 		{ hl = mode_hl, strings = { search, location } },
				-- 	}
				-- end,
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
		basics.setup { mappings = { windows = true, move_with_alt = true } }

		-- [[ Mini Indentscope ]]
		require('mini.indentscope').setup()

		-- [[ Mini File Explorer ]]
		local files = require 'mini.files'
		files.setup {}
		vim.keymap.set('n', '-', files.open, { desc = 'Mini File Explorer' })

		-- Opening in Splits
		local map_split = function(buf_id, lhs, direction)
			local rhs = function()
				-- Make new window and set it as target
				local new_target_window
				vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
					vim.cmd(direction .. ' split')
					new_target_window = vim.api.nvim_get_current_win()
				end)

				MiniFiles.set_target_window(new_target_window)
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
		local files_set_cwd = function(path)
			-- Works only if cursor is on the valid file system entry
			local cur_entry_path = MiniFiles.get_fs_entry().path
			local cur_directory = vim.fs.dirname(cur_entry_path)
			vim.fn.chdir(cur_directory)
		end

		vim.api.nvim_create_autocmd('User', {
			pattern = 'MiniFilesBufferCreate',
			callback = function(args)
				vim.keymap.set('n', 'g~', files_set_cwd, { buffer = args.data.buf_id })
			end,
		})
	end,
}
