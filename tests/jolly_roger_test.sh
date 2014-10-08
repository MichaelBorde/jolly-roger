function setup() {
  TMP="/tmp/${RANDOM}"
  EPISODES="${TMP}/episodes"
  SOUSTITRES="${TMP}/soustitres"
  mkdir -p "${EPISODES}"
  mkdir -p "${SOUSTITRES}"
}

function teardown() {
  rm -rf "${TMP}"
}

function peut_copier_un_soustitre_avec_le_meme_nom_qu_un_episode() {
  touch "${EPISODES}/ma.serie.s01e01.avi"
  touch "${SOUSTITRES}/ma.serie.s01e01.srt"

  ./sources/jolly_roger "${EPISODES}" "${SOUSTITRES}"

  assertion__successful _fichier_existe "${SOUSTITRES}/ma.serie.s01e01.srt"
}

function ne_copie_pas_un_soustitre_qui_n_a_rien_a_voir() {
  touch "${EPISODES}/ma.serie.s01e01.avi"
  touch "${SOUSTITRES}/ma.serie.s01e02.srt"

  ./sources/jolly_roger "${EPISODES}" "${SOUSTITRES}"

  assertion__failing _fichier_existe "${EPISODES}/ma.serie.s01e02.srt"
}

function _fichier_existe() {
  [[ -e "$1" ]]
}