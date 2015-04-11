episode__soustitre_final() {
  local chemin_episode=$1
  echo "${chemin_episode%\.*}.srt"
}

episode__correspondent() {
  local numero_episode="$(_numero_episode_depuis_fichier "$1")"
  local numero_soustitre="$(_numero_episode_depuis_fichier "$2")"
  [[ "${numero_episode}" == "${numero_soustitre}" ]]
}

_numero_episode_depuis_fichier() {
  echo "$1" \
    | grep -o "[0-9]\{1,\}[^0-9][0-9]\{1,\}" \
    | sed "s/0*\([0-9]*\)[^0-9]0*\([0-9]*\)/\1e\2/"
}
