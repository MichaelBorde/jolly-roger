function episode__chemin_soustitre() {
  local chemin_episode=$1
  echo "${chemin_episode%\.*}.srt"
}

function episode__correspondent() {
  local nom_episode=${1##*/}
  local nom_soustitre=${2##*/}
  [[ "${nom_episode%\.*}" == "${nom_soustitre%\.*}" ]]
}