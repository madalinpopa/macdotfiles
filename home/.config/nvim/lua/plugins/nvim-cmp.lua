return {
	"hrsh7th/nvim-cmp",
	-- All of the dependencies are useful for Go development.
	dependencies = {
		-- `lspkind` adds cool icons to the completion menu (e.g., a Go icon for functions).
		"onsails/lspkind.nvim",
		-- `cmp-nvim-lsp` is essential for getting suggestions from the LSP server (gopls).
		"hrsh7th/cmp-nvim-lsp",
		-- `cmp-buffer` suggests words from the current buffer, which is useful for Go.
		"hrsh7th/cmp-buffer",
		-- `cmp-path` suggests file paths, which is great for Go projects.
		"hrsh7th/cmp-path",
		-- `cmp-cmdline` provides completion for command-line commands, which is useful in the terminal.
		"hrsh7th/cmp-cmdline",
		{

			-- `LuaSnip` is a snippet engine that allows you to use code snippets in your Go files.
			"L3MON4D3/LuaSnip",
			version = "2.*",
			build = "make install_jsregexp",
		},
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		local lspkind = require("lspkind")

		-- This loads snippets from VS Code-style snippet files. It's useful if you
		-- want to use standard Go snippet collections.
		require("luasnip/loaders/from_vscode").lazy_load()

		cmp.setup({
			-- This section tells nvim-cmp how to handle snippets. It's essential.
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			-- These are your keybindings for the completion menu. They are solid defaults.
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }),
			}),

			-- These are the sources for autocompletion. This is the most important part.
			-- The current setup is ideal for Go.
			sources = cmp.config.sources({
				{ name = "nvim_lsp" }, -- **Essential for Go**: Gets suggestions from gopls.
				{ name = "luasnip" }, -- **Great for Go**: Provides code snippets.
				{ name = "buffer" }, -- Suggests words from your current file.
				{ name = "path" }, -- Suggests file paths.
			}),

			-- This configures the icons in the completion menu.
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
		})
	end,
}

