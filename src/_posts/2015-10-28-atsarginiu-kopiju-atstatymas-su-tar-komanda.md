---
title: Atsarginių kopijų atstatymas su tar komanda
permalink: /atviras-kodas/atsarginiu-kopiju-atstatymas-su-tar-komanda
category: atviras-kodas
image: i/placeholder.jpg
description: Kaip tvarkingai daryti atsargines kopijas su tar komanda. Kaip rasti tinkamą archyvą dideliame archyvų kataloge ir kaip tą archyvą atstatyti.
---

Atsargines kopijas, tikriausiai, daro daugelis. Taip pat ir jas atstatinėja. Man, asmeniškai, tenka tai daryti gal iki 4 kartų per metus. Nedažnai, bet tenka.

Tokiais atvejais labai svarbu tinkama reakciją į jų atstatymą: iš anksto suplanuota schema kaip jie bus atstatomi ir aiški sistema kaip tos atsarginės kopijos kaupiamos.

Atsarginių kopijų kaupimui galima naudoti iš esmės bet ką: specializuotas saugyklas (pvz. [S3 storage](https://aws.amazon.com/s3/)), [Googlea Storage](https://cloud.google.com/storage/) (kokį „Nearline“ ar pan.), rašyti į atskirą dedikuotą serverį-kaupyklą arba tiesiog saugoti kokioje nors atmintyje - tarkim dedikuotame HDD/SSD.

Formatas saugojimo taip pat nėra svarbus, svarbiausiai tik tai, kad jis užtikrintų duomenų saugojimą, paprastą-greitą atstatymą ir būtų galimybė patogiai indeksuoti.

Daugiau nei penketą metų atsargines kopijas laikau `.tar.gz` failuose. Formatas yra atviro kodo, patikimas, jo rezultatai užima mažiau disko vietos. Atsargines kopijas darau pagal tokias taisykles kurias išgryninau per daugelį metų:

* Į vieną archyvą atskirai dedu „vieną projektą“. Tai gali būti interneto svetainės turinys su kodu, arba duomenų bazė, arba kažkoks katalogas. Čia naudojau jungtuką „arba“, nes niekada į vieną archyvą nededu kelių: ir duomenų bazės ir kitų failų.
* Archyvuotą `.tar` failą visada „suzipuoju“, kad užimtų mažiau vietos (su `tar -cZ`).
* Atsargines kopijas reikia daryti kaip įmanoma dažniau - geriausiai net po kelis kartus per dieną.

Išmokta pamoka - vienas sunkiausių dalykų darant atsargines kopijas yra patogus saugojimas (failų pavadinimai). Indeksuoju archyvus katalogais. Pirmas katalogas būtų „mašinos vardas“, vėliau sektų informacijos tipas, vėliau metai ir viduje archyvai pagal mėnesius ir datas.

Taigi, kaip atrodo kelias iki pavienes saugyklos:

```
    /backups/serveris-1/websites/2015/2015-10/2015-10-01_13:59_example.org.tar.gz
```

Oh, kiek metų dubliavimo! Taip. Ir patikėkite, jis labai reikalingas (skaitykite toliau).

Pavyzdžiui svetainės `example.org` visų archyvų paieškai galime panaudoti:

```
    find -iname '*example.org.tar.gz'
```

Arba saugyklai labai išsipūtus, galima paimti ir ankstesnius metus, pavyzdžiui `/backups/serveris-1/websites/2014` perkelti į [Amazon Glacier](https://aws.amazon.com/glacier/) kur jie bus pigiai saugomi. Aišku, tokia saugykla, jeigu Jums teko kada naudotis, turi minusą, kad prie failų prieisite tik po keletos valandų, jeigu bus poreikis. Bet čia ir esmė saugoti juos tik tam, kad turėti (turiu omeny „tokius senus archyvus“). O pinigine prasme tikrai verta! Labai panašiai veikia ir [Google Nearline](https://cloud.google.com/storage/docs/nearline?hl=en) tik jos duomenų atidavimas yra greitesnis.

Na, ir keletas tipsų apie greitą duomenų atstatymą. Pirmiausiai, tai turint `.tar.gz` Jums nereikės `gunzip` pavykdyti prieš dirbant su atsargine kopija. Čia užteks `tar -z` pagalbos.

Pradžiai tikriausiai visada reikės pasižiūrėti kas yra archyve:

```
    tar -tvzf 2015-10-01_13:59_example.org.tar.gz | less
```

Suradus tam tikrą failą ar katalogą galime jį atstatyti:

```
    tar -xzfv 2015-10-01_13:59_example.org.tar.gz kelias/iki/katalogo/ar/failo
```

Užrašymui „ant viršaus“ naudojame („tikras atstatymas“):

```
    tar -xzfv 2015-10-01_13:59_example.org.tar.gz -C /var/www
```

Mano aukščiau naudotų komandų argumentų paaiškinimai:

* -t -v - atspausdina kas yra archyve.
* -f - išveda failus į failų sistemą.
* -z - reikalingas dirbti su „zipuotais“ failais. Turint tik `.tar` plėtinį šios komandos nereikia.
* -x - yra išarchyvavomo komanda.
