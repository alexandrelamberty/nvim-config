-- Eevos Neovim configuration bootstrapper.
-- The file simply wires all Lua modules together so the rest of the config
-- can stay self-contained and easy to reason about.

local function load(module)
  local ok, err = pcall(require, module)
  if ok then
    return
  end

  vim.schedule(function()
    vim.notify(
      string.format("[nvim-config] failed to load '%s'\n%s", module, err),
      vim.log.levels.ERROR
    )
  end)
end

-- Core settings & helpers ----------------------------------------------------
for _, module in ipairs({
  "eevos.globals",
  "eevos.settings",
  "eevos.keymappings",
  "eevos.plugins",
  "eevos.colorscheme",
  "eevos.utils",
  "eevos.autocommands",
}) do
  load(module)
end

-- Stand-alone plugin configs -------------------------------------------------
for _, module in ipairs({
  "eevos.plugins.autopairs",
  "eevos.plugins.comment",
  "eevos.plugins.emmet",
  -- "eevos.plugins.galaxyline",
  "eevos.plugins.heirline",
  "eevos.plugins.gitsigns",
  "eevos.plugins.neogit",
  "eevos.plugins.markdown-preview",
  "eevos.plugins.npm-scripts",
  "eevos.plugins.nvim-cmp",
  "eevos.plugins.nvimtree",
  "eevos.plugins.rnvimr",
  "eevos.plugins.telescope",
  "eevos.plugins.toggleterm",
  "eevos.plugins.treesitter",
  "eevos.plugins.whichkey",
  "eevos.plugins.notes",
}) do
  load(module)
end

-- Language tooling -----------------------------------------------------------
load("eevos.lsp")
load("eevos.dap")
