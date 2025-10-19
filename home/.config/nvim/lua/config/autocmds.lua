-- auto-format on save
-- Used by conform plugin to format buffers
local conform_group = vim.api.nvim_create_augroup("ConformGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	group = conform_group,
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})

-- disable auto comment on new line
vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "r", "o" })
	end,
})

-- highlight on yank
local highlight_yank_group = vim.api.nvim_create_augroup("HighlightYankGroup", {})
vim.api.nvim_create_autocmd("TextYankPost", {
	group = highlight_yank_group,
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Return to last edit position when opening files
local buf_read_group = vim.api.nvim_create_augroup("UserConfig", {})
vim.api.nvim_create_autocmd("BufReadPost", {
	group = buf_read_group,
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, { command = "checktime" })

-- Automatically write a session when exiting a project for the first time

local session_dir = vim.fn.stdpath("data") .. "/sessions"
vim.api.nvim_create_autocmd("VimLeavePre", {

	callback = function()
		local sessions = require("mini.sessions")
		-- Get session directory and ensure it exists
		vim.fn.mkdir(session_dir, "p")

		-- Use the folder name as the session name
		local cwd = vim.fn.getcwd()
		local session_name = vim.fn.fnamemodify(cwd, ":t")
		local session_path = session_dir .. "/" .. session_name .. ".vim"

		-- If the session doesn’t exist yet, create it
		if not vim.loop.fs_stat(session_path) then
			print("(mini.sessions) Creating first-time session for project: " .. session_name)
			sessions.write(session_name)
			return
		end

		-- Otherwise, just update it
		sessions.write(session_name)
	end,
})
