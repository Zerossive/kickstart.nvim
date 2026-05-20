-- [[ Rust ]]

-- [[ Keymaps]]

-- continually run
vim.keymap.set('n', '<leader><leader>w', function()
	vim.cmd 'vsplit | vertical resize 60 | terminal bacon run'
end, { desc = 'watch with bacon' })
vim.keymap.set('n', '<leader><leader>W', function()
	local cmd = string.format('ls . | entr -cs "rustc ' .. vim.fn.expand '%:t' .. ' && ./' .. vim.fn.expand '%:t:r' .. '"')
	vim.cmd('vsplit | vertical resize 60 | terminal ' .. cmd)
end, { desc = 'watch with rustc' })

-- compile and run once
vim.keymap.set('n', '<leader><leader>r', function()
	-- require('toggleterm').exec 'cargo build && cargo run'
	vim.cmd 'terminal cargo build && cargo run'
end, { desc = 'build and run with cargo' })
vim.keymap.set('n', '<leader><leader>R', function()
	local cmd = string.format('rustc "%s" && ./"%s"', vim.fn.expand '%:t', vim.fn.expand '%:t:r')
	vim.cmd('terminal ' .. cmd)
end, { desc = 'build and Run with rustc' })
