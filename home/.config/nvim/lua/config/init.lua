-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

require("config.globals")
require("config.options")
require("config.keymaps")

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- import your plugins
		{ import = "plugins" },
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "rose-pine-dawn" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})

require("config.autocmds")

vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.MyTabLine()"

function MyTabLine()
	local s = ""
	for i = 1, vim.fn.tabpagenr("$") do
		local winnr = vim.fn.tabpagewinnr(i)
		local buflist = vim.fn.tabpagebuflist(i)
		local bufname = vim.fn.bufname(buflist[winnr])
		local filename = vim.fn.fnamemodify(bufname, ":t") -- only filename
		if filename == "" then
			filename = "[No Name]"
		end
		if i == vim.fn.tabpagenr() then
			s = s .. "%#TabLineSel# " .. i .. ": " .. filename .. " "
		else
			s = s .. "%#TabLine# " .. i .. ": " .. filename .. " "
		end
	end
	return s .. "%#TabLineFill#"
end
