function setup() {
  EPISODES="$(mktemp -d /tmp/episodes_XXXX)"
  SOUSTITRES="$(mktemp -d /tmp/soustitres_XXXX)"
}

function teardown() {
  rm -rf "${EPISODES}" "${SOUSTITRES}"
}

function peut_copier_un_soustitre_avec_le_meme_nom_qu_un_episode() {
  touch "${EPISODES}/ma.serie.s01e01.avi"
  touch "${SOUSTITRES}/ma.serie.s01e01.srt"

  ./sources/jolly_roger "${EPISODES}" "${SOUSTITRES}"

  assertion__successful _fichier_existe "${EPISODES}/ma.serie.s01e01.srt"
}

function ne_copie_pas_un_soustitre_qui_n_a_rien_a_voir() {
  touch "${EPISODES}/ma.serie.s01e01.avi"
  touch "${SOUSTITRES}/ma.serie.s01e02.srt"

  ./sources/jolly_roger "${EPISODES}" "${SOUSTITRES}"

  assertion__failing _fichier_existe "${EPISODES}/ma.serie.s01e02.srt"
}

function satisfait_le_test_dacceptation_du_readme() {
  touch "${EPISODES}/ma.serie.s1e1.avi"
  touch "${EPISODES}/ma.serie.s1e2.avi"
  touch "${EPISODES}/ma.serie.s1e3.avi"
  touch "${SOUSTITRES}/ma.serie.s1x1.srt"
  touch "${SOUSTITRES}/ma-super-serie-s01e02-trop-bien.srt"
  touch "${SOUSTITRES}/ma.serie.s1e5.srt"

  ./sources/jolly_roger "${EPISODES}" "${SOUSTITRES}"

  assertion__successful _fichier_existe "${EPISODES}/ma.serie.s1e1.avi"
  assertion__successful _fichier_existe "${EPISODES}/ma.serie.s1e1.srt"
  assertion__successful _fichier_existe "${EPISODES}/ma.serie.s1e2.avi"
  assertion__successful _fichier_existe "${EPISODES}/ma.serie.s1e2.srt"
  assertion__successful _fichier_existe "${EPISODES}/ma.serie.s1e3.avi"
  assertion__equal 5 "$(_nombre_fichiers "${EPISODES}")"
}

function _fichier_existe() {
  [[ -e "$1" ]]
}

function _nombre_fichiers() {
  find "$1" -name "*.*" | wc -l | tr -d ' '
}