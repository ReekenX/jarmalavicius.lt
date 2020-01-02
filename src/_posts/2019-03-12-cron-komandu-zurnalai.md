---
title: CRON komandų žurnalai
category: atviras-kodas
image: i/crontab.png
description: Cron automatizavimui yra praktiškai neišvengiamas įrankis. Bet tas pats pagalbinis įrankis gali tapti didelė kančia surasti kas įvyko, jeigu neteisingai naudojama. Kaip sekti ir analizuoti Cron komandas.
---

Cron'as yra viena populiariausių automatizavimo programų. Nors automatizavimo komandas rašo tie patys programuotojai ir jiems spręsti kaip ir kas veiks - didelę bėdą Cron'as atneša, kada reikia aiškintis kas įvyko ir kada.

Kalbu apie žurnalų kūrimą.

Pavyzdinė `crontab` eilutė iš mano serverių:

```
*/5 9-20 *  * 2 /projektas/send_newsletter >> /logs/send_newsletter.$(date '+\%F').log 2>&1
```

Čia nagrinėkime ne tiek komandą ar kada ji vykdoma (antradienį, nuo 9 iki 20 valandos, kas 5 minutes), bet kur įrašomas žurnalas.

Žurnalas su komandos išvestimis bus pildomas į `/logs/send_newsletter.2019-01-01.log` failą (pavyzdys). Taip bus išsaugoma visa su komanda susijusi istorija, data kada kas įvyko ir su `logrotate` tokius failus galima automatiškai archyvuoti.

Būtina tiek `stdout` tiek `stderr` išvestis nukreipti į tą patį failą su `2>&1` - kad žurnale būtų įrašas jeigu įvyko kokios problemos.

Verta pabrėžti, kad `crontab` procento simbolis (%) atitinka naujos eilutės simbolį, todėl, kad nebūtų nukirptas failo vardas su `date '+%F'` komanda, reikia pasvirojo brūkšnelio prieš jį - `date '+\%F'`.
