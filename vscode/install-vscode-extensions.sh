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
  arcticicestudio.nord-visual-studio-code
  bengreenier.vscode-node-readme
  carbonid1.emmet-jss
  castwide.solargraph
  ChakrounAnas.turbo-console-log
  christian-kohler.npm-intellisense
  christian-kohler.path-intellisense
  dbaeumer.vscode-eslint
  dsznajder.es7-react-js-snippets
  eamodio.gitlens
  EditorConfig.EditorConfig
  equinusocio.vsc-material-theme-icons
  esbenp.prettier-vscode
  formulahendry.auto-rename-tag
  johnpapa.vscode-peacock
  jpoissonnier.vscode-styled-components
  kisstkondoros.vscode-gutter-preview
  mechatroner.rainbow-csv
  mikestead.dotenv
  ms-azuretools.vscode-docker
  ms-vsliveshare.vsliveshare
  ms-vsliveshare.vsliveshare-audio
  ms-vsliveshare.vsliveshare-pack
  naumovs.color-highlight
  oderwat.indent-rainbow
  patbenatar.advanced-new-file
  pflannery.vscode-versionlens
  PKief.material-icon-theme
  pnp.polacode
  pranaygp.vscode-css-peek
  ritwickdey.LiveServer
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
