" Trigger configuration. <Tab> 을 쓴다면 ycm 과 키가 중복되어 제대로 기능하지 않을 수 있다. 둘 중 하나의 설정을 바꿔준다.
let g:UltiSnipsExpandTrigger="<Tab>"

let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsEditSplit="vertical"     " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips']
" let g:UltiSnipsSnippetDirectories = ['UltiSnips']
