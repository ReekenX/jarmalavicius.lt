---
title: Komandų lygiagretus paleidimas su GNU Parallel
category: atviras-kodas
image: i/lygiagretus-darbas/komandu-lygiagretus-paleidimas-su-gnu-parallel.png
description: Komandų lygiagretus paleidimas su GNU Parallel. Taupykite operacijų laiką išmokę naudotis. Su praktiniais pavyzdžiais.
---

Ypatingai dažnai tenka susidurti su komandų gausa kurios trunka ilgai, tačiau nėra galimybių išnaudoti kelių procesorių vienu metu.

Į pagalbą kviečiam [GNU Parallel](http://www.gnu.org/software/parallel/) kuris komandas padės paleisti lygiagrečiai. Nors oficialioje dokumentacijoje rasite gausybę panaudojimo pavyzdžių - praktikoje užteks greičiausiai žinoti tik kelis panaudojimo būdus.

Pirmiausiai įdiekime `GNU Parallel` (Debian paremtose sistemose):

    apt-get install parallel

Viena iš vykdymo sintaksių `GNU Parallel` yra gana neįprasta palyginus ką tenka matyti kitose komandose:

    parallel komanda ::: [argumentas1] [argumentas2] [..]

Išsibandykime:

    parallel sleep ::: 3 2 4

Toks aprašas reikštų, kad vykdysime tokias komandas:

    sleep 3
    sleep 2
    sleep 4

Visas vykdymo laikas nuosekliai truktų 3 + 2 + 4 = 9 sekundes. Su `GNU Parallel` komandos būtų pavykdytos lygiagrečiai, taigi, užtruktų šiek tiek ilgiau nei 4 sekundes.

`GNU Parallel` leidžia komandas apsirašyti ir ne su vienu argumentu. Tokiu atveju sintaksė būtų tokia:

    parallel komanda ::: argumentas1-1 argumentas1-2 ::: argumentas2-1 argumentas 2-2 [..]

Pavyzdžiui:

    parallel echo ::: 0 1 ::: 0 1

Galima tikėtis, kad bus pavykdytos tokios komandos:

    echo 0 1
    echo 0 1

Tačiau iš tikrųjų, `GNU Parallel` pavykdys komandas su argumentų kombinacijomis, taigi, išvesties rezultatas gausis toks:

    0 0
    0 1
    1 0
    1 1

Kitame straipsnyje parodysiu kaip vykdyti komandas iš tekstinio failo ir daugiau pavyzdžių iš tikro gyvenimo (prie kompiuterio) situacijų.
