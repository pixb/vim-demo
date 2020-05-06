" ===
" === 字典测试
" ===
echo {'a':1, 100: 'foo'}

" 索引
echo {'a':1, 100: 'foo'}['a']
" 键会自动转换为字符串
echo {'a':1, 100: 'foo'}[100]
" 点查找方式
echo {'a':1, 100: 'foo'}.a
echo {'a':1, 100: 'foo'}.100

" 赋值和添加
let foo={'a':100}
let foo.a = 200
let foo.b = 300
echo foo

" 移除项
let bar = remove(foo, 'a')
unlet foo.b
echo bar
echo foo

" ===
" === 字典函数
" ===
" 取得元素
echo get({'a':100}, 'a', 'default')
echo get({'a':100}, 'b', 'default')
" 查看键是否存在
echo has_key({'a':100}, 'a')
echo has_key({'a':100}, 'b')
" 取得键值对
echo items({'a':100, 'b':200})
" 取得所有键，所有值
echo keys({'a':100, 'b':200})
echo values({'a':100, 'b':200})
" 取得长度
echo len({'a':100,'b':200})
