-- auto-format on save
local lsp_fmt_group_gopls = vim.api.nvim_create_augroup("LspFormattingGroup", {})
vim.api.nvim_create_autocmd("BufWritePre", {
	group = lsp_fmt_group_gopls,
	callback = function()
		local gopls = vim.lsp.get_clients({ name = "gopls" })

		if vim.tbl_isempty(gopls) then
			return
		end

		vim.lsp.buf.format({ name = "gopls", async = true })
	end,
})

-- disable auto comment on new line
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ 'r', 'o' })
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

-- Used by conform plugin to format buffers
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
