set tabstop=4           "tab 할때 스페이스 갯수
set shiftwidth=4        ">>, <<키로 들여/내어쓰기 할 때 스페이스 갯수
set cindent             "c스타일 들여쓰기 활성화
set number              "라인넘버 표시
set hidden              "버퍼 저장하지 않았을 때 경고문 끄기
set showmatch           "일치하는 괄호 하이라이팅
set ruler               "좌하단 행, 열번호 출력
set vb                  "소리 대신 깜빡임
set history=1000        "vi 편집 기록 갯수(.viminfo)
set laststatus=2        "상태바 표시
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

map <space>p ?(<CR>a
map <space>; ?;<CR>i
imap ,fi for (idx = 0; idx < ; ++idx)<ENTER>{<ENTER>}<ESC>O
imap ,fj for (jdx = 0; jdx < ; ++jdx)<ENTER>{<ENTER>}<ESC>O
imap ,if if ()<ENTER>{<ENTER>}<ESC>O
imap ,ef else if ()<ENTER>{<ENTER>}<ESC>O
imap ,e else<ENTER>{<ENTER>}<ESC>O
imap ,w while ()<ENTER>{<ENTER>}<ESC>O
imap ,,, #include <iostream><ENTER>using namespace std;<ENTER><ENTER>int main(void)<ENTER>{<ENTER>ios::sync_with_stdio(false);<ENTER>cin.t
ie(NULL);<ENTER>}<ESC>O<ENTER>

" 마지막 편집 위치 불러오기
autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "normal g`\"" |
      \ endif

" plugin별로 setting 불러오기
for include_file in uniq(sort(globpath(&rtp, 'vim-include/*.vim', 0, 1)))
    execute "source " . include_file
endfor

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

Plug 'vimwiki/vimwiki'
Plug 'preservim/tagbar'
Plug 'nanotech/jellybeans.vim'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()