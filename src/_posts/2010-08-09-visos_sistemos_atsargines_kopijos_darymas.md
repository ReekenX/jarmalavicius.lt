---
title: Visos sistemos atsarginės kopijos darymas
permalink: /atviras-kodas/visos-sistemos-atsargines-kopijos-darymas
category: atviras-kodas
image: i/placeholder.jpg
description: Straipsnis apie tai, kaip pasidaryti visos sistemos atsarginę kopiją su tar komanda ir kaip archyvą išarchyvuoti.
---

Pastoviai daryti atsargines kopijas yra atsakingų ir protingų žmonių darbas. Tikrai ne visi, kiek man teko susidurti, daro visos sistemos (savo failų + operacinės sistemos konfigūracijų) atsargines kopijas.

O kodėl derėtų daryti atsargines kopijas operacinės sistemos konfigūracinių failų? Todėl, kad kada nors galite ką nors sugadinti instaliavę naują programą ar keičiant kai kuriuos nustatymus. Pvz viena iš tokių kritinių vietų yra X nustatymai. Todėl šiame straipsnyje pateiksiu savo rekomenduojamą būdą kaip tokias kopijas pasidaryti.

Praktiškai visada naudoju vos vieną komandą kuri paleidžiama kas tam tikrą laiko tarpą (dažniausiai kas naktį):

    tar -cvpzf backup.tar.gz \
          -–exclude=/backup.tar.gz \
          --exclude=/proc \
          --exclude=/lost+found \
          --exclude=/sys \
          --exclude=/mnt
          --exclude=/media \
          --exclude=/dev \
          /

Kaip matote, be archyvuojamo failo vardo (failų archyvavimas nepavyks, jeigu archyvuojamas failo vardas bus nukreiptas į tą pačią direktoriją kuri ir bandoma archyvuoti) nearchyvuoju dar kai kurių katalogų, nes:

/proc katalogas skirtas procesų informacijai saugoti. Kadangi ji pastoviai kinta, todėl jos nearchyvuojame. /lost+found katalogas kuriame saugomi failai rasti sistemos tikrinimo metu./sys katalogas skirtas informacijai apie pačią sistemą laikyti. /mnt katalogas skirtas laikyti failams, kurie riša kitas failų sistemas. /media katalogas skirtas laikyti failams, kurie riša medias: CD diskus, USB, video kamera ir pan. /dev katalogas skirtas tvarkyklėms saugoti.

Taigi, paleidžiame komandą, ilgai palaukime ir būkime ramūs dėl atsarginės kopijos. Šiek tiek apie panaudotus komandinės eilutės argumentus:

-   -c sukurti archyvą
-   -v spausdinti archyvuojamų failų sąrašą.
-   -p išsaugoti informaciją apie failų autorius ir failų skaitymo,
    rašymo ir paleidimo teises.
-   -z archyvuoja per gzip komandą.-f nurodymas archyvuoti į failą.

Atsarginės kopijos atstatymui pasinaudokite komanda:

    tar -xvf backup.tar.gz -C /

Argumentas -C reiškia, kad nesvarbu kokiame kataloge yra pats archyvas, viskas bus išpakuojama į aukščiausią direktoriją.

Na, o kitame straipsnyje papasakosiu kaip atsargines kopijas pasidaryti GUI (desktopinių programų) pagalba. Tačiau tai bus labiau apie asmeninių failų atsarginių kopijų saugojimą (aišku, drąsiai galima naudoti ir operacinės sistemos kopijoms).
