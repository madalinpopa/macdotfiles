return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	config = function()
		local ibl = require("ibl")
		ibl.setup({
			-- ensure these groups are used
			-- optional: a thinner character looks softer
			indent = { char = "┊" }, -- try "│" or "▏" if you prefer
			scope = { enabled = true },
		})
	end,
}
