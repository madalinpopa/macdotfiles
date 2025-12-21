require("config.globals")
require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.lsp")

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

vim.o.showtabline = 2
vim.o.tabline = "%!v:lua.MyTabLine()"
