---
title: Automatizuokite tmux su tmuxinator, 2 dalis
category: tmux
image: i/tmux/automatizuokite-tmux-su-tmuxinator-2-dalis.png
description: Kaip automatizuoti Tmux su Tmuxinator pagalba. 2 dalis. Apie tmuxinator komandas ir Tmuxinator failo formatą.
---

[Praėjusiame straipsnyje](/tmux/automatizuokite-tmux-su-tmuxinator-1-dalis) trumpai pristačiau tmuxinator ir parodžiau kaip susikurti mažą projektą. Šiandien aprašysiu galimas tmuxinator komandas ir parodysiu kaip vienas langas gali pavykdyti ne vieną bash komandą.

Pirmiausiai dirbant su tmuxinator pilnai užteks dviejų komandų kurias aprašiau anksčiau: new ir start. Nes visa kita susiję su redaguojamu failu, kurį galite tiesiog valdyti per savo teksto redaktorių. Programa tmuxinator visas konfigūracijas išsaugo ~/.tmuxinator/ kataloge.

Trumpai apie tmuxinator komandas:

    $ tmuxinator copy SENAS-PROJEKTAS NAUJAS-PROJEKTAS
    Nukopijuoja projekto failą į kitą vardą. Tą galite
    padaryti tiesiog ~/.tmuxinator kataloge.

    $ tmuxinator debug PROJEKTAS
    Kai kuriate langus su sudėtingomis komandomis tai naudinga
    pažiūrėti ką ir kaip tmuxinator vykdo. Pavyzdžiui labai
    naudinga gali būti, kada bandote vieną langą suskaldyti
    į kelias dalis.

    $ tmuxinator doctor
    Tiesiog patikrina Jūsų konfigūracijų sintaksę.

    $ tmuxinator help KOMANDA
    Duoda daugiau informacijos apie aukščiau aprašytas komandas.

    $ tmuxinator implode
    Ištrina projektus. Nenaudokit geriau ;)

    $ tmuxinator list
    Išveda į ekraną visą sąrašą projektų kuriuos galite paleisti.

    $ tmuxinator new PROJEKTAS
    Sukuria naują projektą. Realiai tai YAML failas ~/.tmuxinator
    kataloge.

    $ tmuxinator start PROJEKTAS
    Paleidžia projektą. Atsidarys tmux su jame užregistruotomis
    sesijomis ir langais.

    $ tmuxinator version
    Leidžia pažiūrėti kokią versiją naudojate. Rašant straipsnį
    buvo 0.6.6 (įvertinčiau kaip stabilią).

Taigi, jau turėtų būti aišku, kad tmuxinator realiai sukuria kažkokį YAML failą, kurį laiko \~/.tmuxinator kataloge, ir pagal kurį kuria sesijas ir jose langus. Tai sutaupo daug laiko kai reikia sukurti ne vieną sesiją ir/ar ne vieną langą. Ypatingai programuotojams dirbantiems visą laiką ne prie vieno projekto - labai naudinga ir produktyvu.

O dabar trumpai apie kelių komandų paleidimą viename lange. Naudokite tokią YAML sintaksę:

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

Kaip minėjau, langus dažnai perskeliu į kelis skydelius. Didžiausias skydelis būna redaktoriaus VIM, tuomet apačioje vienas langas web-servisui ir dar vienas nedidelis langas visokioms su projektu susijusioms bash komandoms vykdyti.

![ Tmux langas suskaldytas su tmuxinator](/i/tmux_langas_suskeltas_i_tris_dalis.png)

Šiuo atveju tmuxinator suskaldys langą proporcingai (du langus po 50%, jeigu langai trys, tai po 33% ir t.t.). Klaviatūros pagalba galima lengvai perstumdyti langų dydžius. Bet pala! Mes juk siekiame automatizuoto proceso!

Tai taip, su tmuxinator galima ir tai. Galima nustatyti langų išsidėstymą, jų dydžius ir aukščius. Būtent taip ir esu pasidaręs priklausomai nuo to ko reikia konkrečiam langui. Bet apie tai - kitame straipsnyje.