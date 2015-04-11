setup() {
  EPISODES="$(mktemp -d /tmp/episodes_XXXX)"
  SOUSTITRES="$(mktemp -d /tmp/soustitres_XXXX)"
}

teardown() {
  trash -rf "${EPISODES}" "${SOUSTITRES}"
}

peut_copier_un_soustitre_avec_le_meme_nom_qu_un_episode() {
  touch "${EPISODES}/ma.serie.s01e01.avi"
  touch "${SOUSTITRES}/ma.serie.s01e01.srt"

  ./sources/jollyroger "${EPISODES}" "${SOUSTITRES}"

  assertion__successful _fichier_existe "${EPISODES}/ma.serie.s01e01.srt"
}

ne_copie_pas_un_soustitre_qui_n_a_rien_a_voir() {
  touch "${EPISODES}/ma.serie.s01e01.avi"
  touch "${SOUSTITRES}/ma.serie.s01e02.srt"

  ./sources/jollyroger "${EPISODES}" "${SOUSTITRES}"

  assertion__failing _fichier_existe "${EPISODES}/ma.serie.s01e02.srt"
}

satisfait_le_test_dacceptation_du_readme() {
  touch "${EPISODES}/ma.serie.s1e1.avi"
  touch "${EPISODES}/ma.serie.s1e2.avi"
  touch "${EPISODES}/ma.serie.s1e3.avi"
  touch "${SOUSTITRES}/ma.serie.s1x1.srt"
  touch "${SOUSTITRES}/ma-super-serie-s01e02-trop-bien.srt"
  touch "${SOUSTITRES}/ma.serie.s1e5.srt"

  ./sources/jollyroger "${EPISODES}" "${SOUSTITRES}"

  assertion__successful _fichier_existe "${EPISODES}/ma.serie.s1e1.avi"
  assertion__successful _fichier_existe "${EPISODES}/ma.serie.s1e1.srt"
  assertion__successful _fichier_existe "${EPISODES}/ma.serie.s1e2.avi"
  assertion__successful _fichier_existe "${EPISODES}/ma.serie.s1e2.srt"
  assertion__successful _fichier_existe "${EPISODES}/ma.serie.s1e3.avi"
  assertion__equal 5 "$(_nombre_fichiers "${EPISODES}")"
}

_fichier_existe() {
  [[ -e "$1" ]]
}

_nombre_fichiers() {
  find "$1" -name "*.*" | wc -l | tr -d ' '
}
