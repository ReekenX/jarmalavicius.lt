---
title: Apie CRON ir procesų rakinimą
permalink: /atviras-kodas/apie-cron-ir-procesu-rakinima
category: atviras-kodas
image: i/placeholder.jpg
description: Kaip padaryti, kad CRON įrašai nepersidengtų su jau prieš tai paleistais procesais tos pačios komandos.
---

Ne kartą tekę į `CRON` rašyti tokias komandas, kurios turėtų pasivykdyti kas tam tikrą laiką, pavyzdžiui kas minutę ar kelias. Dideliuose projektuose šią bėdą lengva išspręsti išvis nenaudojant `CRON` - tiesiog „pabėgti“ į kokią nors užduočių eilės sistemą, kad ir [RabbitMQ](https://www.rabbitmq.com/).

Tačiau jeigu tokios galimybės nėra, o procesą reikia vykdyti labai dažnai, teks išspręsti pasikartojančių procesų bėdą. Kad vienu metu du ar daugiau procesų nedarytų to paties darbo (tarkime nedubliuotų išvesties).

Laimei, daugumoje Linux distribucijų jau yra įrankių šiai bėdai išspręsti. Viena iš tokių komandų yra `flock`. Jeigu netyčia savo distribucijoje šios komandos neradote, įdiegti greičiausiai bus labai paprasta. Debian sistemose:

```
    apt-get install flock
```

Analizuosime praktinę užduotį kurią `crontab -e` aprašėme taip:

```
    * * * * *  bash /kelias/iki/komandos.bash
```

Failo `/kelias/iki/komandos.bash` turinyje deklaruokime darbą kuris trunka daugiau nei vieną minutę, o paleidus jį kelis kartus - pridubliuotų duomenų. Pavyzdžiui:

```
    #!/bin/bash
    echo "Aš buvau pavykdytas." >> /tmp/eiga.log
    sleep 60
    cat /tmp/zurnalas.log >> /kelias/iki/pilno_zurnalo.log
    sleep 5
    rm /tmp/zurnalas.log
```

Progama nėra sudėtinga. Įsivaizduokime, kad failas `/tmp/zurnalas.log` yra pildomas taip dažnai, kad net nereikia tikrinti, ar jis tikrai egzistuoja. „Suseksime“, kiek kartų skriptas bus panaudotas failo `/tmp/eiga.log` turinio dėka. Jeigu paleisime skriptą tris kartus, turėtume pamatyti šiame faile tris eilutes „Aš buvau pavykdytas“.

Kokia „problema“ šiame skripte? Paleidus skriptą kas minutę atsitiktų taip, kad faile `/kelias/iki/pilno_zurnalo.log` gautume dubliuotą turinį. Išmėginkite patys!

Kad nuo to apsisaugotume apvilksime `cron` komandą aukščiau `flock` komanda:

```
    * * * * *  flock -n /tmp/bash.lock -c "bash /kelias/iki/komandos.bash"
```

Komanda `flock` turi nemažai galimybių, tačiau tiesą pasakius, suprasti jos `man` išvestį yra labai sunku. Trumpai paaiškinsiu aukščiau panaudotus argumentus.

Pirmiausiai komandos formatas yra toks:

```
    flock [argumentai] /kelias/iki/uzrakto.lock -c "komanda su argumentais"
```

Mano pavyzdyje argumentas `-n` reiškia, kad programa nelauks kol užrakto failas bus atrakintas ir iškart bus nutraukta. Taigi, jeigu skriptas dar po minutės ir toliau bus vykdomas ir norės pasileisti skriptas antrą kartą, antrasis, patikrinęs, kad komanda yra užrakinta - nepasileis.

Praktinis pavyzdys:

```
    flock -n /tmp/testas.lock sleep 50 # pasileis ir vykdysis 50 sek.
    flock -n /tmp/testas.lock sleep 50 # pasileis ir tuoj pat išsijunks
    flock -n /tmp/testas.lock sleep 50 # pasileis ir tuoj pat išsijunks
    flock -n /tmp/testas.lock sleep 50 # [..]
```

Naudingas yra ir `-w LAIKAS` argumentas, kurio dėka galima liepti skriptui palaukti tam tikrą laiką sekundžių, kol bus atrakintas užraktas komandai pavykdyti. Pavyzdžiui `cron` eilutės atveju, kad neatsitiktų taip, jog pasivykdžius pirmam skriptui minutę ir keletą sekundžių nereikėtų laukti sekančios minutės pradžios. Tokiu atveju skriptas vykdytųsi nulinę minutę ir antrąją, iš viso per tris minutes pasivykdydamas maksimum tris kartus. Kad ta atkarpa būtų mažesnė, galima nustatyti kažką panašaus:

```
    * * * * *  flock -w 30 /tmp/bash.lock -c "bash /kelias/iki/komandos.bash"
```

Bus laukiama užrakto failo net 30 sekundžių. Nenustatykite šio laiko per daug mažo, kad nebūtų programa paleidžiama dažniau nei reikia!

Kitame straipsnyje parodysiu kaip `flock` gali padėti apsaugoti kai kurias `bash` skriptų vietas su užraktu ir kaip veikia užrakinimo failas.
