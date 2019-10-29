" au FileType * setlocal fo-=c fo-=r fo-=o ts=2 sts=2 sw=2 et
au FileType markdown,vimwiki setlocal ts=4 sts=4 sw=4
" au FileType go,golang setlocal ts=4 sts=4 sw=4 et
" au BufEnter * cd %:p:h
" au BufWritePost .vimrc source $MYVIMRC

" au FocusLost * :wa
au BufRead,BufNewFile {Gemfile,Rakefile,Capfile,*.rake,config.ru}     set ft=ruby ts=2 sts=2 sw=2 et sta
au BufRead,BufNewFile {*.md,*.mkd,*.markdown}                         set ft=markdown
au BufRead,BufNewFile {*.txt,*.md,*.mkd,*.markdown}                   setlocal spell spelllang=ru,en wrap linebreak
au! BufReadPost       {COMMIT_EDITMSG,*/COMMIT_EDITMSG}               set ft=gitcommit
au! BufWritePost      *.snippet                                       call ReloadAllSnippets()
" open help in vertical split
" au BufWinEnter *.txt if &ft == 'help' | wincmd H | endif
" au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
"     \| exe "normal! g`\"" | endif
"au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
"au BufEnter *.org            call org#SetOrgFileType()

" au BufEnter * silent! lcd %:p:h
"
" Remove trailing spaces
autocmd BufWritePre * :%s/\s\+$//e

" Rust
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" Ansible
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml.ansible foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml.ansible setlocal ts=2 sts=2 sw=2 expandtab
