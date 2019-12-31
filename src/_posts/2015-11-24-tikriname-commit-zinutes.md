---
title: Tikriname commit žinutes dėl užduoties ID
permalink: /git/tikriname-commit-zinutes-del-uzduoties-id
category: git
image: i/kodo_tikrinimas.png
description: Straipsnis apie commit žinučių tikrinimą. Remiantis straipsniu galite pasidaryti bet kokius savo commit žinučių patikrinimus lengvai ir greitai.
---

Pratęsiant praėjusį naudingą straipsnį apie [Brancho vardo tikrinimą GIT Hook'e](/git/branch-o-vardo-tikrinimas-git-hook-e) norėčiau papasakoti apie dar vieną labai naudingą tikrinimo hook'ą kuris tikrina mano darbus daugelį kartų per dieną. GIT hook'as kuris praneša, jeigu netyčia commit žinutė neturi savo pradžioje užduoties ID.

Tipinė commit žinutė mano projektuose būtų tokia (paėmiau iš vieno iš savo projektų `git log`):

    #7264 Improve Dropbox cleanup

    Dropbox complains when removing folders which has too many files inside.
    This fixes by splitting files queue to smaller pieces and making more
    requests to Dropbox API.

Aišku, detalesnį aprašymą rašau daug rečiau, bet tik labai retais atvejais žinutės būna be užduoties ID. O tam, kad nereikėtų daryti savo pačio žinutėse revizijos, susikūriau GIT Hook'ą, kuris neleistų sukomitinti jeigu užduoties ID pamirštas.

Tą galime pasidaryti paprastai sukūrę failą `.git/hooks/commit-msg` ir jame įrašę:

    #!/bin/sh

    if head -n 1 "$1" | grep -Pvq "^#[0-9]+"
    then
        echo >&2 "ERROR: Ticket number is missing in commit message"
        exit 1
    fi

Ir aišku, suteikime šiam failui vykdymo teises su `chmod +x .git/hooks/commit-msg`.

Trumpai apie šio hook'o aspektus. Pirmiausiai jame pamatysite komandinės eilutės argumentą `$1`. Jis savyje laiko laikino failo vardą kurį sukūrė `GIT` konstruodamas pradinį žinutės tekstą ir ką vėliau išsaugosite redaktoriuje (jeigu nenaudojate `git commit -m`).

Eilutė `head -n 1 "$1"` iš šio failo paims tik vieną - pirmą - eilutę. Čia tam, kad išvengti „galvojimo“, kad kur nors žinutės aprašyme bus eilutė prasidedanti grotelėmis ir skaičiais.

Eilutė `grep -Pvq "^#[0-9]+"` atrodo gana baisiai. Čia su `grep` ieškome eilučių su `regexp` (dėl to ir yra argumentas `-P`) kurios prasideda grotelėmis ir skaičiais (pvz.: „#1234 Užduoties aprašymas“). Argumentas `-v` yra tam, kad `if` sąlyga „suveiktų“ jeigu teksto ieškomo nerado, o `-q` argumentas, kad į komandinės eilutės išvestį neišvestų surasto rezultato, jeigu toks būtų.

Na ir eilutės:

        echo >&2 "ERROR: Ticket number is missing in commit message"
        exit 1

Turėtų būtų gana suprantamos: išvedamas tekstas į `stderr` išvestį ir su `exit 1` nutraukiamas tikrasis
commit'as, dėl surastos klaidos.

Kitame straipsnyje parodysiu kaip galima iš brancho vardo išgauti užduoties ID, kad jo ranka nereikėtų
rašyti.
