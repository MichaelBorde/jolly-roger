source "sources/episode.sh"

function le_chemin_du_soustitre_est_le_meme_que_l_episode_a_lextension_pres() {
  local episode="chemin/episode-s1e2.avi"

  local soustitre="$(episode__chemin_soustitre "${episode}")"

  assertion__equal "chemin/episode-s1e2.srt" "${soustitre}"
}

function un_soustitre_correspond_a_un_episode_sil_a_le_meme_nom() {
  assertion__successful \
    episode__correspondent "episode-s1e2.avi" "episode-s1e2.srt"
}

function un_soustitre_peut_correspondre_a_lepisode_dun_autre_repertoire() {
  assertion__successful \
    episode__correspondent "episode/episode-s1e2.avi" "st/episode-s1e2.srt"
}

function _un_soustitre_correspond_a_un_episode_sil_a_le_meme_numero_depisode() {
  assertion__successful \
    episode__correspondent "episode-s1e2.avi" "episode-s1x2.srt"
}

function un_soustitre_qui_na_rien_a_voir_ne_correspond_pas_a_un_episode() {
  assertion__failing \
    episode__correspondent "episode-s1e2.avi" "episode-s1e10.srt"
}