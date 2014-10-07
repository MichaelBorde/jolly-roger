# Jolly Roger

Programme Bash qui permet d'associer des soustitres aux épisodes d'une série correspondant.

C'est un exercice simple pour découvrir TDD en Bash.

L'api de test automatisés est [shebang_unit].

## L'énoncé

En tant que pirate fainéant mais malin, je souhaite pouvoir rassembler les soustitres et les épisodes d'une série, en faisant fit des fantaisies de nommage pour être compatible avec mon lecteur vidéo, le tout pour gagner un temps fou.

## Test d'acceptation

Etant donné un répertoire d'épisodes contenant :
* ma.serie.s1e1.avi
* ma.serie.s1e2.avi
* ma.serie.s1e3.avi

Ainsi qu'un répertoire de soustitres contenant :
* ma.serie.s1x1.srt
* ma-super-serie-s01e02-trop-bien.srt
* ma.serie.s1e5.srt

Après appel du programme j'obtiens le répertoire consolidés suivant :
* ma.serie.s1e1.avi
* ma.serie.s1e1.srt
* ma.serie.s1e2.avi
* ma.serie.s1e2.srt
* ma.serie.s1e3.avi

## Notes

L'exhaustivité sur les extensions de vidéo ou de soustitre, la profondeur des répertoires et bien d'autres simplifications peuvent être faites à but pédagogique.

[shebang_unit]: https://github.com/arpinum/shebang_unit