#!/bin/bash
# ImageMagick 6.9.7-4 Q16 x86_64 20170114 / Debian Stretch 9.5 @ Kirin
# 20211110 / pierre @ lesporteslogiques.net / http://github.com/emoc

# Préparation d'un fichier pdf de 16 pages
# avec une imposition en A7, 300 DPI (1 feuillet recto-verso)
# /!\ la numérotation des pages commence à 0

# séparation du fichier pdf en pages
convert -density 300 ./brochure_2021-2022.pdf p_%02d.png

# montage des feuillets
montage -geometry 874x1240 -tile 4x2 \( p_04.png -rotate 180 \) \( p_11.png -rotate 180 \) \( p_08.png -rotate 180 \) \( p_07.png -rotate 180 \) p_03.png p_12.png p_15.png p_00.png lp1.png
montage -geometry 874x1240 -tile 4x2 \( p_06.png -rotate 180 \) \( p_09.png -rotate 180 \) \( p_10.png -rotate 180 \) \( p_05.png -rotate 180 \) p_01.png p_14.png p_13.png p_02.png lp2.png

# assemblage du fichier pdf
convert -limit memory 1GB -limit map 1.5GB lp1.png lp2.png -density 300 -units pixelsperinch brochure_a_imprimer_a7.pdf

# effacer les fichiers temporaires
rm p_00.png p_01.png p_02.png p_03.png 
rm p_04.png p_05.png p_06.png p_07.png 
rm p_08.png p_09.png p_10.png p_11.png
rm p_12.png p_13.png p_14.png p_15.png

rm lp1.png lp2.png