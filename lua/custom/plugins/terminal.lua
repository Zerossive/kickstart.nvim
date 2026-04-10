return {
	'akinsho/toggleterm.nvim',
	version = '*',
	opts = {
		open_mapping = [[<c-\>]],
		direction = 'float',
		float_opts = { border = 'curved' },
	},
	keys = {
		{ '<m-\\>', '<cmd>vsplit | vertical resize 60 | terminal<cr>' },
	},
}
