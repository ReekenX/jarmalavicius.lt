---
title: GIT HOOK'as tikrinantis pavojingus žodžius kode
permalink: /git/git-hookas-tikrinantis-pavojingus-zodzius-kode
category: git
image: i/pavojingi_zodziai.jpg
description: Straipsnis apie automatinį pavojingų žodžių tikrinimą prieš komitinant.
---

Nebe pirmas mano straipsnis apie versijavimo sistemų papildomą pagalbą dirbant. Labai daug darbo nusiimu nuo savo galvos pasinaudojus šiais pagalbininkais:

* [Git hook'u įrašančiu užduoties ID automatiškai](/git/git-hook-as-irasantis-uzduoties-id-automatiskai)
* [Branch'o vardo tikrintoju](/git/branch-o-vardo-tikrinimas-git-hook-e)
* [Git push komanda projektui atnaujinti](/git/git-push-komanda-projektui-atnaujinti)
* Arba kitais iš kategorijos [versijavimo sistemos](/git)

Šiandien tęsiant šią temą (tikiuosi pravers ne vienam), pakalbėsiu apie pavojingų žodžių tikrinimą prieš darant `commit`. Per daugelį darbo metų tiek pats ne kartą buvau išsiuntęs į repozitoriją (ar net į produkcinį serverį) įvairų „debuginimo“ kodą, tiek labai daug kartų buvau matęs, kaip tai kiti padaro.

Išvengti to galima ir tikrai nėra sudėtinga. Pasikurkime failą `.git/hooks/pre-commit` su turiniu:

    #!/bin/bash

    test_words_existance() &#123;
        if git diff --cached -U0 "$1" | grep -P '^\+' | grep -q "$2"
        then
            echo "Rastas įrašytas naujas pavojingas žodis $2 faile $1!"
        fi
    &#125;

    while read st file
    do
        # Praleisti ištrintus failus
        if [ "$st" == 'D' ]
        then
            continue
        fi

        # Bendriniai žodžiai
        test_words_existance "$file" TODO
        test_words_existance "$file" FIXME
        test_words_existance "$file" XXX

    done < <(git diff --cached --name-status)

Ir būtinai šiam failui skirkite vykdymo teises su `chmod +x .git/hooks/pre-commit`.

Panagrinėkime ko galima tikėtis. Pradėkime nuo `while` ciklo. Į jį iš subproceso paduosime `git diff` pakeistų failų sąrašą, kuris bus tokiu pavidalu: [STATUSO RAIDĖ] [FAILO VARDAS]. Visa išvestis be laužtinių skliaustų.

Ir per šiuos failus darysime žodžių tikrinimą, jeigu to failo būsena nėra ištrinta (statuso raidė 'D').

Didelis `grep` sakinys `git diff --cached -U0 "$1" | grep -P '^\+'` duos mums pakeistų eilučių išvestį (jos prasidės + simboliu). Būtent šiose eilutėse ir ieškome tų „pavojingų“ žodžių.

O kas galėtų būti „pavojingi“ žodžiai? Priklauso nuo programavimo kalbos. Pavyzdžiui PHP jie galėtų būti: `var_dump`, `print_r` arba `debug_backtrace`. Javascripte paliktas `console.log` arba `debugger`. Tai tokios komandos, kurios galėtų sukelti nekorektišką programos veikimą.

Man, prie to paties, pavojingi žodžiai yra `TODO`, `FIXME` ir pan. Jų commit'inimas reikštų, kad dabar kas commit'inama - jau veikia nekorektiškai ir reikalauja kažkokio darbo. Arba tai puikus būdas pasižymėti, jog kažkas nebaigta ir netyčia nesukomitinti. Žinoma, kitiems toks dalykas galbūt pasirodys per daug destruktyviu.

Daugiau pavyzdžių rasite mano [GitHub faile](https://github.com/ReekenX/git-hooks/blob/master/pre-commit).
