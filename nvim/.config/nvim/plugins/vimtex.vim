Plug 'lervag/vimtex'

let g:tex_flavor = 'latex'
let g:vimtex_compiler_progname = 'nvr'

let g:vimtex_compiler_latexmk_engines = {
    \ 'xelatex'          : '-xelatex',
    \ '_'                : '-xelatex',
    \ 'pdflatex'         : '-pdf',
    \ 'dvipdfex'         : '-pdfdvi',
    \ 'lualatex'         : '-lualatex',
    \ 'context (pdftex)' : '-pdf -pdflatex=texexec',
    \ 'context (luatex)' : '-pdf -pdflatex=context',
    \ 'context (xetex)'  : '-pdf -pdflatex=''texexec --xtx''',
    \}

let g:vimtex_compiler_latexrun_engines = {
    \ 'lualatex'         : 'lualatex',
    \ 'xelatex'          : 'xelatex',
    \ '_'                : 'xelatex',
    \ 'pdflatex'         : 'pdflatex',
    \}

let g:vimtex_indent_lists = [
            \ 'itemize',
            \ 'description',
            \ 'enumerate',
            \ 'thebibliography',
            \ 'inparaenum',
            \ 'compactenum',
            \ 'inparalist',
            \ 'compactlist'
            \]

