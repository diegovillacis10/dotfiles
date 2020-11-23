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

# ctrlp.vim
if [[ ! -d "${HOME}/.vim/bundle/ctrlp.vim" ]]; then
    git clone https://github.com/kien/ctrlp.vim.git ~/.vim/bundle/ctrlp.vim
fi
