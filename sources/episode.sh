function episode__chemin_soustitre() {
  local chemin_episode=$1
  echo "${chemin_episode%\.*}.srt"
}

function episode__correspondent() {
  local numero_episode="$(_numero_episode_depuis_nom_fichier "$1")"
  local numero_soustitre="$(_numero_episode_depuis_nom_fichier "$2")"
  [[ "${numero_episode}" == "${numero_soustitre}" ]]
}

function _numero_episode_depuis_nom_fichier() {
  echo "$1" | sed "s/.*\([0-9]\)\{1,2\}.\([0-9]\)\{1,2\}.*/\1e\2/"
}