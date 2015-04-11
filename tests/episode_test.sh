source "sources/episode.sh"

un_soustitre_correspond_sil_a_le_meme_nom_que_lepisode() {
  assertion__successful \
    episode__correspondent "ma.serie.s01e04.avi" "ma.serie.s01e04.srt"
}

un_soustitre_peut_correspondre_quimporte_son_chemin() {
  assertion__successful \
    episode__correspondent "1/ma.serie.s01e04.avi" "a/b/c/ma.serie.s01e04.srt"
}

un_soustitre_peut_correspondre_quimporte_le_format_de_lepisode() {
  assertion__successful \
    episode__correspondent "ma.serie.s01e04.avi" "ma.serie.1x04.srt"
  assertion__successful \
    episode__correspondent "ma.serie.s01e04.avi" "ma.serie.1x4.srt"
  assertion__successful \
    episode__correspondent "ma.serie.s300e004.avi" "ma.serie.300x04.srt"
}

un_soustitre_peut_ne_pas_correspond_du_tout() {
  assertion__failing \
    episode__correspondent "ma.serie.s301e104.avi" "ma.serie.1e4.srt"
}

le_chemin_du_soustitre_final_est_le_meme_que_lepisode() {
  local episode="mes/episodes/ma.serie.s01e12.avi"

  local soustitre="$(episode__soustitre_final "${episode}")"

  assertion__equal "mes/episodes/ma.serie.s01e12.srt" "${soustitre}"
}
