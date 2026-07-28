-- Shared theme state, commands, and colorscheme application.

local state_file = vim.fn.stdpath("state") .. "/eevos-theme.lua"
local theme_names = {
  "material",
  "catppuccin",
  "gruvbox",
  "nord",
  "one-dark-pro",
  "solarized",
  "tokyo-night",
}

local theme = { name = "material", mode = "dark" }

local ok, saved_theme = pcall(dofile, state_file)
if ok and type(saved_theme) == "table" then
  theme.name = saved_theme.name or theme.name
  theme.mode = saved_theme.mode or theme.mode
end

local function save_theme()
  vim.fn.mkdir(vim.fn.fnamemodify(state_file, ":h"), "p")
  vim.fn.writefile({ string.format('return { name = "%s", mode = "%s" }', theme.name, theme.mode) }, state_file)
end

local function apply_theme()
  vim.o.background = theme.mode == "light" and "light" or "dark"

  if theme.name == "material" then
    vim.g.material_style = theme.mode == "light" and "lighter" or "deep ocean"
    vim.cmd.colorscheme("material")
  elseif theme.name == "catppuccin" then
    require("catppuccin").setup({ flavour = theme.mode == "light" and "latte" or "mocha" })
    vim.cmd.colorscheme("catppuccin")
  elseif theme.name == "one-dark-pro" then
    vim.cmd.colorscheme("onedark")
  elseif theme.name == "solarized" then
    vim.cmd.colorscheme("solarized8")
  else
    local colorscheme = {
      gruvbox = "gruvbox",
      nord = "nord",
      ["tokyo-night"] = "tokyonight",
    }
    vim.cmd.colorscheme(colorscheme[theme.name] or "material")
  end
end

local function select_theme(name)
  if not vim.tbl_contains(theme_names, name) then
    vim.notify("Unknown theme: " .. name, vim.log.levels.ERROR)
    return
  end

  theme.name = name
  save_theme()
  apply_theme()
  vim.notify(string.format("Neovim theme: %s (%s mode)", theme.name, theme.mode))
end

vim.api.nvim_create_user_command("ThemeSelect", function(options)
  if options.args ~= "" then
    select_theme(options.args)
    return
  end

  vim.ui.select(theme_names, { prompt = "Neovim theme" }, function(choice)
    if choice then
      select_theme(choice)
    end
  end)
end, {
  nargs = "?",
  complete = function()
    return theme_names
  end,
})

vim.api.nvim_create_user_command("ThemeToggle", function(options)
  local mode = options.args ~= "" and options.args or (theme.mode == "light" and "dark" or "light")
  if mode ~= "light" and mode ~= "dark" then
    vim.notify("ThemeToggle expects light or dark", vim.log.levels.ERROR)
    return
  end

  theme.mode = mode
  save_theme()
  apply_theme()
  vim.notify("Neovim theme mode: " .. mode)
end, {
  nargs = "?",
  complete = function()
    return { "light", "dark" }
  end,
})

apply_theme()
