---
title: Branch'o vardo tikrinimas GIT Hook'e
category: git
image: i/git_branchas.png
description: Brancho vardo tikrinimas GIT Hook pagalba. Labai naudinga, jeigu Jūsų organizacija laikosi tam tikrų programavimo standartų.
---

Praėjusiame straipsnyje rašiau apie [GIT PUSH komandą projektui atnaujinti](/git/git-push-komanda-projektui-atnaujinti). Pratęsiant temą, šiame straipsnyje aprašysiu kaip į Hook'ą įvesti tam tikros (kokybės?) kontrolės.Labai svarbu kas yra įkeliama į projektą. Galbūt „testing“ ir „development“ aplinkose galėsite sau leisti turėti bet kokį branch'ą, bet pavyzdžiui „staging“ tikriausiai norėsite tik `master` (ar kitokio, iš anksto numatyto, branch'o). Todėl bus svarbu užtikrinti, kad niekas į tą versiją nepakliūtų, o programuotojai būtų informuoti apie tai, kas bandoma padaryti.Tą nesunkiai užtikrinsite dar vieno GIT Hook'o pagalba: `pre-receive` (failas `.git/hooks/pre-receive`):    #!/bin/bash    while read oldrev newrev ref
    do
        if [[ $ref =~ .*/master$ ]]
        then
            git checkout -f
        else
            echo "Klaida - įkeliamas branch'as turi būti master."
            exit 1
        fi
    doneBūtina atkreipti dėmesį, kad Hook'ai nėra pašalinės komandos (angl. „external source“), o įterptinės. Dėl to, negalėsite pasiekti komandos argumentų iš komandinės eilutės, bet reikės naudotis trimis kintamaisiais iš kvietimo pusės. Šiame pavyzdyje tai `oldrev`, `newrev` ir `ref`. Pavadinimai turėtų būti pakankamai suprantami, kad suprasti ką jie savyje laiko.Ir aišku, pasinaudodami `ref` nesunkiai galėsime patikrinti ar pakeitimai ateina į tą branch'ą į kurį tikimasi. Jeigu ne, tai programuotojui bus parodomas pranešimas (net ir tada, kai vykdoma „tyli“ komanda `git push -q`). O `exit 1` pasirūpina, kad `GIT` nepriimtų pakeitimų į nuotolinę repozitoriją.