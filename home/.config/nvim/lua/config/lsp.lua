local capabilities = vim.tbl_deep_extend(
  "force",
  vim.lsp.protocol.make_client_capabilities(),
  require("blink.cmp").get_lsp_capabilities()
)
--
vim.lsp.config("*", {
  capabilities = capabilities,
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('my.lsp', {}),
  callback = function(args)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
    if client:supports_method('textDocument/implementation') then
      -- Create a keymap for vim.lsp.buf.implementation ...
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


    -- Auto-format ("lint") on save.
    -- Usually not needed if server supports "textDocument/willSaveWaitUntil".
    if not client:supports_method('textDocument/willSaveWaitUntil')
        and client:supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
        end,
      })
    end
  end,
})
