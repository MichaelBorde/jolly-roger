# Jolly Roger

Programme Bash qui permet d'associer des soustitres aux épisodes de série correspondant.

C'est un exercice simple pour découvrir TDD en Bash.

L'api de test automatisés est [shebang_unit].

## Test d'acceptation

Etant donné un répertoire d'épisodes contenant :
* ma.serie.s1e1.avi
* ma.serie.s1e2.avi
* ma.serie.s1e3.avi

Ainsi qu'un répertoire de soustitres contenant :
* ma.serie.s1x1.avi
* ma-super-serie-s01e02-trop-bien.avi
* ma.serie.s1e5.avi

Après appel du programme j'obtiens le répertoire consolidés suivant :
* ma.serie.s1e1.avi
* ma.serie.s1e1.srt
* ma.serie.s1e2.avi
* ma.serie.s1e2.srt
* ma.serie.s1e3.avi


[shebang_unit]: https://github.com/arpinum/shebang_unit