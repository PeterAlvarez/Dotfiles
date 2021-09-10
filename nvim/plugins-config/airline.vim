"========================== AirLine ============================
let g:airline_theme = 'solarized_flood'
let g:airline#extensions#tabline#enabled = 0 "pestanias buffer
let g:airline#extensions#tabline#formatter = 'unique_tail'

let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '


"nmap<S-J> <Plug>AirlineSelectPrevTab zz
"nmap<S-K> <Plug>AirlineSelectNextTab zz

let g:airline_section_a = airline#section#create(['mode', ' ☰ ','%{&ff}',' ☰ ', '%{bufnr("%")}'])
let g:airline_section_z = "%p%% ☰ \ue0a1:%l/%L ☰ Col:%c"
let g:airline_section_c = airline#section#create(['%t'])
let g:airline_section_x = ''

let g:airline_powerline_fonts = 1
"let g:airline#extensions#battery#enabled = 1
