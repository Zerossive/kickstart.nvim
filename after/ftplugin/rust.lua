-- [[ Rust ]]

-- [[ Keymaps]]

-- continually run
vim.keymap.set('n', '<leader><leader>w', function()
	vim.cmd 'vsplit | vertical resize 60 | terminal bacon run'
end, { desc = '[w]atch with bacon' })
vim.keymap.set('n', '<leader><leader>W', function()
	local cmd = string.format('ls . | entr -cs "rustc ' .. vim.fn.expand '%:t' .. ' && ./' .. vim.fn.expand '%:t:r' .. '"')
	vim.cmd('vsplit | vertical resize 60 | terminal ' .. cmd)
end, { desc = '[w]atch with rustc' })

-- compile and run once
vim.keymap.set('n', '<leader><leader>r', function()
	-- require('toggleterm').exec 'cargo build && cargo run'
	vim.cmd 'terminal cargo build && cargo run'
end, { desc = 'build and [r]un with cargo' })
vim.keymap.set('n', '<leader><leader>R', function()
	local cmd = string.format('rustc "%s" && ./"%s"', vim.fn.expand '%:t', vim.fn.expand '%:t:r')
	vim.cmd('terminal ' .. cmd)
end, { desc = 'build and [R]un with rustc' })
