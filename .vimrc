set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"""plugin install
"
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'

"""""""""""" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
""""""""netrw conf
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction
map <silent> <C-E> :call ToggleVExplorer()<CR>
""""""""""""""""""""""""""""""""""""""""""""""
" Hit enter in the file browser to open the selected
" file with :vsplit to the right of the browser.
let g:netrw_browse_split = 4
let g:netrw_altv = 1
" Default to tree mode
let g:netrw_liststyle=3
let g:netrw_banner = 0
let g:netrw_winsize = 20
" Change directory to the current buffer when opening files.
set autochdir
""""""""""""""""""""""""""""""""""""""""""""""""
" Change directory to the current buffer when opening files.
set autochdir
let g:ycm_global_ycm_extra_conf = '/home/shafayetrahat/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_key_list_stop_completion = ['<CR>']
highlight Pmenu ctermfg=15 ctermbg=0 guifg=#ffffff guibg=#75b1d1 gui=bold
set completeopt-=preview
set encoding=utf-8
set tabstop=2
set number
highlight VertSplit cterm=NONE
set mouse=a
autocmd vimEnter *.cpp map <F8> :w <CR> :!clear ; g++ --std=c++17 %; if [ -f a.out ]; then time ./a.out; rm a.out; fi <CR>
