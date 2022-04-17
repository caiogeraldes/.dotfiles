""" LaTeX
" Compiladores de LaTeX e BibTeX
augroup tex
    autocmd!
    let g:tex_flavor='lualatex'
    autocmd BufReadPre *.tex let b:vimtex_main = 'main.tex'
    autocmd FileType tex let NERDTreeIgnore=[".fdb_latexmk", ".git", ".aux",
                \ ".toc", ".aux", ".lof", ".log", ".lot", ".fls", ".out",
                \ ".toc", ".fmt", ".fot", ".cb", ".cb2", ".ptp", "idx", ".ilg",
                \".ind", ".log", ".out", ".synctex.gz", ".xdv", ".fls"]
    autocmd FileType tex let g:vimtex_view_general_viewer = 'zathura'
    autocmd FileType tex let g:vimtex_quickfix_open_on_warning = 0

    set wrap
    set linebreak
    set breakindent
    autocmd FileType tex inoremap " ``

    autocmd FileType tex inoremap ,i \textit{}<Esc>i
    autocmd FileType tex inoremap ,I \textit{<Esc>ea}<Esc>
    autocmd FileType tex nnoremap ,i i\textit{<Esc>ea}<Esc>
    autocmd FileType tex vmap ,i S}i\textit<Esc>%

    autocmd FileType tex inoremap ,e \emph{}<Esc>i
    autocmd FileType tex inoremap ,E \emph{<Esc>ea}<Esc>
    autocmd FileType tex nnoremap ,e i\emph{<Esc>ea}<Esc>
    autocmd FileType tex vmap ,e S}i\emph<Esc>%


    autocmd FileType tex inoremap ,b \textbf{}<Esc>i
    autocmd FileType tex inoremap ,B \textbf{<Esc>ea}<Esc>
    autocmd FileType tex nnoremap ,b i\textbf{<Esc>ea}<Esc>
    autocmd FileType tex vmap ,b S}i\textbf<Esc>%

    autocmd FileType tex inoremap ,sc \textsc{}<Esc>i
    autocmd FileType tex inoremap ,SC \textsc{<Esc>ea}<Esc>
    autocmd FileType tex nnoremap ,sc i\textsc{<Esc>ea}<Esc>
    autocmd FileType tex vmap ,sc S}i\textsc<Esc>%

    " Ambientes
    autocmd FileType tex inoremap ,vers \begin{verse}<Enter><Enter>\end{verse}<Esc>ki
    autocmd FileType tex inoremap ,comp \begin{compactenum}<Enter><Enter>\end{compactenum}<Esc>ki\item<Space>
    autocmd FileType tex inoremap ,inpar \begin{inparaenum}<Enter><Enter>\end{inparaenum}<Esc>ki\item<Space>

    """ Específico para vocabulários em LaTeX
    autocmd FileType tex inoremap ,vocab \entradavoc{<++>}{<++>}{<++>}<Esc>0
augroup END

autocmd FileType tex map <F4> :w! \| !biber main <CR>



"""" Rscript
augroup file_r
    autocmd!
    let R_source = '~/.config/nvim/tmux_split.vim'
    autocmd BufRead,BufNewFile *.r set filetype=r
    autocmd FileType r map <F5> :w! \| !Rscript %:t <CR>
    autocmd FileType r map <F6> :w! \| !R CMD BATCH %:t <CR>
    function! s:customNvimRMappings()
       nmap <buffer> <Leader>sf <Plug>RSendFunction
    endfunction
    autocmd filetype r call s:customNvimRMappings()
    nnoremap <leader>FF <cmd>Telescope find_files theme=get_dropdown<cr>
    autocmd Filetype r set tabstop=2
    autocmd FileType r set softtabstop=2
    autocmd FileType r set shiftwidth=2
    autocmd FileType r set noautoindent
    autocmd FileType r set nosmartindent
    autocmd FileType r let r_indent_align_args = 0
augroup END

"""" Go
autocmd FileType go map <F5> :w! \| !go run %:t <CR>

"""" Texto
autocmd FileType markdown map <F5> :w! \| !groff %:t > out.pdf <CR>
autocmd FileType tex map <F7> :w! \| !zathura out.pdf & <Enter>


""" Rmarkdown
augroup file_Rmd
    autocmd!
    autocmd FileType rmarkdown map <F5> :w! \| :RMarkdown pdf<CR><CR>
    autocmd FileType rmarkdown setlocal commentstring=<!--\ %s\ -->
    autocmd FileType rmarkdown inoremap ,b ****<Esc>hi
    autocmd FileType rmarkdown inoremap ,B **<Esc>ea**<Esc>
    autocmd FileType rmarkdown nnoremap ,b i**<Esc>ea**<Esc>
    autocmd FileType rnoweb map <F5> :w! \| :!R CMD Sweave %<CR><CR>
augroup END

""" rust
augroup file_rust
    autocmd!
    " let g:deoplete#enable_at_startup = 0
    autocmd FileType rust map <F5> :w! \| :!cargo run<CR>
    autocmd Filetype rust set tabstop=4
    autocmd FileType rust set softtabstop=4
    autocmd FileType rust set shiftwidth=4
augroup END


"Python
augroup file_python
    autocmd!
    autocmd BufRead,BufNewFile *.py set filetype=python
    autocmd BufWritePre *.py execute ':Black'
    autocmd Filetype python set tabstop=4
    autocmd FileType python set softtabstop=4
    autocmd FileType python set shiftwidth=4
    autocmd FileType python map <F5> :w! \| !python %:p <CR>
    autocmd FileType python map <F9> :Black<CR> :w<CR>
    autocmd FileType python set statusline+=%#warningmsg#
    autocmd FileType python set statusline+=%{SyntasticStatuslineFlag()}
    autocmd FileType python set statusline+=%*
    autocmd FileType python set foldenable
    autocmd FileType python set foldmethod=indent
    autocmd FileType python set foldlevel=99

    " autocmd FileType python let g:syntastic_always_populate_loc_list = 1
    " autocmd FileType python let g:syntastic_auto_loc_list = 1
    " autocmd FileType python let g:syntastic_check_on_open = 1
    " autocmd FileType python let g:syntastic_check_on_wq = 0
    " autocmd FileType python let g:syntastic_python_checkers = ['pylint2']
    " autocmd FileType python let g:syntastic_javascript_checkers = ['eslint']
    " autocmd FileType python let g:syntastic_tex_checkers = ['chktex']
augroup END


autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

"" HTML
augroup file_html
  autocmd!
  autocmd BufRead,BufNewFile *.html set filetype=html
  autocmd Filetype html set tabstop=2
  autocmd FileType html set softtabstop=2
  autocmd FileType html set shiftwidth=2
augroup END

""" Vim config
augroup file_vim
    autocmd!
    autocmd BufRead,BufNewFile *.vim set filetype=vim
    " Compile
    autocmd FileType vim map <F5> :w! \| :so %<CR>
    autocmd Filetype vim set tabstop=4
    autocmd FileType vim set softtabstop=4
    autocmd FileType vim set shiftwidth=4
augroup END

""" Js config
augroup file_js
    autocmd!
    autocmd BufRead,BufNewFile *.js set filetype=javascript
    autocmd Filetype javascript set tabstop=4
    autocmd FileType javascript set softtabstop=4
    autocmd FileType javascript set shiftwidth=4
augroup END


" Arduino
let g:arduino_home_dir = $HOME . "/.arduino15"

