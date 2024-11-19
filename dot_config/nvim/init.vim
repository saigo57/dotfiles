" neovimはsnapで入れるのが簡単
" $ sudo snap install nvim --classic
"
" win上ではpowershellでwingetするのが簡単
" $ winget install Neovim.Neovim

"/usr/local/bin/zenhan クリップボード共有
set clipboard=unnamedplus

" 削除系のコマンドでレジスタが上書きされないようにする
nnoremap d "_d
nnoremap D "_D
xnoremap d "_d
nnoremap c "_c
nnoremap C "_C
nnoremap s "_s
nnoremap S "_S
xnoremap c "_c
xnoremap C "_C

" xをdに置き換え(xはdlで置き換え)
nnoremap x d
nnoremap xx dd
nnoremap X D
xnoremap x d

" IME OFF設定
" /usr/local/bin/zenhanにzenhan.exeをコピーしておく
if executable('zenhan')
  autocmd InsertLeave * :call system('zenhan 0')
  autocmd CmdlineLeave * :call system('zenhan 0')
endif

