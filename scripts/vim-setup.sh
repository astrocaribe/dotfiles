#!/usr/bin/env bash
#Filename: vim-setup.sh

# The codeschool color scheme is will be installed for this env.
# Refer to http://astonj.com/tech/vim-for-ruby-rails-and-a-sexy-theme/ for more
# information.

# Define vim directory
vim_dir=./.vim
vim_config=./.vimrc

echo "Installing customized vim environment..."

echo "  Creating .vim directory..."
# TODO: Change creation directories to ~/ (user root)
mkdir $vim_dir $vim_dir/colors $vim_dir/temp

echo "  Downloading/unziping codeschool color scheme..."
curl http://astonj.com/wp-content/uploads/2012/06/codeschool.vim2_.zip > $vim_dir/temp/codeschool.vim2_.zip
unzip $vim_dir/temp/codeschool.vim2_.zip -d $vim_dir/temp/
cp $vim_dir/temp/codeschool.vim $vim_dir/colors

echo "  Setting vim config..."
vim_config=./.vimrc
/bin/cat << _EOF_ > $vim_config
syntax on
set number

color codeschool
set guifont=Monaco:h12
let g:NERDTreeWinPos = "right"
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar
autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly
:set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commandsa
_EOF_

# Cleanup
echo "Cleaning up..."
rm -rf $vim_dir/temp

echo "Done!"
