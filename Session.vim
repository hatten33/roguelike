let SessionLoad = 1
if &cp | set nocp | endif
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dev/rogue
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +59 engine.py
badd +1 en
badd +1 terminal.py
badd +3 renderer.py
badd +33 map.py
badd +2 input_handlers.py
badd +68 ~/.vimrc
badd +1 map_objects/tile.py
badd +4 color.py
badd +35 gamemap/gamemap.py
badd +17 entity/entity.py
badd +6 game_states.py
badd +5 components/fighter.py
badd +17 components/ai.py
badd +9 components/fov.py
badd +14 death_functions.py
badd +11 game_messages.py
badd +3 components/levelable.py
badd +1 components/player_class.py
badd +7 utilities.py
argglobal
silent! argdel *
$argadd engine.py
edit terminal.py
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winminheight=1 winheight=1 winminwidth=1 winwidth=1
argglobal
setlocal fdm=manual
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
silent! normal! zE
let s:l = 1 - ((0 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
