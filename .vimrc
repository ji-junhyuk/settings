set tabstop=4           "tab 할때 스페이스 갯수
set shiftwidth=4        ">>, <<키로 들여/내어쓰기 할 때 스페이스 갯수
set cindent             "c스타일 들여쓰기 활성화
set number              "라인넘버 표시
set hidden              "버퍼 저장하지 않았을 때 경고문 끄기
set showmatch           "일치하는 괄호 하이라이팅
set ruler               "좌하단 행, 열번호 출력
set vb                  "소리 대신 깜빡임
set history=1000        "vi 편집 기록 갯수(.viminfo)
set laststatus=2                "상태바 표시
filetype plugin on
syntax on

map <leader>t :tabnew
map <leader>q :bprev<CR>
map <leader>w :bnext<CR>
map <leader>v :set paste<CR>
map <leader>n :set nopaste<CR>
map <leader>c :!cat %<CR>

map <buffer> <F2> :w<CR>
map <buffer> <F3> :!gcc -Wall -Werror -Wextra -g %<CR>
map <buffer> <F4> :!g++ -Wall -Werror -Wextra -g %<CR>
map <buffer> <f5> :!gdb ./a.out<CR>

imap jk <Esc>
imap kj <Esc>

imap ,fi for (idx = 0; idx < ; ++idx)<ENTER>{<ENTER>}<ESC>O
imap ,fj for (jdx = 0; jdx < ; ++jdx)<ENTER>{<ENTER>}<ESC>O
imap ,if if ()<ENTER>{<ENTER>}<ESC>O
imap ,ef else if ()<ENTER>{<ENTER>}<ESC>O
imap ,e else<ENTER>{<ENTER>}<ESC>O

" 마지막 편집 위치 불러오기
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "normal g`\"" |
      \ endif

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'vimwiki/vimwiki'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


augroup todoauto
    autocmd BufWritePre *.md call UpdateBookProgress()
augroup END

autocmd BufNewFile 2022*.md call Generate_md()
function! Generate_md()
    let l:template = []
    call add(l:template, '---')
    call add(l:template, 'layout  : wiki')
    call add(l:template, 'title   : ')
    call add(l:template, 'summary : ')
    call add(l:template, 'date    : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'updated : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'tag     : ')
    call add(l:template, 'toc     : true')
    call add(l:template, 'public  : true')
    call add(l:template, 'parent  : ')
    call add(l:template, 'latex   : false')
    call add(l:template, '---')
    call add(l:template, '* TOC')
    call add(l:template, '{:toc}')
    call add(l:template, '')
    call add(l:template, '# ')
        call add(l:template, "- [ ] TDL")
        call add(l:template, "        - [ ] Vim")
        call add(l:template, "                - [ ] task")
        call add(l:template, "        - [ ] Routine")
        call add(l:template, "                - [ ] 1알고")
        call add(l:template, "                        - [ ] task")
        call add(l:template, "                - [ ] 1독서")
        call add(l:template, "                        - [ ] task")
        call add(l:template, "                - [ ] 1시험")
        call add(l:template, "                        - [ ] task")
        call add(l:template, "       - [ ] Main")
        call add(l:template, "               - [ ] main task")
    call setline(1, l:template)
    execute 'normal! G'
    execute 'normal! $'

    echom 'new wiki page has created'
endfunction

let g:vim_wiki_set_path = expand('<sfile>:p:h')
let g:vimwiki_list = [
                        \{
                        \   'path': '~/ji-junhyuk.github.io/_wiki',
                        \   'ext' : '.md',
                        \   'diary_rel_path': '.',
                        \},
                        \{
                        \   'path': '/mnt/c/Users/junto/OneDrive/_diary',
                        \   'ext' : '.md',
                        \   'diary_rel_path': '.',
                        \},
                        \{
                        \   'path': '/mnt/c/Users/junto/OneDrive/_book',
                        \   'ext' : '.md',
                        \   'diary_rel_path': '.',
                        \},
                        \{
                        \   'path': '/mnt/c/Users/junto/OneDrive/_test',
                        \   'ext' : '.md',
                        \   'diary_rel_path': '.',
                        \}
                        \]
let g:vimwiki_conceallevel = 0
let g:vimwiki_table_mappings = 0

" 자주 사용하는 vimwiki 명령어에 단축키를 취향대로 매핑해둔다
command! WikiIndex :VimwikiIndex
nmap <LocalLeader>ww <Plug>VimwikiIndex
nmap <LocalLeader>wi <Plug>VimwikiDiaryIndex
nmap <LocalLeader>w<LocalLeader>w <Plug>VimwikiMakeDiaryNote
nmap <LocalLeader>wt :VimwikiTable<CR>

" F4 키를 누르면 커서가 놓인 단어를 위키에서 검색한다.
nnoremap <F4> :execute "VWS /" . expand("<cword>") . "/" <Bar> :lopen<CR>

" Shift F4 키를 누르면 현재 문서를 링크한 모든 문서를 검색한다
nnoremap <S-F4> :execute "VWB" <Bar> :lopen<CR>

" If buffer modified, update any 'Last modified: ' in the first 20 lines.
" 'Last modified: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! LastModified()
    if g:md_modify_disabled
        return
    endif

    if (&filetype != "vimwiki")
        return
    endif

    if &modified
        " echo('markdown updated time modified')
        let save_cursor = getpos(".")
        let n = min([10, line("$")])

        exe 'keepjumps 1,' . n . 's#^\(.\{,10}updated\s*: \).*#\1' .
                    \ strftime('%Y-%m-%d %H:%M:%S +0900') . '#e'
        call histdel('search', -1)
        call setpos('.', save_cursor)
    endif
endfunction
function! NewTemplate()

    let l:wiki_directory = v:false

    for wiki in g:vimwiki_list
        if expand('%:p:h') =~ expand(wiki.path)
            let l:wiki_directory = v:true
            break
        endif
    endfor

    if !l:wiki_directory
        return
    endif

    if line("$") > 1
        return
    endif

    let l:template = []
    call add(l:template, '---')
    call add(l:template, 'layout  : wiki')
    call add(l:template, 'title   : ')
    call add(l:template, 'summary : ')
    call add(l:template, 'date    : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'updated : ' . strftime('%Y-%m-%d %H:%M:%S +0900'))
    call add(l:template, 'tag     : ')
    call add(l:template, 'toc     : true')
    call add(l:template, 'public  : true')
    call add(l:template, 'parent  : ')
    call add(l:template, 'latex   : false')
    call add(l:template, '---')
    call add(l:template, '* TOC')
    call add(l:template, '{:toc}')
    call add(l:template, '')
    call add(l:template, '# ')
    call setline(1, l:template)
    execute 'normal! G'
    execute 'normal! $'

    echom 'new wiki page has created'
endfunction
augroup vimwikiauto
    autocmd BufWritePre *.md keepjumps call LastModified()
    autocmd BufRead,BufNewFile *.md call NewTemplate()
    autocmd FileType vimwiki inoremap <S-Right> <C-r>=vimwiki#tbl#kbd_tab()<CR>
    autocmd FileType vimwiki inoremap <S-Left> <Left><C-r>=vimwiki#tbl#kbd_shift_tab()<CR>
augroup END

let g:md_modify_disabled = 0
