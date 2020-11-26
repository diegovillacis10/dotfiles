#!/bin/bash

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
  dbaeumer.vscode-eslint
  esbenp.prettier-vscode
  kisstkondoros.vscode-gutter-preview
  vscodevim.vim
  chakrounanas.turbo-console-log
  yzhang.markdown-all-in-one
  dsznajder.es7-react-js-snippets
  christian-kohler.path-intellisense
  christian-kohler.npm-intellisense
  pflannery.vscode-versionlens
  bengreenier.vscode-node-readme
  wix.vscode-import-cost
  xadillax.viml
)

for i in "${pkglist[@]}"; do
  code --install-extension "${i}"
done
