#!/bin/bash

normal_fg=$(tput sgr0)
error_fg=$(tput setaf 197)

if [[ ! "$(command -v code)" ]]; then
  echo ''
  echo "${error_fg}[ERROR] 'code' command does not exists!${normal_fg}"
  echo "${error_fg}[ERROR] Please visit:${normal_fg} https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line"
  echo ''
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
  wmaurer.change-case
  oderwat.indent-rainbow
  xadillax.viml
)

for i in "${pkglist[@]}"; do
  code --install-extension "${i}"
done
