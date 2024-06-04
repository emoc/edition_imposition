#!/bin/bash
# ImageMagick 6.9.7-4 Q16 x86_64 20170114 / Debian Stretch 9.5 @ Kirin
# 20240603 / pierre @ lesporteslogiques.net / http://github.com/emoc

# monter une brochure imprimable sur feuillets A4 de 12 pages A5 @ 150 dpi, orientation portrait
# 14.85 x 21 cm @ 150 DPI : 874 x 1240 pixels
# impression : recto-verso, bord courts, sans adaptation


# montage des feuillets
montage p_12.png p_01.png -geometry 874x1240+0+0 -tile 2x1 f_a_ro.png
montage p_02.png p_11.png -geometry 874x1240+0+0 -tile 2x1 f_a_vo.png
montage p_10.png p_03.png -geometry 874x1240+0+0 -tile 2x1 f_b_ro.png
montage p_04.png p_09.png -geometry 874x1240+0+0 -tile 2x1 f_b_vo.png
montage p_08.png p_05.png -geometry 874x1240+0+0 -tile 2x1 f_c_ro.png
montage p_06.png p_07.png -geometry 874x1240+0+0 -tile 2x1 f_c_vo.png


# assemblage du fichier pdf
convert f_a_ro.png f_a_vo.png f_b_ro.png f_b_vo.png f_c_ro.png f_c_vo.png -units pixelsperinch -density 150 brochure.pdf


# effacer les fichiers temporaires
# rm p_01.png p_02.png p_03.png p_04.png p_05.png p_06.png 
# rm p_07.png p_08.png p_09.png p_10.png p_11.png p_12.png
# rm f_a_ro.png f_a_vo.png f_b_ro.png f_b_vo.png f_c_ro.png f_c_vo.png