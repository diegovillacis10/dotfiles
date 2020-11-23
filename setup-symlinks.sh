CURRENT_DIR=$(cd `dirname $0` && pwd)
# TODO Save old dotfiles in backup dir.

# Dotfiles symlinks
ln -sv ${CURRENT_DIR}/dotfiles/vimrc ~/.vimrc
ln -sv ${CURRENT_DIR}/dotfiles/zshrc ~/.zshrc
ln -sv ${CURRENT_DIR}/dotfiles/tmux.conf ~/.tmux.conf
ln -sv ${CURRENT_DIR}/dotfiles/Brewfile ~/Brewfile
ln -sv ${CURRENT_DIR}/dotfiles/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -sv ${CURRENT_DIR}/dotfiles/vscode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json

# TODO symlink not woriking for .zsh and .secrets dirs.
# if [[ -d "${HOME}/.secrets" ]]; then
#     ln -sv "${CURRENT_DIR}/dotfiles/secrets/* ~/.secrets/"
# else
#     mkdir -p ${HOME}/.secrets
#     ln -sv "${CURRENT_DIR}/dotfiles/secrets/* ~/.secrets/"
# fi
# if [[ -d "${HOME}/.zsh" ]]; then
#     ln -sv "${CURRENT_DIR}/dotfiles/zsh/* ~/.zsh/"
# else
#     mkdir -p ${HOME}/.zsh
#     ln -sv "${CURRENT_DIR}/dotfiles/zsh/* ~/.zsh/"
# fi
