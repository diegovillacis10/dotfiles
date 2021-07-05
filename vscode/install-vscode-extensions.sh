#!/bin/bash

if [[ ! "$(command -v code)" ]]; then
  normal_fg=$(tput sgr0)
  error_fg=$(tput setaf 197)

  echo ''
  echo "${error_fg}[ERROR] 'code' command does not exists!${normal_fg}"
  echo "${error_fg}[ERROR] Please visit:${normal_fg} https://code.visualstudio.com/docs/setup/mac#_launching-from-the-command-line"
  echo ''
  exit 1;
fi

pkglist=(
  aaron-bond.better-comments
  bengreenier.vscode-node-readme
  carbonid1.emmet-jss
  ChakrounAnas.turbo-console-log
  christian-kohler.npm-intellisense
  christian-kohler.path-intellisense
  CoenraadS.bracket-pair-colorizer
  dbaeumer.vscode-eslint
  dsznajder.es7-react-js-snippets
  eamodio.gitlens
  esbenp.prettier-vscode
  kisstkondoros.vscode-gutter-preview
  mechatroner.rainbow-csv
  ms-azuretools.vscode-docker
  ms-vscode-remote.remote-containers
  naumovs.color-highlight
  oderwat.indent-rainbow
  patbenatar.advanced-new-file
  pflannery.vscode-versionlens
  PKief.material-icon-theme
  pranaygp.vscode-css-peek
  sleistner.vscode-fileutils
  techer.open-in-browser
  vscodevim.vim
  wix.vscode-import-cost
  wmaurer.change-case
  XadillaX.viml
  yzhang.markdown-all-in-one
)

for pkg in "${pkglist[@]}"; do
  code --install-extension "${pkg}"
done
