function setup() {
  TMP="/tmp/${RANDOM}"
  mkdir -p "${TMP}"
}

function teardown() {
  rm -rf "${TMP}"
}

function peut_copier_un_soustitre_avec_le_meme_nom_qu_un_episode() {
  cp -a tests/un_episode_et_son_soustitre/* "${TMP}"

  ./sources/jolly_roger "${TMP}/episodes" "${TMP}/soustitres"

  assertion__successful _fichier_existe "${TMP}/episodes/ma.serie.s01e01.srt"
}

function ne_copie_pas_un_soustitre_qui_n_a_rien_a_voir() {
  cp -a tests/un_episode_et_un_autre_soustitre/* "${TMP}"

  ./sources/jolly_roger "${TMP}/episodes" "${TMP}/soustitres"

  assertion__failing _fichier_existe "${TMP}/episodes/ma.serie.s01e02.srt"
}

function _fichier_existe() {
  [[ -e "$1" ]]
}