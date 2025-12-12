----------------------------------
-- Heirline — Full Statusline
----------------------------------

local conditions = require("heirline.conditions")
local utils = require("heirline.utils")

----------------------------------
-- Colors (auto from your theme)
----------------------------------
local colors = {
    fg       = utils.get_highlight("Normal").fg,
    bg       = utils.get_highlight("Normal").bg,
    red      = utils.get_highlight("DiagnosticError").fg,
    orange   = utils.get_highlight("DiagnosticWarn").fg,
    yellow   = utils.get_highlight("DiagnosticWarn").fg,
    green    = utils.get_highlight("DiagnosticOk").fg,
    blue     = utils.get_highlight("Directory").fg,
    cyan     = utils.get_highlight("DiagnosticInfo").fg,
    magenta  = utils.get_highlight("Constant").fg,
}

----------------------------------
-- COMPONENTS
----------------------------------

-- SPACE helper
local Space = { provider = " " }

-- Mode block
local ViMode = {
    init = function(self)
        self.mode = vim.fn.mode(1)
    end,
    static = {
        names = {
     n = "NORMAL",
            no = "OP-PENDING",
            nov = "OP-PENDING",
            noV = "OP-PENDING",
            ["no\22"] = "OP-PENDING",

            i = "INSERT",
            ic = "INSERT",
            ix = "INSERT",

            v = "VISUAL",
            V = "V-LINE",
            ["\22"] = "V-BLOCK",

            c = "COMMAND",
            cv = "EX",
            ce = "EX",

            r = "REPLACE",
            R = "REPLACE",
            Rv = "V-REPLACE",

            s = "SELECT",
            S = "S-LINE",
            ["\19"] = "S-BLOCK",

            t = "TERMINAL",
        },
        colors = {
            n = "green",
            i = "blue",
            v = "magenta",
            V = "magenta",
            ["\22"] = "magenta",
            c = "orange",
            t = "red",
        },
    },
    provider = function(self)
        local name = self.names[self.mode] or "UNKNOWN"
        return " " .. name .. " "
    end,
    hl = function(self)
        local color = self.colors[self.mode] or "fg"
        return { fg = colors.bg, bg = colors[color], bold = true }
    end,
}

-- Git
local Git = {
    condition = conditions.is_git_repo,
    init = function(self)
        self.status = vim.b.gitsigns_status_dict
    end,
    {
        provider = function(self)
            return "  " .. self.status.head .. " "
        end,
        hl = { fg = colors.orange },
    },
    {
        provider = function(self)
            local added = self.status.added or 0
            local removed = self.status.removed or 0
            local changed = self.status.changed or 0
            return string.format("+%s ~%s -%s", added, changed, removed)
        end,
        hl = { fg = colors.green },
    },
}

-- File name
local FileName = {
  provider = function()
    -- If the buffer is a quickfix window
    if vim.bo.buftype == "quickfix" then
      if vim.g.qf_notes_mode then
        return " 📘 NOTES LIST "
      else
        return " Quickfix "
      end
    end

    -- regular files
    local name = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
    return name ~= "" and (" " .. name .. " ") or " [No Name] "
  end,
  hl = { fg = colors.blue },
}

-- Diagnostics
local Diagnostics = {
    condition = conditions.has_diagnostics,

    {
        provider = " ",
        hl = { fg = colors.red },
    },
    {
        provider = function()
            return vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }).n
        end,
    },
    Space,
    {
        provider = " ",
        hl = { fg = colors.yellow },
    },
    {
        provider = function()
            return vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }).n
        end,
    },
    Space,
    {
        provider = " ",
        hl = { fg = colors.cyan },
    },
    {
        provider = function()
            return vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO }).n
        end,
    },
}

-- LSP names
local LSP = {
    condition = conditions.lsp_attached,
    provider = function()
        local names = {}
        for _, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
            table.insert(names, server.name)
        end
        return "  " .. table.concat(names, ", ") .. " "
    end,
    hl = { fg = colors.magenta },
}

-- File type
local FileType = {
    provider = function()
        return " " .. string.upper(vim.bo.filetype) .. " "
    end,
    hl = { fg = colors.orange },
}

-- Ruler (% + line/col)
local Ruler = {
    provider = " %P  %l:%c ",
    hl = { fg = colors.fg },
}

----------------------------------
-- FINAL STATUSLINE LAYOUT
----------------------------------

local StatusLine = {
    ViMode,
    Space,
    Git,
    Space,
    FileName,
    Space,
    Diagnostics,
    Space,
    LSP,
    utils.align,  -- Right side
    FileType,
    Space,
    Ruler,
}

----------------------------------
-- SETUP
----------------------------------
require("heirline").setup({
    statusline = StatusLine,
})
