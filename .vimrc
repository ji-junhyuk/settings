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

map <leader>f ?(<CR>a
imap ,fi for (idx = 0; idx < ; ++idx)<ENTER>{<ENTER>}<ESC>O
imap ,fj for (jdx = 0; jdx < ; ++jdx)<ENTER>{<ENTER>}<ESC>O
imap ,if if ()<ENTER>{<ENTER>}<ESC>O
imap ,ef else if ()<ENTER>{<ENTER>}<ESC>O
imap ,e else<ENTER>{<ENTER>}<ESC>O
imap ,w while ()<ENTER>{<ENTER>}<ESC>O
imap ,,, #include <iostream><ENTER>using namespace std;<ENTER><ENTER>int main(void)<ENTER>{<ENTER>ios::sync_with_stdio(false);<ENTER>cin.tie(NULL);<ENTER>}<ESC>O<ENTER>

" 마지막 편집 위치 불러오기
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "normal g`\"" |
      \ endif

" plugin별로 setting 불러오기
for include_file in uniq(sort(globpath(&rtp, 'vim-include/*.vim', 0, 1)))
    execute "source " . include_file
endfor

" ===================== Vundle Plugin ===================="

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vimwiki/vimwiki'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
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
