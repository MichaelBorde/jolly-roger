source sources/episode.sh

function un_soustitre_et_un_episode_de_meme_nom_correspondent() {
  assertion__successful \
    episode__correspondent "ma.serie.s1e2.srt" "ma.serie.s1e2.avi"
}

function un_soustitre_peut_correspondre_quimporte_son_chemin() {
  assertion__successful \
    episode__correspondent "1/2/ma.serie.s1e2.srt" "a/ma.serie.s1e2.avi"
}

function un_soustitre_peut_correspondre_quimporte_son_format() {
  assertion__successful \
    episode__correspondent "ma.serie.s1e2.srt" "ma.serie.1x2.super.hd.avi"
assertion__successful \
    episode__correspondent "ma.serie.s001e02.srt" "ma.serie.1x2.super.hd.avi"
}

function un_soustitre_peut_ne_pas_correspondre() {
  assertion__failing \
    episode__correspondent "ma.serie.s1e3.srt" "ma.serie.s1e2.avi"
}

function le_soustitre_final_est_le_meme_que_lepisode_a_lextension_pres() {
  local episode="ma.serie.s02e03.avi"

  local soustitre="$(episode__soustitre_final "${episode}")"

  assertion__equal "ma.serie.s02e03.srt" "${soustitre}"
}

