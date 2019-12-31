---
title: Atsarginių kopijų darymas su komanda - dd
permalink: /atviras-kodas/atsarginiu-kopiju-darymas-su-dd-komanda
category: atviras-kodas
image: i/placeholder.jpg
description: Straipsnis apie atsarginių kopijų daryma terminalo pagalba su Linux/Unix komanda dd.
---

Praėjo labai daug laiko po mano pastarojo straipsnio apie atsarginių kopijų darymą [su tar komanda](/atviras-kodas/visos-sistemos-atsargines-kopijos-darymas). Nors anksčiau jas darydavau būtent šiuo įrankiu, dabar darau su kitu.

Kodėl buvau pasirinkęs būtent tar? Pirmiausiai dėl naudojimo paprastumo. Taip pat dėl to, kad tar komanda yra bet kuriuose Linux'uose. Toks atsarginių kopijų darymas yra labai primityvus, todėl lenga išmokti ir naudotis.

Šiandien kalbėsiu apie kiek sudėtingesnį įrankį, tačiau su juo atsargines kopijas darausi ne tik savo kompiuterių ar serverių, bet dar ir įvairių įrenginių, kaip pavyzdžiui Ipod ar tiesiog USB atmintinių. Kalbu apie komandą kurią rasite savo Linux'uose - dd.

Komanda dd, priešingai nei tar kuria ne failų archyvą, o visą particijų lentelę sukiša į norima išvestį (dažniausiai failą). Pavyzdžiui jeigu su fdisk -l matome savo USB įrankį su jame esančiomis particijomis:

    $ fdisk -l
    Device Boot         Start         End      Blocks   Id  System
    /dev/sde1              63     7887914     3943926    b  W95 FAT32

Tokios particijų lentelės atvaizdą galime išsaugoti lengvai į failą:

    dd if=/dev/sde of=kopija.img

Čia turėčiau paminėti jog yra skirtumas tarp užrašų /dev/sde1 ir /dev/sde. Jeigu Jūs į vieną kopija.img norite sukišti kelias to įrenginio particijas, tai reikėtų saugoti visą medį. Tokiu atveju reikėtų rašyti tiesiog /dev/sde. Tačiau jeigu iš viso medžio reikia Jums tik vienos particijos, rašykite /dev/sde1. Įrenginio ID (mano atveju sde ir sde1) pas Jus gali skirtis, todėl atidžiai peržiūrėkite koks Jūsų ID prieš ką nors darant. Galbūt kuriant atsarginės kopijos atvaizdą ir nėra baisi klaida suklysti, bet suklysti atstatinėjant - siaubinga. Netgi gali baigtis labai svarbių dokumentų praradimu.

Nors pats tokias atsargines kopijas darausi jau gana seniai (bent metus tikrai), bet turiu paminėti keletą minusų.

Pirmiausiai dėl to, kad kopijuojama visa particija (ar visas medis), atvaizdo dydis tampa laibai didelis. Jeigu particija užima 10 GB, o joje yra failų 2 GB - sukurtas failas kopija.img svers vis tiek 10 GB. Kadangi į failą reikia įrašyti/perkopijuoti visus baitus, tai toks duomenų kiekis trunka pakankamai ilgai. Pvz viename iš kompiuterių Debian sistemą su 10 GB archyvuoja \~14 minučių (daug!), tiek pat laiko ir atstatinėja.

Kitas minusas - nelabai išeina daryti versijavimo. Tarkime laikyti laikyti kelių dienų atvaizdus dar nieko, bet ilgiau - užims laaaabai daug disko vietos. Rezultate - komanda trunka lėtai ir jos išvestis dažnai užima labai daug. Kam tada išvis tokias kopijas darytis?

Pirmiausiai darydamas Debian sistemos atsarginę kopiją esu 100% tikras, kad atstatęs gausiu 100% tokią sistemą, kurią turėjau šios kopijos darymo dieną. Tokias atsargines kopijas jau tikrai bent 15 kartų atstatinėjau įvairiems įrenginiams.

Labai praktišką panaudojimą atradau, kai viename iš draugo USB buvo įrašyta Suse, o man į USB reikėjo įrašyti Debian'ą ir po to atgal Suse. Toks rankinis kopijavimas (pvz. rsync pagalba) būtų velniškai ilgai trukęs, o `dd` komandos pagalba per kelias minutes viską sutvarkiau. Pasidariau Suse atsarginę kopiją, pasidariau ko reikia ir atstačiau ją atgal.

O atstatyti padarytą kopiją labai paprasta:

    dd if=kopija.img of=/dev/sde

Čia vėlgi - prisiminkite ką rašiau apie skirtumą tarp /dev/sde ir /dev/sde1.

Tiesa, `dd` komanda turi labai daug argumentų ir panaudos atvejų. Būtinai paskaitykite apie ją `man dd`. Parašęs šį straipsnį supratau, kad ši komanda verta dar vieno, nes panaudos atvejų tikrai daug.
