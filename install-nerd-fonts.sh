#! /bin/bash

_NERD_FONTS=('CascadiaCode' 'FiraCode' 'Hack' 'OpenDyslexic' 'SourceCodePro')

_NERD_FONTS_DIR="${HOME}"/.local/share/fonts/NerdFonts

if [[ -d ${_NERD_FONTS_DIR} ]]; then
  echo ""
  echo "🔡🔡🔡 Creating 🛠️ Nerd Fonts directory: ${_NERD_FONTS_DIR}"
  echo ""
  mkdir -p "${_NERD_FONTS_DIR}"
else
  echo ""
  echo "🔡🔡🔡 Cleaning 🧹 Nerd Fonts directory: ${_NERD_FONTS_DIR}"
  echo ""
  rm -rf "${_NERD_FONTS_DIR:?}"/*
fi

for font in "${_NERD_FONTS[@]}"; do
  echo ""
  echo "🔡🔡🔡 Installing Font: $font"
  echo ""
  curl -fsSLO "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${font}.tar.xz"
  tar xfv "${font}".tar.xz --directory="${_NERD_FONTS_DIR}"
  rm "${font}".tar.xz
done

fc-cache -fv

unset _NERD_FONTS
unset _NERD_FONTS_DIR

