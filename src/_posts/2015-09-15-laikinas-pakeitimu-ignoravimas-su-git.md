---
title: Laikinas pakeitimų ignoravimas su GIT
category: git
image: i/placeholder.jpg
description: Reikia pakeisti kažkokį failą repozitorijoje, bet nenorite netyčia jo sukomitinti? Apie tokią darbo eigą - šiame straipsnyje.
---

Baisu būna, kai atviro kodo projektai turi kažkokį konfigūracinį failą išsaugotą repozitorijoje ir kurį būtinai reikia pasikeisti pagal savo poreikius. Aišku, projektai tobulėja ir anksčiau ar vėliau atsiranda „lokalių konfigūracinių failų“ palaikymas.

O ką daryti kai jų nėra? Paprasta - GIT leidžia mums laikinai ignoruoti failus ir paslėpti jų modifikacijas nuo `git status` ar `git diff` komandų.

Tarkime modifikavome konfigūracijų failą `config.py` ir dabar jį matome įvykdę `git status` komandą:

    $ git status -sb
    master...origin/master
    MM config.py

Ir žinoma situacija - mes nenorime šių pakeitimų commit'inti, nes tai gali būti laikinas duomenų bazės testavimas, laikinas debug režimo įjungimas ar pan. Taigi, praneškime GIT'ui, kad šio failo pakeitimus kol kas ignoruosime:

    git update-index --assume-unchanged config.py

Ir dabar paklausus `GIT` pakeitimų gautume tokią išvestį:

    $ git status -sb
    master...origin/master

Jokių pakeitimų. Nors mūsų pakeitimai tikrai egzistuoja tame faile. Jokios „magijos“ čia nėra. GIT'as savo pakeitimus įsirašo į savo lokalų `index` failą ir užkešuoja šias nuostatas.

Vėliau, nusprendę atstatyti failą į originalų failą (pavyzdžiui po keleto komitų):

    git update-index --no-assume-unchanged config.py

Reikėtų nepamiršti keleto dalykų:

* Toks sprendimas turėtų būti laikinas.
* Persijunginėjant tarp branch'ų toks sprendimas neveiks nes bus naujinamas `index` failas ir valomas kešas.
* Jūsų pakeitimai gali įtakoti programos rezultatą, tai yra tikimybė, kad susidursite su “o man tai veikia“ situacija.

Ši komanda jau yra pravertusi ne vieną kartą programuojant, tikiuosi pagelbės ir Jums.
