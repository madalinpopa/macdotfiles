return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<c-t>]],
			size = 25,
			direction = "horizontal",
		})
	end,
}
