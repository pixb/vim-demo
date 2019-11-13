#########################################################################
# File Name: install-dein.sh
# Author: pix
# mail: tpxsky@163.com
# Created Time: Tue 12 Nov 2019 11:24:03 PM CST
#########################################################################
#!/bin/bash

curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
# For example, we just use `~/.cache/dein` as installation directory
sh ./installer.sh ~/.cache/dein
