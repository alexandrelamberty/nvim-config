-- Change this to your notes directory
local NOTES_DIR = vim.fn.expand("~/notes")

local function qf_notes_in_folder()
    local pattern = NOTES_DIR .. "/**/*.{md}"
    local files = {}

    for file in string.gmatch(vim.fn.glob(pattern), "[^\n]+") do
        table.insert(files, {
            filename = file,
            lnum = 1,
            col = 1,
            text = "Note file: " .. file,
        })
    end

    vim.fn.setqflist(files, "r")

    --- vim.notify("Loaded " .. #files .. " notes from: " .. NOTES_DIR)
    vim.g.qf_notes_mode = true
    vim.cmd("copen")
end

vim.api.nvim_create_user_command("QfNotesFolder", qf_notes_in_folder, {})

vim.api.nvim_create_autocmd("BufWinLeave", {
    pattern = "quickfix",
    callback = function()
        vim.g.qf_notes_mode = false
    end,
})