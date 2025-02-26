---@diagnostic disable: undefined-global
-- Markdown Snippets
--
-- NOTE: to start a snippet:
--  1. add s(info, code) to returned list
--  2. define trigger, name, and description
--  3. define code
--

local function get_filename()
	local current_filename = vim.api.nvim_buf_get_name(0)
	if current_filename ~= '' then
		return current_filename:match('[^/]+$'):gsub('%.%w+$', '')
	else
		return ''
	end
end
local function get_date(relative)
	local current_filename = get_filename()
	if relative ~= 0 and relative ~= 1 and relative ~= -1 then
		relative = 0
	end
	if current_filename == '' and relative == 0 then
		return io.popen('date -d "today ' .. relative .. ' day" +"%Y-%m-%d"'):read()
	else
		return io.popen('date -d "' .. get_filename() .. ' ' .. relative .. ' day" +"%Y-%m-%d"'):read()
	end
end
local function today()
	return get_date(0)
end
local function yesterday()
	return get_date(-1)
end
local function tomorrow()
	return get_date(1)
end

return {
	-- Daily Note Template
	s({
		trig = 'daily',
		name = 'Daily Note Template',
		dscr = 'Template for Daily Notes',
	}, {
		t {
			'---',
			'aliases: ',
			'weight: ',
			'---',
			'',
			'**[[',
		},
		f(yesterday),
		t '|⬅ Previous Day]] [[Daily Tracker.canvas|📆]] [[',
		f(tomorrow),
		t { '|Next Day ➡]]**', '', '# ' },
		f(today),
		t { '', '#daily', '', '' },
	}),
}
