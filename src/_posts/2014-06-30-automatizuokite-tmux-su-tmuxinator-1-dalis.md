---
title: Automatizuokite tmux su tmuxinator, 1 dalis
category: tmux
image: i/tmux/automatizuokite-tmux-su-tmuxinator-1-dalis.png
description: Kaip automatizuoti Tmux su Tmuxinator pagalba. 1 dalis. Kas yra šie du įrankiai ir kaip jie padeda darbui terminale?
---

Screen? Oj, tikrai ne. Nors, serveriuose, kur galbūt neturiu root ir negaliu įsidiegti, tai taip.Bet visais kitais atvejais - tmux. Kuom gi jis geresnis:-   Leidžia keliems klientams prisijungti prie vienos sesijos.
-   Visai neblogai aprašytos konfigūracijos.
-   Labai patogi teksto kopijavimo iš terminalo paslauga.
-   Ypatingai lengvai galima keisti langų dydžius ir vietas.
-   Statuso eilutė be jokių konfigūracijų!Tiesa, screen turi savų privalumų, kurių niekada neteko panaudoti dėl technologijų senumo: visokie telnet ir serial palaikymai. Kam dar jų gali reikėti?Kaip ten bebūtų, įdiegti tmux ir screen yra paprasta (apie tai rašyti tikriausiai neverta). Aš dažniausiai naudoju tokį darbo modelį:-   Turiu vieną sesiją su keliais langais kurią vadinu „kompiuteris“. Tai vienas root langas, finansų apskaita, laiko apskaita, muzika.
-   Kiekvienam klientui skiriu po vieną sesiją su X kiekiu langų. Vienas langas = vienas projektas. Ir tas langas dažnai perskeltas į bent dvi dalis.
-   Viena sesija su IRC langu. Pati sesija kitame terminale rodoma, nes ją noriu matyti kitame ekrano lange.Taigi, gaunasi ~5 sesijos su daugiau nei 30 langų jose. Kiekis gal ir nėra didelis, bet kai įjungus kompiuterį tenka viską pasileisti, tai... Erzina. Bet jau prieš daugiau nei pusmetį suradau tikrai vertą dėmesio programą pavadinimu tmuxinator. Ji leidžia automatiškai sukurti sesijas su langais.Tai vyksta per konfigūracijų failus. Sukurti naują failą galime su komanda:    tmuxinator new PROJEKTO-VARDASAtsidarys YAML failo redagavimo langas, kuriame turėsite aprašyti kaip vadinsis sesija ir ką konkreti sesija turėtų paleisti (tokius langus su kokiomis komandomis). Pavyzdžiui štai kaip atrodo mano pirmoji aprašyta sesija:    name: computer
    windows:
        - root: su - root
        - mc: mc
        - earnings: time watch -n 5 nice -n19 earned-history.awk
        - finances: watch -n 5 finances.bash
        - music: ncmpcppSintaksė velniškai paprasta: vienas windows elementas laiko savyje bash komandą.Susikūrus reikiamus tmuxinator projektus bet kada galime juos paleisti:    tmuxinator start computerPradžiai tiek. Kitame straipsnyje aprašysiu kaip vienas langas gali pavykdyti kelias komandas. Programa tmuxinator labai paprasta, bet galimybės tikrai stebina!
