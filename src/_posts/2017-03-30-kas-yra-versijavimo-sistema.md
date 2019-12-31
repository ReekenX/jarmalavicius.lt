---
title: Kas naujo Raspberry Pi 3 B+ modelyje?
permalink: /raspberry-pi/kas-naujo-raspberry-pi-model-3-plius-modelyje
category: raspberry-pi
image: i/raspberry_3_b_plius.png
description: Mokinatės programuoti ar užsiimate namų automatizavimu? Tuomet Raspberry Pi yra dalykas kaip tik Jums. Straipsnyje rasite palyginimą su Arduino.
---

Nedidelę mano namų elektronikos dalį sudaro Raspberry Pi (2 ir 3 modelio) elektronika surišta su keliais davikliais ir rėlėmis, aukštos įtampos reikalaujantiems įrenginiams kontroliuoti. Todėl labai nudžiugau neseniai pamatęs, kad kūrėjai išleido dar vieną versiją - Raspberry Pi 3 B+.

## Kodėl namų automatizavimui Raspberry?

Kodėl namų elektronikai nenaudoju daug pigesnio ir tam reikalui sukurtą Arduino? Dėl to, kad kompiuterį ir jo išvestis daug lengviau programuoti nei kažkokį lust'ą kuris pririša ne tik prie C kalbos, bet dar ir reikalingo atskiro išmanymo tūkstančiams daviklių.

Su Raspberry Pi viskas paprasčiau - atidarei prievadą (angl. „port“) ir bendrauji su kitais įrenginiais. Taip pat ir GPIO (jungtys ant Raspberry platformos kuriomis gali paduoti srovę įrenginiams arba nuskaityti jų duomenis) kontroliuoti kur kas paprasčiau. Kažkas neveikia korektiškai - prisijungi per „ssh“ prie Raspberry Pi įrenginio ir sutvarkai bėdas.

Kadangi Raspberry Pi dažniausiai būna prijungtas prie interneto (nes kokia prasmė automatizuoti namus ir nekontroliuoti jų iš išorės) - lengva pasidaryti monitoringą kur atsidaręs kažkokį web puslapį matytum kaip keičiasi temperatūra name ar garaže.

## Kas pasikeitė nuo versijos be pliuso?

Pažiūrėkime kaip atrodo naujasis modelis su pliuso ženklu:

<p class="text-center">
<img src="/i/raspberry_3_b_plius.png" />
</p>
<p class="text-center text-muted small">Raspberry Pi 3 B+</p>

Jeigu turite senesnį modelį, tai iškart į akis kris metalinis logotipas ir šiek tiek pasikeitęs procesoriaus čipas. Kas domisi įranga, tai yra Broadcom BCM2837B0, Cortex-A53 (ARMv8) 64-bit SoC @ 1.4GHz čipas.

Šiame įrenginyje yra 1GB RAM, LAN palaikymas, Wifi ir Bluetooth (v4.2). Taip pat yra ir Bluetooth Low Energy (BLE) palaikymas.

Dalykai kurie visiškai nepasikeitė:

- HDMI jungtis ir vieta.
- AUX jungtis ir vieta.
- Micro SD jungtis ir vieta (tam, kad galima būtų iš jos paleisti operacinę sistemą).
- Keturios USB 2 jungtys.

Nors turėsime tą patį 5V ir net 2.5A pakrovėją, galiu pagirti, kad tai vienas geriausių sprendimų iš autorių pusės. Teko susidurti, kad visokioms FHD kameroms prijungtoms prie Raspberry Pi reikia tikrai nemažai amperų. Tipinis 1A pakrovėjas gali nepavežti prijungtų įrenginių.

Dėl vos vos pasikeitusio procesoriaus greičio (nuo 1.2GHz iki 1.4GHz) turėtume greičio nepajusti. Tą patvirtina ir daug internete padarytų benchmarking'ų.

## Didžiausia naujovė - PoE

Naujame Raspberry Pi rasime ir tokią jungtį:

<p class="text-center">
<img src="/i/raspberry_poe.png" />
</p>
<p class="text-center text-muted small">Raspberry Pi 3 PoE</p>


Kai kurie routeriai vaizdo kameroms elektros srovę perduoda LAN kabeliu ir tai vadinama Power over Ethernet. Iš to laimima, kad įrenginiui nereikia dar kažkokio lizdo maitinimui, kurį dėtumėte į elektros lizdą.

Tokią galimybę ir Raspberry Pi 3 B+ turi. Tačiau tam, kad per LAN laidą užmaitintumėte Raspberry dar reikės nusipirkti šiam lizdui (nuotrauka viršuje) PoE Hat įrenginuką. Pastarasis kainuoja kažkur 17€.

## Kiek kainuoja Raspberry Pi 3 B+?

Kaip ir anksčiau, Raspberry kainos išlieka labai panašios. Šis įrenginys turėtų kainuoti apie 30 eur. Kiek brangiau iš oficialių parduotuvių (kaip Element14) ir kiek mažiau iš Ebay / Aliexpress.

## Ar verta atsinaujinti?

Jeigu automatizuojate namus - tikrai taip. PoE palaikymas geriausias dalykas kas nutiko šiam įrenginiui! Po Wireless ir Bluetooth palaikymo, žinoma.

Jeigu kitoms reikmėms - tikrai ne. Naujovės buvo skirtos su IT susijusioms reikmėms. Namų vartotojai negauna jokio greičio ar kitų privalumų.
