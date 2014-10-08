source "sources/episode.sh"

function le_chemin_du_st_est_le_meme_que_l_episode_a_lextension_pres() {
  local episode="chemin/episode-s1e2.avi"

  local soustitre="$(episode__chemin_soustitre "${episode}")"

  assertion__equal "chemin/episode-s1e2.srt" "${soustitre}"
}

function un_st_correspond_a_un_episode_sil_a_le_meme_nom() {
  assertion__successful \
    episode__correspondent "episode-s1e2.avi" "episode-s1e2.srt"
}

function un_st_peut_correspondre_a_un_episode_dans_un_autre_repertoire() {
  assertion__successful \
    episode__correspondent "episode/episode-s1e2.avi" "st/episode-s1e2.srt"
}

function un_st_correspond_a_un_episode_sil_a_le_meme_numero_depisode() {
  assertion__successful \
    episode__correspondent "episode-s1e2.avi" "episode-s1x2.srt"
}

function un_st_peut_correspondre_a_un_episode_au_format_tres_different() {
  assertion__successful \
    episode__correspondent "episode-s1e2.avi" "mon.episode.01e02.hi.srt"
}

function un_st_qui_na_rien_a_voir_ne_correspond_pas_a_un_episode() {
  assertion__failing \
    episode__correspondent "episode-s1e2.avi" "episode-s1e10.srt"
}