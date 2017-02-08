#!/usr/bin/env bash
#Filename: vim-setup.sh

# The codeschool color scheme is will be installed for this env.
# Refer to http://astonj.com/tech/vim-for-ruby-rails-and-a-sexy-theme/ for more
# information.

# Define vim directory
# TODO: Change creation directories to ~/ (user root) for real world use!
VIM_DIR=./.vim
VIM_RC=./.vimrc

# Create vim directories
function create_directories() {
  echo "@--> Creating .vim directories..."

  mkdir $VIM_DIR $VIM_DIR/colors $VIM_DIR/temp
  return
}

# Download/install colorscheme
function install_colorscheme() {
  echo "@--> Downloading/unziping codeschool color scheme..."

  curl http://astonj.com/wp-content/uploads/2012/06/codeschool.vim2_.zip > $VIM_DIR/temp/codeschool.vim2_.zip
  unzip $VIM_DIR/temp/codeschool.vim2_.zip -d $VIM_DIR/temp/
  cp $VIM_DIR/temp/codeschool.vim $VIM_DIR/colors
  return
}

# Create .vimrc with given heredoc
function create_vim_config() {
  echo "@--> Setting vim config..."

	cat <<- _EOF_ > $VIM_RC
	filetype plugin indent on
	syntax on
	set number

	color codeschool
	set guifont=Monaco:h12
	let g:NERDTreeWinPos = "right"
	set guioptions-=T # Removes top toolbar
	set guioptions-=r # Removes right hand scroll bar
	set go-=L # Removes left hand scroll bar
	autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" # displays <% %> correctly
	:set cpoptions+=$ # puts a $ marker for the end of words/lines in cw/c$ commandsa
	_EOF_

  return
}

# Remove temp directory
function cleanup() {
	echo "@--> Cleaning up..."

	rm -rf $VIM_DIR/temp

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
