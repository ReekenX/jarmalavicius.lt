---
title: Ranka įdiegtų paketų sąrašo gavimas
permalink: /atviras-kodas/ranka-idiegtu-paketu-saraso-gavimas
category: atviras-kodas
image: i/placeholder.jpg
description: Kaip rasti ranka įdiegtų paketų sąrašą Debian OS šeimose ir kokius kitokius pagalbinius įrankius mums duoda standartinis apt-get.
---

Anksčiau, kai dar nenaudojau nei [ansible](http://www.ansible.com/home) nei [salt](http://saltstack.com/) automatizuotoms sistemoms kurti, dažnai įvairius dalykus tekdavo atlikti ranka. Vienas dažniausių veiksmų būdavo įdiegti programas kurias dažniausiai naudoju. Kam įdomu, mano  dažniausiai naudojamų programų sąrašus galima rasti senesniuose straipsniuose: [2013 metų straipsnyje](/mano-projektai/kokias-programas-naudoju-2013-m) ir [2010 metų straipsnyje](/mano-projektai/kokias-programas-naudoju-2013-m).

Taigi, o kaip rasti įdiegtų programų sąrašą? Komanda `dpkg -l` čia nelabai padės, nes ji išves tokį ilgą sąrašą, su tiek daug bibliotekų, kad gali būti per sunku atsifiltruoti. Arba daug darbo.

Laimei, Debian operacinės sistemos šeimose, tą gana nesunkiai galima pasidaryti su `apt-mark` komanda. Gaukime ranka įdiegtų programų sąrašą:

```
    apt-mark showmanual
```

Rezultatas yra tik „dag maž“ ranka įdiegti failai. Šiame sąraše rasime ne vieną „priklausomą“ paketą, tuo pačiu ir bibliotekas (paketai prasidedantys arba turintys savyje anglišką žodį „lib“). Norint šį sąrašą patrumpinti, teks papildomų komandų:

```
    comm -23 <(apt-mark showmanual | sort -u) <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u)
```

Iš pradžių gali pasirodyti kiek per sudėtinga, bet jeigu analizuotume kiekvieną komandą iš dešinės, viskas atrodytų labai paprasta. Taigi:

```
    gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort -u
```

Išarchyvuoja failą `/var/log/installer/initial-status.gz`. Jame bus surašyta meta informacija tų paketų, kurie pateko diegiant operacinę sistemą. Su `sed` komanda išrenkame jų pavadinimų eilutes, tik prieš tai pašaliname tekstą „Package: “. Vėliau surūšiuojame abėcėlės tvarka (bus svarbu kiek vėliau).

Antra komandos dalis yra:

```
    apt-mark showmanual | sort -u
```

Kaip jau minėjau anksčiau - gauname ranka įdiegtų programų sąrašą ir vėlgi - išrikiuojame abėcėlės tvarka.

Lieka paskutinė baisi dalis:

```
    comm -23
```

Kadangi jau iš praėjusių dviejų komandų turėsime du sąrašus - ką įdiegėme ranka ir kas jau buvo įdiegta su operacine sistema - beliko tik šiuos sąrašus sulyginti išrinkti tai, kas unikalu. Komanda `comm` skaičių argumentai mums duotų:

```
    -1 - neatvaizduoti pirmo sąrašo elementų
    -2 - neatvaizduoti antro sąrašo elementų
    -3 - neatvaizduoti tokių elementų, kurie pasikartoja sąrašuose
```

Taigi, mūsų atveju mums nereikia matyti viso sąrašo kas buvo įdiegta startuojant operacinei sistemai (argumentas -2) ir to, kas tuose sąrašuose buvo vienoda (argumentas -3).

Jeigu viską išsaugosite į failą, įdiegti bus labai paprasta:

```
    apt-get install $(cat ranka_idiegti_paketai.list)
```

Prieš daugelį metų tokį komandų sąrašą galima buvo gauti tik su `dpkg --get-selections` komanda. Ši komanda veikia ir dabar. Kadangi ji grąžina sąrašą įdiegtų programų (nebūtinai rankiniu būdu), tad su keleta komandų galima būtų lygiai taip pat atsirinkti ranka įdiegtas programas.

Tie, kas naudojasi grafine aplinka ir, pavyzdžiui, programa `Synaptic`, tai tokį sąrašą gali gauti ir be jokių komandų.

Yra Debian, bet nėra `apt-get`? Ir nenorite jo įdiegti? Laimei, sąrašą nesunkiai susikursite su `aptitude` programa:

```
    aptitude search '?installed ?not(?automatic)' -F '%p'
```

Komanda suras įdiegtas programas, kurios nebuvo įdiegtos automatiškai. Jeigu nepaduosite argumento `-F` (kaip parodžiau pavyzdyje) tai `aptitude` išves daug informacijos sąraše: paketų būsenas, pavadinimus ir aprašymus. Taigi '%p' užtikrina tik paketų vardų išvedimą.
