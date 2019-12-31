---
title: CRON komandų „debuginimas“
permalink: /atviras-kodas/cron-komandu-debuginimas.html
category: atviras-kodas
description: Kaip debuginti CRON komandas? O kaip pakeisti standartinį CRON shellą į bash vietoje sh? Kaip surasti kur nutrūko programa?
featured: true
---

Kadangi jau ne kartą sulaukiau klausimų apie tai, kodėl viena ar kita komanda veikia
ne taip, kaip tikėtasi, leidžiant per CRON, nusprendžiau, kad parašysiu straipsnį apie
tai.

Pirmiausiai, tai komandos neveikti arba veikti ne taip kaip tikėtasi gali dėl labai
daug priežasčių, sunku būtų ir išvardinti. Trumpai apie dažniausiai sutinkamas bėdas.

**CRON programinės įrangos yra daug**

Reikia nepamiršti, kad programa `cron` nėra kažkokia tai sisteminė programinė įranga kurią
būtinai rasite vienodą visose operacinėse sistemose. Variacijų yra daug ir įvairių.

Jeigu paieškosite internete arba paleistumėte `apt-cache search cron` (Debian paremtose
sistemose) pamatytumėte įvairiausią sąrašą programinės įrangos: anacron, cron, bcron ir t.t.

Taigi, jeigu migruojate su duomenimis ir `cron` įrašais į kitą serverį, įsitikinkite ar
tikrai tą pačią programą naudojate.

**Standartinis shell'as**

Klaidų žurnaluose gaunate `command not found`? Taip yra todėl, kad greičiausiai testuodami
naudojate modernų shellą, tokį kaip `bash` ar `zsh` ar kitą. O `cron` vykdomas pagal nutylėjimą su
`/bin/sh`. O jis gali neturėti `env` kintamųjų pasiekti `/usr/local/bin` ir kitus katalogus
kurių komandoms gali reikėti pavyzdžiui $PATH kintamojo.

Shell'ą pakeisti galite `crontab -e` įrašę viršuje:

    SHELL=/bin/bash

**Naudotojas ir kiti env kintamieji**

Dažnai esu užtikęs, kad žmonės neradę sprendimo kaip viską paleisti arba kaip tvarkingai
nustatyti priėjimo taisykles, `cron` įrašus kuria ant `root` naudotojo. **Rekomenduočiau
niekada to nedaryti**. Visada praleiskite šiek tiek laiko, kad ir paprastas naudotojo
prisijungimas be jokių `sudo` galėtų pavykdyti komandas kurių reikia.

Taip pat reikia nepamiršti, kad Jums komanda gali veikti dėl to, kad Jūsų `env` turi
kažkokių kintamųjų kurie reikalingi programai. Toliau - apie tai, kaip identifikuoti
šias bėdas.

**Išsiaiškinkime dėl ko programa skundžiasi**

Pirmiausiai ką reikia padaryti, tai nukreipti komandos visą išvestį (standartinę išvestį
ir klaidų) į sisteminį pranešimų failą (`logger` komandos dėka):

    * * * * * /kelias/iki/komandos 2>&1 | logger

Nuo dabar visą išvestį rasite arba `syslog` (dažniausiai tai `/var/log/syslog`) arba
`messages` (dažniausiai tai `/var/log/messages`).

Pagal [Pareto dėsnį](https://lt.wikipedia.org/wiki/Pareto_principas): tai jau išspręs 80% bėdų. Tačiau ką daryti, kai pvz.
`bash` komandos nutrūkimo priežastis neaiški?

**Išsiaiškinkime kur nutrūko programa**

Savo `bash` skripte reikėtų laikinai įjungti „debuginimo režimą“. Jį įjungsite į `bash`
skripto viršų įrašę:

    #!/bin/bash
    set -x

Kadangi iš praėjusio patarimo viską jau siunčiame komandai `logger`, kurį žinutes surašo
į klaidų failą, tai ten reikėtų žiūrėti ir dabar. Tiesa, tai turėtų būti laikinas sprendimas,
kadangi klaidų žurnale matysite **kiekvieną bash eilutę** kuri buvo pavykdyta. O tai,
gali būti daug išvesties.

**Du patarimai žiopliems**

Tik nereikia įsižeisti! Klaidų pridaro visi, o kartais jos tokios paprastos. Reikėtų
pasitikrinti ar tikrai `cron` komandos paleidžiamos apskritai. Gal sumaišėte
[laikų sąlygas](https://en.wikipedia.org/wiki/Cron)
ir dėl to `cron` komanda bus pavykdyta kažkada vėliau. Taigi, pastebėkite
`cron` žurnalą:

    tail -f /var/log/cron

Taip pat internete rasite ne vieną online įrankį, kuris gali „išversti“ į žmogišką
kalbą kada komandos bus paleidžiamos. Štai [vienas iš tų įrankių](https://crontranslator.appspot.com/).
