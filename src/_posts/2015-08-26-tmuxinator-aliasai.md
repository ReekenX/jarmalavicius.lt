---
title: Tmuxinator aliasai / greitos darbų aplinkos
permalink: /tmux/tmuxinator-aliasai
category: tmux
image: i/tmux/tmuxinator-aliasai.png
description: Tmuxinator aliasų panaudojimas. Praktiniai Tmuxinator konfigūracijų pavyzdžiai PHP, Django, ir kitokiems projektams.
---

Ne taip seniai esu rašęs ciklą straipsnių apie `tmuxinator`, kurios dėka pasikartojančius darbus pasidarysite žymiai lengviau. Tai ne automatizavimo įrankis darbui, tai automatizavimo įrankis darbo aplinkai. Panaudojimo spektras gali būti tikrai gana platus: nuo darbo rašant kursinį, eksperimentuojant su operacine sistema iki rimto projektavimo ar programavimo.

Kas dar neskaitė ankstesnių straipsnių serijos, patarčiau peržiūrėti, galbūt įrankis tikrai bus naudingas:

* [Automatizuokite tmux su tmuxinator, 1 dalis](/tmux/automatizuokite-tmux-su-tmuxinator-1-dalis)
* [Automatizuokite tmux su tmuxinator, 2 dalis](/tmux/automatizuokite-tmux-su-tmuxinator-2-dalis)
* [Automatizuokite tmux su tmuxinator, 3 dalis](/tmux/automatizuokite-tmux-su-tmuxinator-3-dalis)

Na, o šiandien trumpai apie tai, ko nepapasakojau pirmame straipsnyje - apie tai, kad `tmuxinator` turi aliasus, kurių dėka galima turėti universalias aplinkas.

Anksčiau, `tmuxinator` konfigūracijas kurdavau konkrečiai projektams. Tuomet ir komanda būdavo:

    tmuxinator new PROJEKTO-VARDAS

Šioje komandoje `tmux` buvo sukuriama sesija pavadinimu `PROJEKTO-VARDAS`. Tačiau kiekvienam projektui sukurti po konfigūracinį failą yra išties nemažai darbo. Tai ypač daug laiko reikalauja jeigu dirbi kokioje „svetainių kepykloje“ (įmonėje kurioje kas mėnesį ar dažniau tenka pabaigus vieną projektą pereiti prie kito).

Taigi prieikime prie aliasų. Kaip ir anksčiau, susikurkime universalias aplinkas. Aš jas turiu maždaug tokias: [aplinką PHP projektams](https://github.com/ReekenX/dotfiles/blob/c6e9c40689952bf6d5b7409fb47fabbe1da1bf3c/.tmuxinator/php.yml), [aplinką Django projektams](https://github.com/ReekenX/dotfiles/blob/c6e9c40689952bf6d5b7409fb47fabbe1da1bf3c/.tmuxinator/django.yml), [aplinką konkrečiam projektui - tinklaraščiui](https://github.com/ReekenX/dotfiles/blob/c6e9c40689952bf6d5b7409fb47fabbe1da1bf3c/.tmuxinator/blog.yml) ir t.t.

Visos aukščiau išvardintos aplinkos buvo sukurtos `tmuxinator new APLINKOS-VARDAS` komandos dėka.

Taigi, pradedant dirbti prie kokio Django projekto, užtenka nueiti iki jo katalogo ir startuoti aplinką:

    cd /kelias/iki/projekto
    tmuxinator start django projekto-vardas

Čia `tmuxinator` sukurs pagal `django` konfigūraciją `tmux` sesiją pavadinimu `projekto-vardas`.

Labai paprasta, bet labai ir patogu. Trūksta idėjų? [Github konfigūracijų](https://github.com/search?utf8=%E2%9C%93&q=filename%3A.tmuxinator&type=Code&ref=searchresults) yra daugybė.
