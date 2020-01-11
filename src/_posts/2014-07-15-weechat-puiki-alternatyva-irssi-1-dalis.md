---
title: Weechat - puiki alternatyva irssi, 1 dalis
category: weechat
image: i/placeholder.jpg
description: Weechat labai puiki alternatyva irssi IRC klientui. Ką gali Weechat, ko negali Irssi? Ir kodėl reikia keisti IRC klientą?
---

Irssi naudojau ne vienerius metus, bet vien tik todėl, kad anksčiau nesugebėjau surasti geresnių, terminale veikiančių, alternatyvų. Trumpai apie tai ką gali/turi atviro kodo IRC klientas `irssi`:

-   Automatinį prisijungimą prie kanalų.
-   Automatines komandas po prisijungimo (naudinga norint prisijungti prie registruotų kanalų).
-   Žinučių ir kitokių tekstų formatavimus.
-   Perl skriptų palaikymą.
-   Langų skaldymą.

Irssi turi didžiulę [išvaizdų bazę](http://www.irssi.org/themes). Vienas pavyzdžių, demonstruojantis `irssi` galimybes formatuoti išvestį:

![TZU tema kurią sukūrė Tzunamii](/i/tzu.png)

Galimybių tikrai daug. Ypač gerai, kad [irssi](http://www.irssi.org/) turi labai didelį [įskiepių sąrašą](http://scripts.irssi.org/). Kam tada ieškoti kitos alternatyvos?

Praleidę ne vienus metus prie `irssi` pastebėsite, kad įskiepius nors rašyti nesunku, bet testuoti juos ar padaryti minimalias korekcijas kartais būna per didelis vargas. API visai nėra tokia lengvai perprantama ir naudojama, kaip dokumentacijose galima perskaityti.

Vienos problemos kurios nesugebėjau niekada sutvarkyti: prisijungimas prie kanalų eilės tvarka. Nors ir nurodydavau eilės tvarką, net sudėjau pauzes, bet vistiek: `irssi` kanalus rasdavau išmėtytus atsitiktine tvarka.

Irssi konfigūracijų - reikia ieškoti. Jeigu galvojat, kad po įdiegimo rasite kažkokius failus, kurie padėtų susikonfigūruoti prisijungimą prie populiariausių IRC serverių (pavyzdžiui freenode), tai deja - teks naudoti Google, teks eksperimentuoti. O jeigu reikės susikonfigūruoti SSL prisijungimus (juk būtina!), tai... Sėkmės! :)

Ir pats baisiausias dalykas yra nuotoliniai pranešimai. Mėgstu IRC pasileisti serveryje ir laikyti, tam, kad visada galėčiau pasiskaityti kas įvyko. Taip pat, gerai, kai darbo metu ekrane iššoka pranešimas, kai kas pamini mano vardą. Išbandžiau tikrai ne vieną populiarų sprendimą, bet nei vieno neradau tokio, kuris po 4-6 dienų veikimo dar veiktų.

Kol kas tiek gero ir blogo apie irssi. Kitame straipsnyje papasakosiu apie `weechat` ir kodėl jis gali būti geresnis/produktyvesnis IRC klientas.
