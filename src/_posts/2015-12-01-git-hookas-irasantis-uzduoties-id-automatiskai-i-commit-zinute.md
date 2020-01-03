---
title: GIT HOOK'as įrašantis užduoties ID automatiškai
category: git
image: i/uzduoties_id.jpg
description: GIT gali automatiškai Jums nustatyti ir prirašyti prie commit žinutės Jūsų užduoties ID prie kurios dirbate iš branch pavadinimo.
---

Jeigu darbui naudojate [Git Flow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow) Jums bus pažįstamas branchų versijavimas ir kam ir kodėl jis reikalingas. Jeigu nenaudojate - siūlyčiau pasekti nuorodą ir susipažinti. Ši darbų eiga tikrai gali Jums padėti pasidaryti tokią programavimo darbų eigos architektūrą, kuri gerokai patobulintų darbo kokybę ir sudarytų tinkamą, šiuolaikišką ir patogią struktūrą versijuojant projektus.

Daug kam bus nesvetimas ir užduoties ID rašymas `commit` žinutėse. Kaip užtikrinti, kad visos `commit` žinutės turėtų užduoties ID - jau rašiau [praėjusiame straipsnyje](/git/tikriname-commit-zinutes-del-uzduoties-id). Kad nereiktų ilgai galvoit, atsidarinėti naršyklės ir ieškoti savo „track'o“ su užtuoties ID siūlau jį rašyti branchų varduose, pavyzdžiui:

    git branch feature/2911-users-api
    git branch hotfix/3341-aws-sync-large-files

Na, ir galiausiai susikurkime tokį Hook'ą faile `.git/hooks/prepare-commit-msg`:

    #!/bin/bash

    # if it contains some number in branch name - use it as ticket ID
    TICKET=$(git symbolic-ref HEAD | sed 's/[^0-9]*//')
    if [ -n "$TICKET" ]
    then
        mv "$1" "$1.bak"
        echo "#$TICKET " > "$1"
        cat "$1.bak" >> "$1"
        rm -f "$1.bak"
    fi

Ir būtinai suteikime šiam failui vykdymo teises su `chmod +x .git/hooks/prepare-commit-msg`.

Aiškinti šiame hook'e nelabai yra ką. Komanda `git symbolic-ref HEAD` yra viena iš daugelio, kurią galima panaudoti brancho vardui išgauti. Šiame skripte "$1" yra laikinas failo vardas kurį sukuria `GIT` tam, kad vėliau atidarytų jį su redaktoriumi ir lauktų, kol redaktorius užsidarys, kad galėtų pratęsti commit'ą.

Taigi, jeigu Jūsų branch'o vardas turi savyje skaičius, jie bus panaudoti kaip užduoties ID ir prirašyti `commit` žinutėje kai atidaromas redaktorius (taigi, `git commit -m` čia netiks - šiai komandai kada nors vėliau parodysiu kitą skriptą).

Pavyzdžiui esant branche `feature/6544-allow-login-using-fb` po pakeitimų parašius `git comit` bus matoma redaktoriuje:

    #6544

    * Please enter the commit message for your changes. Lines starting
    * with '*' will be ignored, and an empty message aborts the commit.
    [..]

Per kelis metus šis hook'as man sutaupė rekordiškai daug laiko. Tikrai siūlau išbandyti.
