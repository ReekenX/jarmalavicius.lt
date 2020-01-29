---
title: Nepraleiskite pakeitimų su GIT RIBBON
category: git
image: i/git_ribbon.jpg
description: Straipsnis apie GIT RIBBON programą pakeitimas sužiūrėti po tam tikro laiko.
---

Ir vėl grįžus iš atostogų tenka prisiminti prie ko dirbau, planuotis ką turėčiau
daryti toliau ir sužiūrėti kas gero nutiko ankščiau. Laimei, kalbant ne apie įmonės viduje esančius dalykus, o apie programavimo kodą - tą padaryti nėra sunku.

Tokiems kaip aš, kuriems smalsu kas per keletą atostogų savaičių pasikeitė, yra labai geras įrankis pavadinimu [git ribbon](https://github.com/kablamo/git-ribbon). Jis iš esmės išsprendžia keletą problemų:

* Norą peržiūrėti pakeitimus eilės tvarka kaip jie buvo įgyvendinti.
* Norą „pasivyti“ kitus kolegas projekto tobulinime.
* Patogesnę peržiūrą nei, tarkime, `git log` komanda.

Įdiegti nebus sunku:

    git clone https://github.com/kablamo/git-ribbon.git
    cd git-ribbon
    ln -s bin/git-ribbon /usr/local/bin/git-ribbon

Ir toliau naudosimės tokiu formatu:

    git ribbon [KOMANDA]

Veikimo principas paprastas - pasižymite vieną kartą vietą iki kurios žinote kas įvyko. Tą padaro komanda:

    git ribbon --save

Tuomet parsisiunčiame pakeitimus:

    git pull

Ir tikriname kas įvyko tame tarpe nuo pasižymėjimo iki dabartinių pakeitimų su:

    git ribbon

Peržiūrėjus vėl pažymime, kad iki šios vietos viskas peržiūrėta:

    git ribbon --save

Taigi, iš esmės grįžęs po atostogų, atlieku tokius veiksmus:

    git ribbon --save
    git up # arba git pull, kam patogiau
    git ribbon
    git ribbon --save

Tiesa, praverstų susikonfigūruoti savo `diff` redaktorių, kad peržiūra nebūtų
tokia sunki ir taupytų brangų laiką. Tai `.gitconfig` faile atrodytų taip:

    [diff]
        tool = vimdiff

Daugiau visokių „tipsų“ galima būtų rasti mano [asmeniniuose konfigūracijų failuose](https://github.com/ReekenX/dotfiles/blob/master/.gitconfig.d/merge.ini).
