" ===
" === for 循环
" ===

let c = 0
for i in [1, 2, 3, 4]
	let c += i
endfor
echo c


" ===
" === while 循环
" ===
let c = 1
let total = 0
while c <= 4
	let total += c
	let c += 1
endwhile
echo total
