#!/bin/bash

# debian 9.5 Stretch + LXDE @ kirin 2022725
# Scribus 1.4.6 / ImageMagick 6.9.7-4 Q16 x86_64 20170114 / pdfjam 2.0.8

# prendre le fichier flyer-verso.pdf exporté depuis scribus (A5 :/ )
# le transformer en fichier png @ 300dpi
convert -density 300 flyer-verso.pdf flyer-verso.png

# le monter sous forme 2x2 pour imprimer sur un A4
montage flyer-verso.png flyer-verso.png flyer-verso.png flyer-verso.png -tile 2x2 -geometry 1748x2480 flyer_montage.png

# transformer en pdf
convert flyer_montage.png -density 300 -units pixelsperinch flyer_montage.pdf

# adapter le format en A4 avec pdfjam
pdfjam --paper a4paper --outfile flyer_montage_A4.pdf flyer_montage.pdf

# effacer les fichiers temporaires
rm flyer_montage.png
rm flyer_montage.pdf
