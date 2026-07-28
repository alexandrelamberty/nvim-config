-- ============================================================================
-- Colorscheme & highlights
-- ============================================================================

local api = vim.api

-- ----------------------------------------------------------------------------
-- Colorscheme
-- ----------------------------------------------------------------------------

-- The active colorscheme is applied by eevos.theme.

-- ----------------------------------------------------------------------------
-- Helpers
-- ----------------------------------------------------------------------------

local function augroup(name)
  return api.nvim_create_augroup(name, { clear = true })
end

local function hl(name, opts)
  api.nvim_set_hl(0, name, opts)
end

-- ----------------------------------------------------------------------------
-- GitSigns highlights (reapplied on ColorScheme)
-- ----------------------------------------------------------------------------

api.nvim_create_autocmd("ColorScheme", {
  group = augroup("gitsigns_highlights"),
  callback = function()
    hl("SignColumn",      { bg = "#193549" })
    hl("GitSignsAdd",     { bg = "#193549", fg = "#3ad900" })
    hl("GitSignsChange",  { bg = "#193549", fg = "#ffc600" })
    hl("GitSignsDelete",  { bg = "#193549", fg = "#ff2600" })
    hl("ColorColumn",     { bg = "#204563", fg = "NONE" })
  end,
})

-- ----------------------------------------------------------------------------
-- EndOfBuffer
-- ----------------------------------------------------------------------------

api.nvim_create_autocmd("ColorScheme", {
  group = augroup("end_of_buffer"),
  callback = function()
    hl("EndOfBuffer", { fg = "#0F111A" })
  end,
})

-- ----------------------------------------------------------------------------
-- Telescope
-- ----------------------------------------------------------------------------
-- These don't *need* a ColorScheme autocmd, but it doesn't hurt either.
-- Keeping them static is fine if you never change colorschemes at runtime.

hl("TelescopeNormal",    { bg = "#1e222a", fg = "#c8d0e0" })
hl("TelescopeBorder",    { bg = "#1e222a", fg = "#3b4048" })
hl("TelescopeSelection", { bg = "#3b4048", fg = "#ffffff" })

-- ----------------------------------------------------------------------------
-- Optional: NvimTree (kept commented as in original)
-- ----------------------------------------------------------------------------
-- hl("NvimTreeNormal",   { bg = "#16161e" })
-- hl("NvimTreeNormalNC", { bg = "#16161e" })
