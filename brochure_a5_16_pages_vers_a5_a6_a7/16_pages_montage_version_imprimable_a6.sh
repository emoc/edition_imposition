#!/bin/bash
# ImageMagick 6.9.7-4 Q16 x86_64 20170114 / Debian Stretch 9.5 @ Kirin
# 20211110 / pierre @ lesporteslogiques.net / http://github.com/emoc

# séparation des pages et imposition pour impression d'un fichier pdf de 16 pages en A6 @ 300 DPI
# A4 paysage 3496x2480

# séparation du fichier pdf A4 en pages
convert -density 300 ./brochure_2021-2022.pdf p_%02d.png

# montage des feuillets
montage -geometry 1240x1748 -tile 2x2 p_15.png p_00.png \( p_08.png -rotate 180 \) \( p_07.png -rotate 180 \) lp1.png
montage -geometry 1240x1748 -tile 2x2 p_01.png p_14.png \( p_06.png -rotate 180 \) \( p_09.png -rotate 180 \) lp2.png
montage -geometry 1240x1748 -tile 2x2 p_13.png p_02.png \( p_10.png -rotate 180 \) \( p_05.png -rotate 180 \) lp3.png
montage -geometry 1240x1748 -tile 2x2 p_03.png p_12.png \( p_04.png -rotate 180 \) \( p_11.png -rotate 180 \) lp4.png

# assemblage du fichier pdf
convert -limit memory 1GB -limit map 1.5GB lp1.png lp2.png lp3.png lp4.png -density 300 -units pixelsperinch brochure_a_imprimer_a6.pdf

# effacer les fichiers temporaires
rm p_00.png p_01.png p_02.png p_03.png 
rm p_04.png p_05.png p_06.png p_07.png 
rm p_08.png p_09.png p_10.png p_11.png
rm p_12.png p_13.png p_14.png p_15.png

rm lp1.png lp2.png lp3.png lp4.png