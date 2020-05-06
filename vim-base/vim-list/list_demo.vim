" list 
echo ['foo', 3, 'bar']

" list嵌套
echo ['foo', [3, 'bar']]

" 索引
echo [0, 1, 2][0]

" 负索引
echo [0, 1, 2][-2]

" 切割前三个元素
echo ['a', 'b', 'c', 'd', 'e', 'f'][0:2]

" 连接列表
echo ['a', 'b'] + ['c']

" ===
" === 列表函数
" ===

" 添加元素
let foo = ['a', 'b']
call add(foo, 'c')
echo foo

" 列表长度
echo len(foo)

" 取得元素
echo get(foo, 0, 'default')
echo get(foo, 1000, 'default')

" 查询索引
echo index(foo, 'a')
echo index(foo, 'z')

" 转换为字符串
echo join(foo)
echo join(foo, '-----')
echo join([1, 2, 3], '')

" 反转字符串
call reverse(foo)
echo foo
call reverse(foo)
echo foo
