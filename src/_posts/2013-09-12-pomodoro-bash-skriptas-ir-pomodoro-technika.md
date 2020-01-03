---
title: Pomodoro BASH skriptas
category: mano-projektai
image: i/pomodoro-bash-skriptas-ir-pomodoro-technika.png
description: Pomodoro BASH skriptas. Laiko sekimas su Pomodoro. Pomodoro laiko sekimas.
---

Kadangi dirbu prie rimtų internetinių projektų, už kuriuos vėliau net gaunu pinigus, svarbu labai rimtai sekti savo laiką. Toks laiko žurnalo turėjimas yra naudingas dėl kelių priežasčių:

-   Dažnai klientai moka už sugaištą laiką po atlikto darbo.
-   Galiu įvertinti ar mano laiko planavimas tikslus.
-   Pats žinau kiek praleidžiu laiko dirbdamas. Pavyzdžiui ar išdirbau savaitėje standartines 60 valandų.
-   Taip pat žinau kiek dirbu prie savo projektų, todėl galiu skaičiuoti savikainą.

Esu išnagrinėjęs daugybę tokių programų: Hamster, KTimeTracker, tomato.es ir pan. Pastarosios sistemos net [rekordininkas esu](http://tomato.es/rankings?time_period=all_time). Nors išvardinta programinė įranga tikrai gera ir skųstis nėra ko, bet po ilgo laiko nusprendžiau persimesti prie labai primityvios sistemos. T.y. kad laiką sektų paprasta BASH programėlė, kuri savyje turėtų sleep 60 ir kas minutę išvestų į ekraną apie praėjusį laiką, o surinkus tam tikrą sumą, ją išsaugotų ataskaitos faile, kad nepasimestų.

## Kas yra Pomodoro technika?

Tai tokia darbo metodika, kad yra susikoncentruojama tam tikro laiko tarpą į darbą ir daroma tik tai. Vėliau praėjus šiam laikui daroma mažytė pertrauka. Toks ciklas kartojamas kelis kartus, daroma ilgesnė pertrauka. Ir vėl viskas iš pradžių. Žinoma, toks apibūdinimas yra mano žodžiais (internete galima rasti geresnių ir tikslesnių).

Dažniausiai minint Pomodoro yra naudojami tokie laiko tarpai: 25 minutes susikoncentruojama į darbą, 5 minutės pertrauka. Toks ciklas daromas 4 kartus. Tuomet pertrauka 20-25 minutes. Ir vėl viskas iš pradžių.

Pati Pomodoro technika tikrai veikia man, veikia milijonams žmonių pasaulyje, išmėginkite ir Jūs!

## Pomodoro programa

Skriptą rasite [Github gist'e](https://gist.github.com/ReekenX/9614738). Veikimas tikrai paprastas: rašote komandos vardą ir darbo aprašymą. Darbo aprašymui pats naudoju projekto pavadinimą, ar milestone (nežinau, kaip šis terminas lietuviškai) pavadinimą. Pavyzdžiui:

    pomodoro "blog entry writing"

Taip pat matysite kiekvieną minutę progresą šios komandos, pavyzdžiui:

    Working on blog entry writing

    Today:

          1 blog entry writing

    Progress:

            [XX                       ] 2/25

Pirma eilutė - priminimas prie ko dirbama. Antra dalis (rodoma „surinkus“ bent vieną Pomodoro) - šios dienos Pomodoro skaičiai prie kiekvienos užduoties (susumuoti). Ir paskutinės eilutės - dabartinės užduoties progresas.

Paleidus programą savo kompiuterio lango krašte pamatysite užrašą, kad Pomodoro darbo sesija sėkmingai pradėta (tekstas bus tik kelias sekundes). O pasibaigus sesijai, bus atspausdintas dar vienas pranešimas.

Na, jeigu sumąstysite šiuo pagalbininku pasinaudoti, tai tikrai sugebėsite pasikoreguoti laikus ir tekstus pagal save :)

Man visada smalsu ką kiti naudoja laiko sekimui. Šiuo metu pasaulyje programų yra sukurta tūkstančiai, pasiūla tikrai didelė. Be to, būtų keista išgirsti iš programuotojo sakant, kad jis neseka savo laiko :)