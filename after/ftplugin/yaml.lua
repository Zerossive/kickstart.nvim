-- [[ YAML ]]

-- [[ Options ]]
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

-- change conform prettierd and prettier formatters to use 2 spaces
local conform = require 'conform'
conform.formatters.prettierd.prepend_args = { '--tab-width=2', '--use-tabs=false', '--no-semi', '--single-quote' }
conform.formatters.prettier.prepend_args = { '--tab-width=2', '--use-tabs=false', '--no-semi', '--single-quote' }
