---
title: Cron komandų žurnalai
category: atviras-kodas
image: i/crontab.png
description: Cron automatizavimui yra praktiškai neišvengiamas įrankis. Bet tas pats pagalbinis įrankis gali tapti didelė kančia surasti kas įvyko, jeigu neteisingai naudojama. Kaip sekti ir analizuoti Cron komandas.
---

Cron'as yra populiariausia programinė įranga sistemų automatizavimui. Nors automatizavimo
komandas rašo tie patys programuotojai ir jiems spręsti kaip ir kas veiks - didelę bėdą
Cron'as atneša, kada reikia aiškintis kas įvyko ir kada.

Kalbu apie žurnalų kūrimą ir jų peržiūrą.

Tipinė Cron eilutė (su `crontab -l` pagalba) iš mano serverių:

```
@daily /siusti-naujienlaiski >> /logs/siusti-naujienlaiski.$(date '+\%F').log 2>&1
```

Iš pavadinimų bus aišku, kad:

* Komanda paleidžiama kiekvieną dieną (`@daily`).

* Komanda siunčia naujienlaiškį (`/siusti-naujienlaiski`).

Visada verta laikyti žurnalą ir jį pildyti. Dėl to naudojamas peradresavimas su
`>>` kuris sukuria naują žurnalo failą jeigu jo nėra arba papildo egzistuojantį
žurnalą / failą.

Žurnalas su komandos išvestimis bus pildomas į
`/logs/siusti-naujienlaiski.2019-01-01.log` failą (failo vardo pavyzdys su data).
Taip bus išsaugoma visa, su komanda susijusi, istorija: dienos data ir
komandos išvestis. O su `logrotate` pagalba tokius failus galima automatiškai
archyvuoti. Pavyzdžiui paliekant tik paskutinius 7 žurnalus ar pan.

Asmeniškai aš žurnalus dar ir saugoju į atsarginių kopijų diską. Šią informaciją
tikrai versta saugoti - kas jeigu paaiškėtų, kad Cron komanda (šiuo atveju
`/siusti-naujienlaiski`) veikė nekorektiškai jau kurį laiką? Žurnalų failas būtų
viena iš vietų kur galima būtų tikrinti pasėkmes.

Būtina tiek `stdout` tiek `stderr` išvestis nukreipti į tą patį failą su `2>&1`
komandos gale - kad žurnale būtų įrašas jeigu įvyko kokios problemos.

Nenurodžius `2>&1` klaidos bus pristatomos į Linux naudotojo paskyrą su kuria vykdoma
Cron komanda. Todėl patogu nurodyti administratoriaus el. pašto adresą (tikrą)
jeigu sistemoje yra įdiegtas SMTP. Tą galima padaryti su `crontab -e` bet kur
palikus tokią komandą:

```
MAILTO=pastas@domenas.lt
```

Verta pabrėžti, kad `crontab` procento simbolis (%) atitinka naujos eilutės
simbolį (to daug kas nežino), todėl, kad nebūtų nukirptas failo vardas su `date '+%F'`
komanda, reikia pasvirojo brūkšnelio prieš jį - `date '+\%F'`.

Be brūkšnelio prieš procentų simbolį `%` Cron'as komandą perskaitytų taip:

```
@daily /siusti-naujienlaiski >> /logs/siusti-naujienlaiski.$(date '+%
F').log 2>&1
```

ir tai greičiausiai sugadintų rezultatą kurio tikitės.
