-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Other Configs
--  Move help to the right
vim.api.nvim_create_autocmd('BufWinEnter', {
	callback = function(args)
		if vim.bo[args.buf].filetype == 'help' then
			vim.cmd.wincmd 'L'
		end
	end,
})
