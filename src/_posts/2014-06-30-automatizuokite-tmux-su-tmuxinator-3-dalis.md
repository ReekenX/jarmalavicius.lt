---
title: Automatizuokite tmux su tmuxinator, 3 dalis
permalink: /tmux/automatizuokite-tmux-su-tmuxinator-3-dalis
category: tmux
image: i/automatizuokite-tmux-su-tmuxinator-3-dalis.png
description: Kaip automatizuoti tmux su tmuxinator pagalba. 3 dalis. Langų išdėstymo dydžiai Tmuxinator / Tmux programoje.
---

Jeigu šiek tiek primiršote ar neskaitėte praėjusių straipsnių, tai trumpai paminėsiu, kad pasakojau apie tmux programą, kuri iš esmės yra geresnė screen alternatyvą - automatizavimą. Kodėl geresnė nei screen? Siūlau pasiskaityti [pirmame straipsnyje](/tmux/automatizuokite-tmux-su-tmuxinator-1-dalis). O [antrame straipsnyje](/tmux/automatizuokite-tmux-su-tmuxinator-2-dalis) pasakojau, kad tmuxinator gali atlikti ne vieną komandą kažkuriam langui, bet kelias. Kas dar gerai, kad iš esmės į langus siunčiamos ne komandos, o klavišų paspaudimai. Taigi, dabar magijos gali būti dar daugiau!

Šiame straipsnyje papasakosiu apie labai naudingą dalyką - automatinį langų skaldymą. Standartiškai tokia konfigūracijos sintaksė:

    windows:
        - lango-vardas:
            panes:
                - skydelio-pavadinimas:
                    - komanda 1
                    - komanda 2
                    - komanda 3
                - kitas-skydelis
                    - komanda 1
                    - komanda 2

Suskaldo langą į dvi lygias dalis. Pagal nutylėjimą skaldymas įvyks per lango aukštį. Dar vienas skydelis įrašytas žemiau suskaldytų langą į tris dalis. Tai tikrai patogu, jeigu patinka toks išdėstymas.

Dirbdamas su Django langą dalinu taip: 80% lango VIM redaktoriui, o apačioje du langai python manage.py runserver ir dar vienas langas kokiems nors sass ar TODO sąrašui skaityti. Išbandykit, tikrai patogu!

![ Ekranas suskaldytas su tmuxinator](/i/suskaldytas_tmux_langas_su_tmuxinator.png)

Deja, bet tmuxinator nėra labai draugiškas langų skaldymui. Ši galimybė realiai egzistuoja tik neapsikentusių naudotojų dėka (kaip supratot - per „hack'us“).

Pirmiausiai teks atsidaryti tuščią tmux langą ir susiskaldyti į taip kaip Jūs norite. Sukurti skydeliai gali būti tušti, mums aktualus tik skydelių dydis. Lango skydelių dydį galite sužinoti komandos pagalba:

    $ tmux list-windows

Gausite kažką panašaus į:

    0: blog* (3 panes) [175x53] [layout 6535,175x53,0,0[175x43,0,0,8,175x9,0,44&#123;65x9,0,44,14,109x9,66,44,15&#125;]] @6 (active)

Iš šio painaus užrašo mums reikalinga tik layout dalis. Ją nukopijuosime į savo lango konfigūracijos YAML dalį:

    windows:
        - lango-vardas:
            layout: 6535,175x53,0,0[175x43,0,0,8,175x9,0,44&#123;65x9,0,44,14,109x9,66,44,15&#125;]
            panes:
                - skydelio-pavadinimas: komanda
                - kitas-skydelis: komanda
                - trecias-skydelis: komanda

Viską sukonfigūravus galime leisti savo automatizuotą kūrimą:

    $ tuxinator start projekto-vardas

Iš patirties galiu pasakyti, kad sugaištas laikas su tmuxinator atsiperka labai greitai, jeigu dažnai programuojate tą patį. Ypatingai kai kalbame apie programavimą, tai laiko sutaupyti galima labai daug:

-   Galima pasiruošti greitai sluoksnius su kuriais patogu dirbti prie vienų projektų, kitus prie kitų.
-   Galima paleisti projektui startuoti reikalingas komandas.
-   Galima atsinaujinti projektą prieš pradedant su juo dirbti.

Na, o jeigu yra kažkokių klausimų, galbūt padėčiau atsakyti. Tai paskutinis straipsnis apie tmuxinator. Projekto kodą galima rasti [Github](https://github.com/tmuxinator/tmuxinator), o dokumentacijos dar teks palaukti ;)