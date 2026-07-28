local handlers = {}

local lsp = vim.lsp.buf
local diag = vim.diagnostic

-- ============================================================================
-- LSP Buffer
-- ============================================================================

handlers.add_to_workspace_folder     = lsp.add_workspace_folder
handlers.clear_references            = lsp.clear_references
handlers.code_action                 = lsp.code_action
handlers.document_highlight          = lsp.document_highlight
handlers.document_symbol             = lsp.document_symbol
handlers.hover                       = lsp.hover
handlers.implementation              = lsp.implementation
handlers.incoming_calls              = lsp.incoming_calls
handlers.list_workspace_folders      = lsp.list_workspace_folders
handlers.outgoing_calls              = lsp.outgoing_calls
handlers.rename                      = lsp.rename
handlers.signature_help              = lsp.signature_help
handlers.type_definition             = lsp.type_definition
handlers.workspace_symbol            = lsp.workspace_symbol

handlers.declaration = function()
  lsp.declaration()
  lsp.clear_references()
end

handlers.definition = function()
  lsp.definition()
  lsp.clear_references()
end

handlers.references = function()
  lsp.references()
  lsp.clear_references()
end

handlers.format = function(opts)
  lsp.format(opts or { timeout_ms = 1000 })
end

handlers.range_code_action = lsp.range_code_action

handlers.range_format = function()
  lsp.format({ range = true })
end

handlers.remove_workspace_folder = lsp.remove_workspace_folder

-- ============================================================================
-- Diagnostics (modern API)
-- ============================================================================

handlers.diagnostic_next       = diag.goto_next
handlers.diagnostic_prev       = diag.goto_prev
handlers.diagnostic_open_float = diag.open_float

handlers.diagnostic_all = function()
  return diag.get()
end

-- ============================================================================
-- DAP (lazy & optional)
-- ============================================================================

local function dap()
  local ok, dap = pcall(require, "dap")
  return ok and dap or nil
end

handlers.toggle_breakpoint = function()
  local d = dap()
  if d then d.toggle_breakpoint() end
end

handlers.start = function()
  local d = dap()
  if d then d.run_last() end
end

handlers.continue = function()
  local d = dap()
  if d then d.continue() end
end

handlers.step_over = function()
  local d = dap()
  if d then d.step_over() end
end

handlers.step_into = function()
  local d = dap()
  if d then d.step_into() end
end

handlers.step_out = function()
  local d = dap()
  if d then d.step_out() end
end

handlers.toggle_repl = function()
  local d = dap()
  if d then d.repl.toggle() end
end

handlers.get_session = function()
  local d = dap()
  return d and d.session() or nil
end

-- ============================================================================
-- GitSigns
-- ============================================================================

local function gitsigns()
  local ok, gs = pcall(require, "gitsigns")
  return ok and gs or nil
end

handlers.next_hunk = function()
  local gs = gitsigns()
  if gs then gs.next_hunk() end
end

handlers.prev_hunk = function()
  local gs = gitsigns()
  if gs then gs.prev_hunk() end
end

handlers.stage_hunk = function()
  local gs = gitsigns()
  if gs then gs.stage_hunk() end
end

handlers.undo_stage_hunk = function()
  local gs = gitsigns()
  if gs then gs.undo_stage_hunk() end
end

handlers.reset_hunk = function()
  local gs = gitsigns()
  if gs then gs.reset_hunk() end
end

handlers.reset_buffer = function()
  local gs = gitsigns()
  if gs then gs.reset_buffer() end
end

handlers.preview_hunk = function()
  local gs = gitsigns()
  if gs then gs.preview_hunk() end
end

handlers.blame_line = function()
  local gs = gitsigns()
  if gs then gs.blame_line() end
end

return handlers
