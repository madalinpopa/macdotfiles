local capabilities = vim.tbl_deep_extend(
	"force",
	vim.lsp.protocol.make_client_capabilities(),
	require("blink.cmp").get_lsp_capabilities()
)

vim.lsp.config("*", {
	capabilities = capabilities,
})

-- Python LSP
vim.lsp.config("ty", {
	settings = {
		ty = {},
	},
})
vim.lsp.enable("ty")

-- Go LSP
vim.lsp.config("gopls", {
	settings = {
		gopls = {
			gofumpt = true,
			codelenses = {
				gc_details = false,
				generate = true,
				regenerate_cgo = true,
				run_govulncheck = true,
				test = true,
				tidy = true,
				upgrade_dependency = true,
				vendor = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			analyses = {
				nilness = true,
				unusedparams = true,
				["ST1000"] = false,
				unusedwrite = true,
			},
			usePlaceholders = false,
			completeUnimported = true,
			staticcheck = true,
			directoryFilters = { "-.git", "-.jj", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
			semanticTokens = true,
		},
	},
})
vim.lsp.enable("gopls")

-- Lua LSP
vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

-- Configure diagnostic signs
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
