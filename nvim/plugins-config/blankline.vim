"=========== Ident Blankline ========
"lua << EOF
"require("indent_blankline").setup { }
"EOF
let g:indent_blankline_use_treesitter = v:true
"let g:indent_blankline_space_char = v:true
let g:indent_blankline_space_char = ' '
let g:indent_blankline_show_current_context = v:true
"let g:indent_blankline_char_highlight_list = v:true
let g:indent_blankline_show_current_context= v:true
let g:indent_blankline_filetype_exclude = ['help', 'packer']

let g:indent_blankline_enabled = v:true
let g:indent_blankline_filetype_exclude = ['help', 'nerdtree', 'vista', 'startify', 'fzf', 'easymotion']
let g:indent_blankline_buftype_exclude = ['terminal']
let g:indent_blankline_char = '│'
let g:indent_blankline_char_highlight = 'indentline'
let g:indent_blankline_show_first_indent_level = v:false
let g:indent_blankline_context_patterns = ['class',
            \'function',
            \'method',
            \'^if',
            \'^while',
            \'^typedef',
            \'^for',
            \'^object',
            \'^table',
            \'block',
            \'arguments',
            \'typedef',
            \'while',
            \'^public',
            \'return',
            \'if_statement',
            \'else_clause',
            \'jsx_element',
            \'jsx_self_closing_element',
            \'try_statement',
            \'catch_clause',
            \'import_statement']
let g:indent_blankline_show_trailing_blankline_indent = v:false
let g:indent_blankline_extra_indent_level = -1
