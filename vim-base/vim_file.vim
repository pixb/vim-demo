" 输出当前文件的文件名
echo expand('%')
" 输出当前文件的完整绝对路径名
echo expand('%:p')
" 输出当前文件夹下foo.txt的绝对路径,无论文件是否存在都能输出
echo fnamemodify('foo.txt', ':p')
" 去掉最后的部分
echo fnamemodify('vim_file.vim', ':p:h')

" 输出当前文件夹下的文件列表
echo globpath('.', '*')
" 列表输出
echo split(globpath('.', '*'))
echo split(globpath('.', '*.vim'))
" 递归列出文件
echo split(globpath('.', '**'))

