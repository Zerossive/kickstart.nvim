return {
	'akinsho/toggleterm.nvim',
	version = '*',
	opts = {
		open_mapping = [[<c-\>]],
		direction = 'float',
		float_opts = { border = 'curved' },
	},
	-- keys = {
	-- 	{ [[<c-\>]], '<cmd>ToggleTerm direction=float<cr>', mode = { 'n', 'i', 'v', 't' } },
	-- 	{ [[<m-\>]], '<cmd>ToggleTerm direction=vertical size=60<cr>', mode = { 'n', 'i', 'v', 't' } },
	-- 	{ [[<c-h>]], [[<cmd>wincmd h<cr>]], mode = { 't' } },
	-- 	{ [[<c-j>]], [[<cmd>wincmd j<cr>]], mode = { 't' } },
	-- 	{ [[<c-k>]], [[<cmd>wincmd k<cr>]], mode = { 't' } },
	-- 	{ [[<c-l>]], [[<cmd>wincmd l<cr>]], mode = { 't' } },
	-- 	{
	-- 		[[<m-t>]],
	-- 		function()
	-- 			require('toggleterm.terminal').Terminal:new({ cmd = 'lazygit', hidden = true }):toggle()
	-- 		end,
	-- 	},
	-- },
}
