local handlers = {}

-- LSP Buffer

function handlers.add_to_workspace_folder()
    vim.lsp.buf.add_workspace_folder()
end

function handlers.clear_references()
    vim.lsp.buf.clear_references()
end

function handlers.code_action()
    vim.lsp.buf.code_action()
end

function handlers.declaration()
    vim.lsp.buf.declaration()
    vim.lsp.buf.clear_references()
end

function handlers.definition()
    vim.lsp.buf.definition()
    vim.lsp.buf.clear_references()
end

function handlers.document_highlight()
    vim.lsp.buf.document_highlight()
end

function handlers.document_symbol()
    vim.lsp.buf.document_symbol()
end

function handlers.formatting()
    vim.lsp.buf.formatting()
end

function handlers.formatting_sync()
    vim.lsp.buf.formatting_sync()
end

function handlers.hover()
    vim.lsp.buf.hover()
end

function handlers.implementation()
    vim.lsp.buf.implementation()
end

function handlers.incoming_calls()
    vim.lsp.buf.incoming_calls()
end

function handlers.list_workspace_folders()
    vim.lsp.buf.list_workspace_folders()
end

function handlers.outgoing_calls()
    vim.lsp.buf.outgoing_calls()
end

function handlers.range_code_action()
    vim.lsp.buf.range_code_action()
end

function handlers.range_formatting()
    vim.lsp.buf.range_formatting()
end

function handlers.references()
    vim.lsp.buf.references()
    vim.lsp.buf.clear_references()
end

function handlers.remove_workspace_folder()
    vim.lsp.buf.remove_workspace_folder()
end

function handlers.rename()
    vim.lsp.buf.rename()
end

function handlers.signature_help()
    vim.lsp.buf.signature_help()
end

function handlers.type_definition()
    vim.lsp.buf.type_definition()
end

function handlers.workspace_symbol()
    vim.lsp.buf.workspace_symbol()
end

-- LSP Diagnostic

function handlers.get_all()
    vim.lsp.diagnostic.get_all()
end

function handlers.get_next()
    vim.lsp.diagnostic.get_next()
end

function handlers.get_prev()
    vim.lsp.diagnostic.get_prev()
end

function handlers.goto_next()
    vim.lsp.diagnostic.goto_next()
end

function handlers.goto_prev()
    vim.lsp.diagnostic.goto_prev()
end

function handlers.show_line_diagnostics()
    vim.lsp.diagnostic.show_line_diagnostics()
end

-- DAP

function handlers.toggle_breakpoint()

end

function handlers.start()

end

function handlers.continue()

end

function handlers.step_over()

end

function handlers.step_out()

end

function handlers.step_into()

end

function handlers.toggle_repl()

end

function handlers.get_session()

end

-- Git Signs

function handlers.next_hunk()
    require('gitsigns').next_hunk()
end

function handlers.prev_hunk()
    require('gitsigns').prev_hunk()
end

function handlers.stage_hunk()
    require('gitsigns').stage_hunk()
end

function handlers.undo_stage_hunk()
    require('gitsigns').undo_stage_hunk()
end

function handlers.reset_hunk()
    require('gitsigns').reset_hunk()
end

function handlers.reset_buffer()
    require('gitsigns').reset_buffer()
end

function handlers.preview_hunk()
    require('gitsigns').preview_hunk()
end

function handlers.blame_line()
    require('gitsigns').blame_line()
end

-- Misc

function handlers.file_exists(name)
    local f = io.open(name, "r")
    if f ~= nil then
        io.close(f)
        return true
    else
        return false
    end
end

return handlers

