" LSP
command! LspCodeAction lua require 'eevos.utils'.code_action()
command! LspDeclaration lua require 'eevos.utils'.declaration()
command! LspDefinition lua require 'eevos.utils'.definition()
command! LspDocumentSymbol lua require 'eevos.utils'.document_symbol()
command! LspFormatting lua require 'eevos.utils'.formatting()
command! LspFormattingSync lua require 'eevos.utils'.formatting_sync()
command! LspHover lua require 'eevos.utils'.hover()
command! LspImplementation lua require 'eevos.utils'.implementation()
command! LspRangeCodeAction lua require 'eevos.utils'.range_code_action()
command! LspRangeFormatting lua require 'eevos.utils'.range_formatting()
command! LspReferences lua require 'eevos.utils'.references()
command! LspRename lua require 'eevos.utils'.rename()
command! LspTypeDefinition lua require 'eevos.utils'.type_definition()
command! LspWorkspaceSymbol lua require 'eevos.utils'.workspace_symbol()
command! LspGotoNext lua require 'eevos.utils'.goto_next()
command! LspGotoPrev lua require 'eevos.utils'.goto_prev()
command! LspShowLineDiagnostics lua require 'eevos.utils'.show_line_diagnostics()

" Gitsigns
command! NextHunk lua require 'eevos.utils'.next_hunk()
command! PrevHunk lua require 'eevos.utils'.prev_hunk()
command! StageHunk lua require 'eevos.utils'.stage_hunk()
command! UndoStageHunk lua require 'eevos.utils'.undo_stage_hunk()
command! ResetHunk lua require 'eevos.utils'.reset_hunk()
command! ResetBuffer lua require 'eevos.utils'.reset_buffer()
command! PreviewHunk lua require 'eevos.utils'.preview_hunk()
command! BlameLine lua require 'eevos.utils'.blame_line()

" DAP
command! DebugToggleBreakpoint lua require'dap'.toggle_breakpoint()
command! DebugStart lua require'dap'.continue()
command! DebugContinue lua require'dap'.continue()
command! DebugStepOver lua require'dap'.step_over()
command! DebugStepOut lua require'dap'.step_out()
command! DebugStepInto lua require'dap'.step_into()
command! DebugToggleRepl lua require'dap'.repl.toggle()
command! DebugGetSession lua require'dap'.session()

" IKBS
command! NotesCreate lua require 'lv-notes'.create_note()
command! NotesVersion lua require 'lv-notes'.create_note()

nnoremap <silent> <F5> :source $MYVIMRC notify("Neovim reloaded...")<CR>
" Available Debug Adapters:
"   https://microsoft.github.io/debug-adapter-protocol/implementors/adapters/
" 
" Adapter configuration and installation instructions:
"   https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation
" 
" Debug Adapter protocol:
"   https://microsoft.github.io/debug-adapter-protocol/

" TODO Add full support later
" nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
" nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
" nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
" nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
" nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
" nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
" nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
" nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
" nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>

" Goyo https://github.com/junegunn/goyo.vim
" autocmd! User GoyoEnter lua require('gitsigns').toggle_signs()
" autocmd! User GoyoLeave lua require('gitsigns').toggle_signs()
" autocmd User GoyoEnter set laststatus=0 
" autocmd User GoyoLeave set laststatus=2
" autocmd! User GoyoEnter lua require('galaxyline').disable_galaxyline()
" autocmd! User GoyoLeave lua require('galaxyline').galaxyline_augroup()
