function episode__correspondent() {
  local nom_soustitre="${1##*/}"
  local nom_episode="${2##*/}"

  [[ "$(_numero "${nom_soustitre}")" == "$(_numero "${nom_episode}")" ]]
}

function _numero() {
  # ma.serie.s01e02.srt -> 01e02
  echo "$1" | sed "s/.*0*\([0-9]\{1,\}\)[^0-9]0*\([0-9]\{1,\}\).*/\1e\2/"
}

function episode__soustitre_final() {
  echo "${1%\.*}.srt"
}