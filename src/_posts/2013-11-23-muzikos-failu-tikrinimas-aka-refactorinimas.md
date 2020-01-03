---
title: Muzikos failų tikrinimas
category: atviras-kodas
image: i/muzikiniai_failai.jpeg
description: Muzikos failų perklausimas ir valymas. Naudinga turėti tik klausomą muziką!
---

Jau esu [rašęs straipsnį](/atviras-kodas/randame-vienodus-failus-su-bash) apie savo nekuklią muzikos galeriją. Tai štai dar vienas! Šį kartą bėda kitokia. Po praėjusio straipsnio jau turiu švarią galeriją - be jokių pasikartojančių dainų. Deja, ne visa muzika yra klausoma - dažnai tenka paspausti mygtuką „kita daina“.Kad to nebūtų, nusprendžiau pasirašyti labai paprastą programėlę su bash, kuri paleistų visas dainas po vieną einamąjame kataloge. Dainų grojimo metu galėčiau nuspręsti dainos likimą: jeigu išklausau ją iki galo - vadinasi daina patinka ir šalinti jos nereikia. Priešingu atveju - keliauja į šiukšlių dėžę.Nepasakosiu kaip ją pasirašyti, nes kiekvienas turintis šią bėdą ją spręstu kitaip. Štai mano variantas:    #!/bin/bash
    SAVEIFS=$IFS
    IFS=$(echo -en "\n\b")
    for f in ./*
    do
        if [ -f "$f" ]
        then
            mplayer -really-quiet "$f"
            if [ $? -eq 0 ]
            then
                echo "OK"
            else
                mv "$f" ~/Muzika/Trash/
                echo "Moved to ~/Muzika/Trash/$f"
            fi
        fi
    done
    IFS=$SAVEIFSJeigu nuspręsite pasinaudoti šia programėle tai verta išsiaiškinti ką ir kaip ji daro.Pirmiausiai į akį kris \$IFS kintamasis. Jeigu mėginsite tiesiog naudoti sintaksę for file in \$(ls) tai susidursite su bėda, kad kiekvienas žodis bus traktuojamas kaip failas. Taip yra dėl šio magiško Internal File Separator kintamojo bash kalboje. Labai sunku paaiškinti šį kintamąjį (bent jau man), čia Jums padės [šie atsakymai](http://stackoverflow.com/questions/4128235/bash-shell-scripting-what-is-the-exact-meaning-of-ifs-n).Kaip matote, muziką leidžiame per mplayer programą. Galima leisti per bet kurią, kuri tik pagrojus dainai grąžina teisingą rezultatą: 0 - kai daina pagrota, 1 - kai įvyko klaida ją grojant (pvz. klausytojas nutraukė grojimą). O aš mplayer myliu už tai, kad:-   Galiu neišklausęs dainos paspausti ENTER klavišą - komandos rezultatas bus 0.
-   Galiu išklausyti visą dainą - komandas rezultatas bus 0.
-   Galiu nutraukti dainą paspaudęs CTRL+C - komandos rezultatas bus 1.Pagal vėliau esančią sąlygą (išraiška \$? reiškia buvusios komandos išeities rezultatą - 1 (vienetą) arba 0 (nulį)) galiu nuspręsti grojamo failo likimą. Kodėl netrinu failų? Nes kas būtų jeigu pašalinčiau jį netyčia?Šio paprasto skriptuko pagalba perėjau per visą muziką ir pasišalinau ko nereikia. Tikiuosi kam nors tai bus naudinga.
