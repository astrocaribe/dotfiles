#!/usr/bin/env bash
#Filename: vim-setup.sh

# The codeschool color scheme is will be installed for this env.
# Refer to http://astonj.com/tech/vim-for-ruby-rails-and-a-sexy-theme/ for more
# information.

# Define vim directory
# TODO: Change creation directories to ~/ (user root) for real world use!
vim_dir=~/.vim
vimrc_file=~/.vimrc

# Create vim directories
function create_directories() {
  echo "@--> Creating .vim directories..."

  mkdir $vim_dir $vim_dir/colors $vim_dir/temp
  return
}

# Download/install colorscheme
function install_colorscheme() {
  echo "@--> Downloading/unziping codeschool color scheme..."

  curl http://astonj.com/wp-content/uploads/2012/06/codeschool.vim2_.zip > $vim_dir/temp/codeschool.vim2_.zip
  unzip $vim_dir/temp/codeschool.vim2_.zip -d $vim_dir/temp/
  cp $vim_dir/temp/codeschool.vim $vim_dir/colors
  return
}

# Create .vimrc with given heredoc
function create_vim_config() {
  echo "@--> Setting vim config..."

	cat <<- _EOF_ > $vimrc_file
	filetype plugin indent on
	syntax on
	set number

	color codeschool
	set guifont=Monaco:h12
	let g:NERDTreeWinPos = "right"
	set guioptions-=T
	set guioptions-=r
	set go-=L
	autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>"
	:set cpoptions+=$
	_EOF_

  return
}

# Remove temp directory
function cleanup() {
	echo "@--> Cleaning up..."

	rm -rf $vim_dir/temp

	return
}

# Main
echo
echo "-------------- Vim editor settings/colorscheme --------------"
echo "@> Installing customized Vim environment..."

create_directories								# Create vim directories
install_colorscheme								# Download/install colorscheme
create_vim_config									# Create .vimrc with given heredoc
cleanup														# Remove temp directory

echo "@> Done!"
