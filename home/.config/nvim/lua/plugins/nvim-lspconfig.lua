return {
	"neovim/nvim-lspconfig",
	dependencies = { "mason-org/mason-lspconfig.nvim" },
	opts = {
		ensure_installed = { "lua_ls", "gopls" },
	},
	config = function()
		local lspconfig = require("lspconfig")

		-- Get capabilities from cmp_nvim_lsp and vim.lsp.protocol
		local capabilities = vim.tbl_deep_extend(
			"force",
			vim.lsp.protocol.make_client_capabilities(),
			require("cmp_nvim_lsp").default_capabilities()
		)

		-- The on_attach function is what runs when the LSP attaches to a buffer.
		-- We use it to set keymaps that are only active in that buffer.
		local on_attach = function(client, bufnr)
			local bufmap = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { buffer = bufnr, noremap = true, silent = true, desc = desc })
			end

			bufmap("gD", vim.lsp.buf.declaration, "Go to Declaration")
			bufmap("gd", vim.lsp.buf.definition, "Go to Definition")
			bufmap("K", vim.lsp.buf.hover, "Hover Documentation")
			bufmap("gi", vim.lsp.buf.implementation, "Go to Implementation")
			bufmap("<leader>k", vim.lsp.buf.signature_help, "Signature Help")
			bufmap("<leader>rn", vim.lsp.buf.rename, "Rename")
			bufmap("<leader>ca", vim.lsp.buf.code_action, "Code Action")
			bufmap("gr", vim.lsp.buf.references, "Go to References")

			-- Add this for organizing imports
			if client.supports_method("textDocument/codeAction") then
				bufmap("<leader>oi", function()
					vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
				end, "Organize Imports")
			end
		end

		-- Configure gopls specifically.
		lspconfig.gopls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
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

		-- Configure lua_ls specifically.
		lspconfig.lua_ls.setup({
			on_attach = on_attach,
			capabilities = capabilities,
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
	end,
}
