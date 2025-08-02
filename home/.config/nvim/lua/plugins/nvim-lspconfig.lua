return {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

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
        end

        -- Configure gopls specifically.
        -- The settings you provide here will be merged with the default settings.
        lspconfig.gopls.setup({
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                gopls = {
                    -- This is a gopls-specific setting.
                    -- It enables semantic tokens, which can provide more detailed highlighting.
                    semanticTokens = true,
                    -- You can add other gopls settings here, for example:
                    analyses = {
                        unusedparams = true,
                    },
                },
            },
        })

        -- You can add setups for other language servers here as well.
        -- For example, for lua_ls:
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
    end,
}