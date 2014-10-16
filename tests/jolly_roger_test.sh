function setup() {
  EPISODES="$(mktemp -d /tmp/episodes_XXX)"
  SOUSTITRES="$(mktemp -d /tmp/soustitres_XXX)"
}

function teardown() {
  trash "${EPISODES}" "${SOUSTITRES}"
}

function copie_un_soustitre_qui_correspond_a_un_episode() {
  touch "${EPISODES}/ma.serie.s01e01.avi"
  touch "${SOUSTITRES}/ma.serie.s01e01.srt"

  ./sources/jolly_roger "${EPISODES}" "${SOUSTITRES}"

  assertion__successful _fichier_existe "${EPISODES}/ma.serie.s01e01.srt"
}

function ne_copie_pas_un_soustitre_qui_na_rien_a_voir() {
  touch "${EPISODES}/ma.serie.s01e01.avi"
  touch "${SOUSTITRES}/ma.serie.s03e07.srt"

  ./sources/jolly_roger "${EPISODES}" "${SOUSTITRES}"

  assertion__failing _fichier_existe "${EPISODES}/ma.serie.s03e07.srt"
}

function peut_satisfaire_le_test_du_readme() {
  touch "${EPISODES}/ma.serie.s1e1.avi"
  touch "${EPISODES}/ma.serie.s1e2.avi"
  touch "${EPISODES}/ma.serie.s1e3.avi"

  touch "${SOUSTITRES}/ma.serie.s1x1.srt"
  touch "${SOUSTITRES}/ma-super-serie-s01e02-trop-bien.srt"
  touch "${SOUSTITRES}/ma.serie.s1e5.srt"

  ./sources/jolly_roger "${EPISODES}" "${SOUSTITRES}"

  assertion__successful _fichier_existe "${EPISODES}/ma.serie.s1e1.srt"
  assertion__successful _fichier_existe "${EPISODES}/ma.serie.s1e2.srt"
  assertion__failing _fichier_existe "${EPISODES}/ma.serie.s1e5.srt"
}

function _fichier_existe(){
  [[ -e "$1" ]]
}