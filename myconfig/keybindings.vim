map <ESc> :wa <enter>
inoremap <c-bs> <c-w>
nnoremap <f2> :wa <bar> :!gcc -o %:r % -std=c99 -Wall && ./%:r<enter>
nnoremap <f3> :wa <bar> :!g++ -o %:r % -Wall -std=c++17 && ./%:r <enter>
"nnoremap <f3> :wa <bar> :!g++ -o %:r % -Wall -std=c++20 <enter>
nnoremap <f4> :wa <bar> :!python3 % <enter>
nnoremap <f5> :wa <bar> :!make <enter>
nnoremap <f6> :wa <bar> :!javac % && java %:r <enter>
nnoremap <f10> :wa <bar> :!javac --module-path $PATH_TO_FX --add-modules=javafx.controls % && java %:r <enter>
nnoremap <f7> :wa <bar> :!mingw32-make <enter>
nnoremap <f8> :wa <bar> :!lua ./% <enter>
nnoremap <f9> :wa <bar> :!kotlinc % -include-runtime -d %:r.jar && java -jar %:r.jar<enter>
nnoremap <nowait> <space>f  :find
nnoremap <space>n  :cn <enter>
nnoremap <space>p  :cp <enter>
"nnoremap <f5> :!make -C ..\<enter>
map <F12> :qa! <enter>

