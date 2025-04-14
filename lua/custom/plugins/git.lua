return {
	{
		'lewis6991/gitsigns.nvim',
		opts = {
			on_attach = function(bufnr)
				local gitsigns = require 'gitsigns'

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map('n', ']c', function()
					if vim.wo.diff then
						vim.cmd.normal { ']c', bang = true }
					else
						gitsigns.next_hunk()
					end
				end, { desc = 'Jump to next git [c]hange' })

				map('n', '[c', function()
					if vim.wo.diff then
						vim.cmd.normal { '[c', bang = true }
					else
						gitsigns.prev_hunk()
					end
				end, { desc = 'Jump to previous git [c]hange' })

				-- Actions
				-- visual mode
				map('v', '<leader>hs', function()
					gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
				end, { desc = 'stage git hunk' })
				map('v', '<leader>hr', function()
					gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
				end, { desc = 'reset git hunk' })
				-- normal mode
				map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'git [s]tage hunk' })
				map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'git [r]eset hunk' })
				map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'git [S]tage buffer' })
				-- map('n', '<leader>hu', gitsigns.stage_hunk, { desc = 'git [u]ndo stage hunk' })
				map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'git [R]eset buffer' })
				map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'git [p]review hunk' })
				map('n', '<leader>hb', gitsigns.blame_line, { desc = 'git [b]lame line' })
				map('n', '<leader>hd', gitsigns.diffthis, { desc = 'git [d]iff against index' })
				map('n', '<leader>hD', function()
					gitsigns.diffthis '@'
				end, { desc = 'git [D]iff against last commit' })
				-- Toggles
				map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[t]oggle git show [b]lame line' })
				map('n', '<leader>td', gitsigns.preview_hunk_inline, { desc = '[t]oggle git show [d]eleted' })
			end,
		},
	},
	{
		'tpope/vim-fugitive',
		config = function()
			vim.keymap.set('n', '<leader>gf', ':Git<CR>', { desc = '[g]it [f]ugitive' })
			vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', { desc = '[g]it [c]ommit' })
			vim.keymap.set('n', '<leader>gd', ':Git difftool<CR>', { desc = '[g]it [d]ifftool' })
			vim.keymap.set('n', '<leader>gm', ':Git mergetool<CR>', { desc = '[g]it [m]ergetool' })
			vim.keymap.set(
				'n',
				'<leader>gl',
				':Git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit<CR>',
				{ desc = '[g]it [l]og' }
			)
		end,
	},
}
