--[[
=====================================================================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================
]]

-- Custom commands
require 'custom.commands.custom_commands'

-- Disable netrw
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

-- Set <space> as the leader key
-- See `:help mapleader`
-- Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.schedule(function()
	vim.opt.clipboard = 'unnamedplus'
end)

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true -- handled by mini.basics
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- handled by mini.basics but changed abit

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

-- NOTE: Custom Options
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.sessionoptions = 'blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions'
vim.opt.conceallevel = 1
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.spelllang = 'en_us'

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>cq', vim.diagnostic.setloclist, { desc = 'open diagnostic [q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- NOTE: Custom Keymaps
--
-- Normal mode
vim.keymap.set('n', '<C-u>', '<C-u>zz', { desc = 'move up 1/2 page and center' })
vim.keymap.set('n', '<C-d>', '<C-d>zz', { desc = 'move down 1/2 page and center' })
vim.keymap.set('n', '<leader>on', ':cd ~/.config/nvim | SessionRestore<CR>', { desc = '[o]pen [n]eovim config' })
vim.keymap.set('n', '<leader>oo', ':cd ~/Elysium/Obsidian\\ Vault/ | SessionRestore<CR>', { desc = '[o]pen [o]bsidian vault' })
vim.keymap.set('n', '<leader>oq', ':e ~/Elysium/Obsidian\\ Vault/Quick\\ Note.md<CR>', { desc = '[o]pen [q]uick note' })
vim.keymap.set('n', '<leader>om', ':cd /mnt/autofs/OLYMPUS/ | SessionRestore<CR>', { desc = '[o]pen [m]ounted OLYMPUS' })
vim.keymap.set('n', '<leader>w', ':w<CR>', { desc = '[w]rite file' })
vim.keymap.set('n', '<leader>a', ':qa<CR>', { desc = 'quit [a]ll' })
vim.keymap.set('n', '<leader>q', ':q<CR>', { desc = '[q]uit file' })
vim.keymap.set('n', '<leader>o.', ':cd %:p:h<CR>', { desc = '[o]pen [.] as root directory' })
vim.keymap.set('n', '<leader>od', ':!dolphin . &<CR>', { desc = '[o]pen [d]irectory' })
vim.keymap.set('n', '<leader>ol', ':!dolphin ~/.local/share/nvim/sessions &<CR>', { desc = '[o]pen [l]ocal session storage' })
vim.keymap.set('n', '<leader>cc', function()
	local cursor_position = vim.api.nvim_win_get_cursor(0)
	vim.cmd 'normal GVggy'
	vim.api.nvim_win_set_cursor(0, cursor_position)
end, { desc = '[c]opy all [c]ode' })
vim.keymap.set('n', '<leader>bo', ':BufOnly<CR>', { desc = 'close [o]ther buffers' })
vim.keymap.set('n', '<C-8>', 'viW*Ncgn', { desc = 'replace current word' })

-- Insert mode
vim.keymap.set('i', 'jj', '<Escape>', { desc = 'normal mode' })
vim.keymap.set('i', '<C-e>', '<ESC>A', { desc = 'go to end of line' })
vim.keymap.set('i', '<C-8>', 'viW*Ncgn', { desc = 'replace current word' })

-- Visual mode
vim.keymap.set('v', '<C-r>', ':RC ', { desc = '[r]un command on selected text' })

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
	local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
	if vim.v.shell_error ~= 0 then
		error('Error cloning lazy.nvim:\n' .. out)
	end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
require('lazy').setup({
	-- For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
	{ import = 'custom.plugins' },
}, {
	ui = {
		-- If you have a Nerd Font, set icons to an empty table which will use the
		-- default lazy.nvim defined Nerd Font icons otherwise define a unicode icons table
		icons = vim.g.have_nerd_font and {} or {
			cmd = '⌘',
			config = '🛠',
			event = '📅',
			ft = '📂',
			init = '⚙',
			keys = '🗝',
			plugin = '🔌',
			runtime = '💻',
			require = '🌙',
			source = '📄',
			start = '🚀',
			task = '📌',
			lazy = '💤 ',
		},
	},
})
