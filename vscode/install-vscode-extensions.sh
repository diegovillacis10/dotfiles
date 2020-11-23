# Visual Studio Code :: Package list

if [[ ! "$(command -v code)" ]]; then
  echo "[ERROR] 'code' command does not exists!"
  exit 1;
fi

pkglist=(
  aaron-bond.better-comments
  ms-azuretools.vscode-docker
  eamodio.gitlens
  pkief.material-icon-theme
  coenraads.bracket-pair-colorizer
  techer.open-in-browser
  pranaygp.vscode-css-peek
  # dbaeumer.vscode-eslint
  esbenp.prettier-vscode
  kisstkondoros.vscode-gutter-preview
  vscodevim.vim
  gruntfuggly.todo-tree
  shd101wyy.markdown-preview-enhanced
)

for i in ${pkglist[@]}; do
  code --install-extension $i
done
