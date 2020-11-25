# Install Pathogen
# https://github.com/tpope/vim-pathogen
if [[ ! -e "${HOME}/.vim/autoload/pathogen.vim" ]]; then
    mkdir -p ~/.vim/autoload ~/.vim/bundle && \
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
fi

# Install Vim plugins
# gruvbox
if [[ ! -d "${HOME}/.vim/bundle/gruvbox" ]]; then
    git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox
fi

# nerdtree
if [[ ! -d "${HOME}/.vim/bundle/nerdtree" ]]; then
    git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
fi

# vim-fugitive
if [[ ! -d "${HOME}/.vim/bundle/vim-fugitive" ]]; then
    git clone https://github.com/tpope/vim-fugitive ~/.vim/bundle/vim-fugitive
fi

# vim-buftabline
if [[ ! -d "${HOME}/.vim/bundle/vim-buftabline" ]]; then
    git clone https://github.com/ap/vim-buftabline ~/.vim/bundle/vim-buftabline
fi

# vim-gitgutter
if [[ ! -d "${HOME}/.vim/bundle/vim-gitgutter" ]]; then
    git clone https://github.com/airblade/vim-gitgutter ~/.vim/bundle/vim-gitgutter
fi

# vim-surround
if [[ ! -d "${HOME}/.vim/bundle/vim-surround" ]]; then
    git clone https://github.com/tpope/vim-surround ~/.vim/bundle/vim-surround
fi

# fzf.vim
if [[ ! -d "${HOME}/.vim/bundle/fzf.vim" ]]; then
    git clone https://github.com/junegunn/fzf.vim ~/.vim/bundle/fzf.vim
fi
