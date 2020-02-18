---
title: Cron geriausios praktikos
category: atviras-kodas
image: i/crontab.png
description: Po daugiau nei 10 metų Linux sistemų administravimo dalinuosi geriausiomis
  praktikomis kaip konfigūruoti Cron periodinių užduočių valdymo sistemą ir ką reikėtų
  žinoti.
toc: true
date: 2020-02-18 14:44 +0200
---
Praleidęs daugiu nei 10 metų administruodamas serverius ir įrangą juose nusprendžiau pasidalinti
patirtimi ir geriausiomis praktikomis kaip administruoti Cron darbus.

Periodinių užduočių valdymo sistema - [Cron](http://man7.org/linux/man-pages/man8/cron.8.html) -
viena populiariausių programinių įrangų Linux sistemose.

Apie ją turėti žinoti kiekvienas IT srityje dirbantis žmogus.

Sunkiai rastume projektą kuris kaip nors išgyventų be periodinių užduočių: el. laiškų siuntimo,
naujienlaiškių siuntimo, laiškų tikrinimo, duomenų generavimo, duomenų importavimo, duomenų
siuntimo ar kito darbo su trečiųjų šalių sistemomis (tarkime API).

Išmokti valdyti Cron nėra sudėtinga, o žinios, kuriomis pasidalinsiu, galėtų padėti išvengti
dažnai pasitaikančių bėdų ar nesusipratimų.

<!-- toc -->

## Susipažinkime kas yra Cron

**Cron yra paprasčiausia programa** (demonas, jeigu tiksliau) kuris nuolat veikia operacinėje sistemoje
ir laukia nurodyto laiko kada bus galima pavykdyti komandą.

Labai svarbu pabrėžti, kad **Cron yra tik programinė įranga. Tai nėra operacinės sistemos dalis**.

Dėl to, kad tai tik programa, ją galima išdiegti (`apt uninstall cron`) arba jos vietoje įdiegti
kitą periodinių užduočių valdymo programą.

Programų / konkurenčių yra tikra gausybė. Bet šis straipsnis nebus apie tai.

Kaip pavyzdys - jeigu parašėte programą, kuri patikrina elektroninius laiškus ir jeigu yra naujų -
apie tai informuoja savininką SMS žinute, tai Cron yra būtent tai ko Jums reikia.

Tokiu atveju greičiausiai norėsite, kad programa veiktų tarkime kas 15 minučių. Būtent Cron ir
bus ta sistema kuri paleis komandą nurodytu intervalu.

## Cron konfigūravimo pradžia

Iš esmės viskas ko reikia, tai pavykdyti redagavimo komandą `crontab -e`, nustatyti laiką
kada komanda turi būti vykdoma ir įrašyti komandos aprašą.

Tipiškai po šios komandos įvykdymo atsidaro tekstų redaktorius (`nano` arba `vim`) kuriame rašysite
kažką panašaus:

```
* 0 * * * komanda
```

Pirmi penki skaičiukai reiškia laiką kada vykdyti komandą: minutės (0 - 59), valandos (0 - 23),
mėnesio diena (1-31), mėnuo (1 - 12) ir savaitės diena (0 - 7, kur tiek 0 tiek 7 reiškia
sekmadienį).

Tokios laiko konfigūracijos užtenka suplanuoti užduotį pavykdyti praktiškai bet kada.

Žemiau keli praktiniai konfigūravimo pavyzdžiai.

Importuoti prekes iš kitos sistemos penkios minutės po vidurnakčio:

`5 0 * * * importuoti-prekes`.

Kiekvieno mėnesio dešimtą dieną ir 9:45 min. išsiųsti algalapius:

`45 9 1 * * siusti-algalapius`

Sudėtingesnius laiko intervalus nurodyti taip pat galima. Pavyzdžiui kiekvieną pirmadienį 9 ryto
tikrink ar „įkrito“ naujas užsakymas kas 5 minutes:

`*/5 9 * * 1 kur-uzsakymai`

Kas pusvalandį išsiųsk šimtą naujienlaiškių (kiekvieną penkioliktą ir keturiasdešimt penktą minutę):

`15,45 * * * siusk-100-naujienlaiskiu`

Arba tik darbo metu tikrink ar yra pranešimų iš klientų kas penkiolika minučių:

`*/15 8-17 * * * ar-yra-laisku`

O jeigu leidžiate darbuotojams atsikvėpti ir jie gali per pietų pertraukas nedirbti, tai:

`*/15 8-12,13-17 * * * ar-yra-laisku`

Daug kas nežino, tačiau žvaigždutė Cron nėra reikšmė „visada“. Žvaigždutė reiškia intervalą nuo
mažiausios iki didžiausios reikšmės. Tarkime žvaigždutė (`*`) minutėse reikštų `0-59` intervalą.

## Cron sintaksė

Tuščios eilutės, be reikalo palikti tarpai ir tabuliacijos ženklai yra ignoruojami. Todėl jų galite
palikti kiek tik norite.

Todėl dvi eilutės žemiau darys lygiai tą patį:

```
*/5 9 * * 1 kur-uzsakymai

*/5	9	*	*	1	kur-uzsakymai
```

Geriau tuo nepiktnaudžiauti, o pasinaudoti praktiškesniu būdu tvarkingai komentuojant savo aprašus:

```
# minutės  valandos  diena  mėnuo  sav. diena  komanda
*/5        9         *      *      1           kur-uzsakymai
```

Kai turėsite labai daug eilučių - tikrai pravers.


## Cron trumpiniai

Standartinis Cron taip pat duoda galimybę naudoti trumpinius, kurie yra labai patogūs tais atvejais,
kada nereikia itin didelio tikslumo: `@hourly`, `@daily`, `@weekly`, `@monthly`, `@annually`,
`@yearly`.

Tarkime kasdien komandą galima sutrumpinti su `@daily` (abi eilutės darys tą patį):

```
0 0 * * * komanda
@daily komanda
```

## Cron trumpinys - @reboot

Yra dar specialus trumpinys `@reboot` - komanda bus įvykdyta tik vieną kartą po mašinos įjungimo.

Tai gali būti naudinga paleisti kokius servisus ar pranešimus tik kartą.

Arba jeigu neturi disciplinos - `@reboot sleep 8h && poweroff` - kompiuterį išjungti po 8 valandų
darbo.

## Specialūs Cron simboliai

Nors komandos pavadinimą gali sudaryti bet kokie simboliai, labai svarbu žinoti, kad paprastai
procentų simbolio naudoti negalite (`%`). Prieš jį naudojant reikia pasvirojo brūkšnelio `\`
simbolio.

Šis simbolis Cron atitinka naujos eilutės simbolį. Ši problema gali lengvai atsirasti jeigu
naudojate `date` komandą, pvz:

```
@daily siusti-naujienlaiski > $(date '+%F').log
```

Tokią komandą Cron nukirps, ir ji taps:

```
@daily siusti-naujienlaiski > $(date '
```

Ir nesuveiks. Žemiau komanda darys ką Jūs norite:

```
@daily siusti-naujienlaiski > $(date '+\%F').log
```

## Komentarai

Visada šaunu savo Cron įrašuose palikti komentarus. Juos galite palikti eilutę pradėję su `#` simboliu:


```
# Siunčia reklamą kas savaitę
@weekly siusti-naujienlaiski
```

Verta žinoti, kad komentarų, priešingai nei programavimo kalbose, negalima niekur kitur
rašyti. Pavyzdžiui žemiau esanti eilutė neveiks:

```
@weekly siusti-naujienlaiski # Siunčia reklamą kas savaitę (ši eilutė neteisinga)
```

## Cron komandų vykdymo laikai žmonių kalba

Pradedančiąjam gali būti sunku konfigūruoti Cron laikus. Laimei, yra įrankių internete,
kurie gali konvertuoti į žmonių kalbą Cron išraiškas (jeigu tiksliau - į anglų kalbą):
[www.freeformatter.com/cron-expression-generator-quartz.html](https://www.freeformatter.com/cron-expression-generator-quartz.html).

## Cron standartinė aplinka

Cron visada savo komandas pradeda su `/bin/sh` aplinka. Kas čia yra gerai, kad taip taupoma
atmintis ir greitis. Antras didžiulis privalumas - `sh` yra visose Linux sistemose. Todėl
Jūsų komandos tikrai veiks visur.

Kas blogai, kad tikrai ne kartą susidursite, jog kažkokia komanda neveiks, nes greičiausiai
tikitės kažko daugiau nei `sh` gali pasiūlyti. Juk `/bin/bash` yra naujesnė `sh` versija.

Skirtumų tarp `sh` ir `bash` yra labai daug. Dėl įdomumo tik kelis galima paminėti:

* `sh` neturi masyvų.

* Daugelis tipinių `bash` komandų neveiks: `source`, `function`, `let`, `declare`...

* Išvesties palaikymas su `<<<SKYRIUS`

* Ir daug daugiau.

Todėl jeigu reikia Cron skriptuose `bash` aplinkos, galite įjungti ją visoms komandoms:

```
SHELL=/bin/bash

# Siunčia reklamą kas savaitę
@weekly siusti-naujienlaiski
```

Prieš ir po lygybės simbolio (`=`) gali būti tarpai.

Deja tik keletas aplinkos kintamųjų šioje aplinkoje leidžiami: `LOGNAME` (prisijungusiojo
vardas), `HOME` (kelias iki namų katalogo), `SHELL` (aplinka kurią ką tik nagrinėjome),
`MAILTO` (skaitykite skyrių žemiau).

## Laiškai apie klaidas - MAILTO

Greičiausias būdas gauti pranešimus kai kažkas blogai sistemoje - registruoti paštą su
aplinkos kintamuoju `MAILTO`:

```
MAILTO=klaidos@example.com

@weekly siusti-naujienlaiski
```

Čia reikėtų žinoti du dalykus. Be jokios konfigūracijos ir be jokio `MAILTO=` sakinio, Cron
visas išvestis išsiųs Cron komandų savininkui (tam kas sukūrė / įrašė komandas).

Išsiųsti laiškus į „išorę“ galima tik jeigu sistemoje yra įdiegtas ir sukonfigūruotas
toks siuntimas (`smtp`).

## Komandų standartinis žurnalas

Visos komandos kurios bus paleistos galima rasti standartiniame `syslog` žurnale:

```
grep CRON /var/log/syslog
```

Išvestis bus kažkas panašaus į tai:

```
Feb 12 13:17:01 server CRON[8029]: (root) CMD (cd / && run-parts --report /etc/cron.hourly)
Feb 12 13:30:01 server CRON[8292]: (root) CMD (docker exec -i grafikas-prod-web python manage.py send_pending_replacement_alerts)
Feb 12 13:45:02 server CRON[11724]: (root) CMD (docker exec -i grafikas-prod-web python manage.py send_email_about_coming_duties)
```

Deja, iš žurnalo bus ne tiek ir daug naudos. Matysite kada komanda buvo paleista,
koks naudotojas paleido (šiame pavyzdyje `root`) ir kokia komanda paleista.

## Komandų išvesties žurnalas

Tai dalykas kuriuo teks pasirūpinti patiems. Cron nuostabus įrankis, tačiau didelę bėdą Cron
atneša, kada reikia aiškintis kas įvyko konkrečiai. Komanda gal ir buvo paleista norėtu laiku,
bet ar ji padarė būtent tai ko norėjote?

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
viena iš vietų kur galima būtų tikrinti pasekmes.

Būtina tiek `stdout` tiek `stderr` išvestis nukreipti į tą patį failą su `2>&1`
komandos gale - kad žurnale būtų įrašas jeigu įvyko kokios problemos.

Nenurodžius `2>&1` klaidos bus pristatomos į Linux naudotojo paskyrą su kuria vykdoma
Cron komanda. Todėl patogu nurodyti administratoriaus el. pašto adresą (tikrą)
jeigu sistemoje yra įdiegtas SMTP. Tą galima padaryti su `MAILTO` apie kurį rašiau
anksčiau.

## Laiko juosta žurnaluose

Jeigu sistema sukonfigūruota kažkokiai laiko juostai (arba tiesiog standartiškai UTC) ir
neturite galimybių pakeisti jos operacinėje sistemoje, gali būti pravartu panaudoti `CRON_TZ` aplinkos
kintamąjį. Cron gerbs laiko nustatymą ir tas laikas bus matomas žurnale.

Tai gali būti labai svarbu, jeigu sistemos laiko juosta yra UTC, o Jūsų paties juosta yra Lietuvos,
tai žurnaluose turėsite 2-3 valandų skirtumą priklausomai nuo to kaip pasuktas/atsuktas laikrodis
tam sezonui.

Laiko juostų vardus Linux sistemose sužinoti galima su komanda `timedatectl list-timezones`.

Lietuvos laiko juosta apsirašytų: `Europe/Vilnius`.

Gerai ir tai, kad sistema sureaguos į valandų pasukimus / atsukimus ir nieko papildomai konfigūruoti
nereikės.

## Komandų išvesties žurnalas (2 dalis)

Praeitame skyriuje minėtas žurnalų kūrimas patogus tik tada, kai galite sau leisti
žurnalus įrašinėti į diską ir turite laiko sukonfigūruoti `logrotate`, kad tie
žurnalai neužimtų disko vietos. Disko vieta ypač svarbus kriterijus kuriant mikroservisus.

Todėl jeigu norite komandų išvestį registruoti tame pačiame `syslog` faile, tuomet
padės komanda `logger`:

```
@hourly tikrinti-pasta 2>&1 | logger
```

Visas komandų klaidas rasite `/var/log/syslog`. O Linux, be jokių konfigūracijų rotuos tą
failą ir taip neužkimšite disko vietos.

## Kur nutrūko bash skriptas?

Jeigu esate `bash` mylėtojas kaip aš, tai greičiausiai ne viena Jūsų komanda bus `bash`
skriptas. Deja, kartais neaišku kas su skriptu negerai atsitiko ir kur/kodėl jis nutrūko.

Laimei, kiekvieną įvykdytą eilutę galima atspausdinti į išvestį jeigu skriptas turės
`set -x` nustatymą skripto pirmose eilutėse.

Pavyzdžiui:

```bash
#!/bin/bash

set -x

echo Testas | mail -s "Laiško tesstas" dev@example.com
```

Savo žurnaluose pamatysite eilutes kurios buvo vykdomos:

```
+ echo Testas
+ mail -s 'Laiško tesstas' dev@example.com
```

Taip galėsite greičiau atsekti kur programa nutrūko.

## Komandų žudymas

Cron konfigūravimas iš esmės turi du iššūkius - žurnalų laikymą (rašiau apie tai aukščiau) ir
komandų vykdymo „perlipimus“.

Kad viena komanda neprasidėtų kai kita dar nebaigė darbo, būtina nustatyti rėžius ir „užmušti“
komandų procesus jeigu komanda nespėjo padaryti savo darbo.

Praktikoje tai dažniausiai sutinkama su naujienlaiškių siuntimais. Tarkime kas 2 minutes siunčiate
100 el. laiškų. Cron aprašas galėtų būti toks:

```
*/2 * * * * siusti-naujienlaisius
```

Ir kaip dažnai atsitinka, kad komanda nespėja užbaigti savo darbo per planuojamą laiką.

Tarkime praktikoje išsiųsti 100 laiškų per 2 minutes neturėtų būti problema ir dažnu atveju tai
veiks.

Tačiau bus dienų kai viskas veiks daug lėčiau arba pasieksite kažkokius el. laiškų siuntimo limitus
kurie neleis per 2 minutes tiek išsiųsti.

Todėl jeigu parašyta komanda neužtikrina „persipynimo“ ir dvi komandos įvykdytos vienu metu
sudubliuos darbą - greičiausiai papulsite į bėdą.

Čia nesusipratimų išvengti padės `timeout` komanda, kuri irgi dažnai randama tarp standartiškai
įdiegtų Linux komandų.

Naudojimosi aprašas būtų toks: `timeout LAIKAS KOMANDA`. Pavyzdžiui: `timeout 2m siusti-naujienlaiski`.

Cron apraše tai atrodytų taip:

```
*/2 * * * * timeout 2m siusti-naujienlaisius
```

Naudojantis `timeout` reikia žinoti, kad sistemos žurnale `syslog` rasite eilutę kuri pasakys, kad
Cron komanda buvo nutraukta.

Iš patirties rekomenduočiau nenustatinėti `timeout` ir Cron reikšmių santykiu 1:1.

Nes jeigu komanda vykdo kažką kas stipriai apkrauna CPU (tarkime iš kitos sistemos importuoja
didelį srautą duomenų), tai nužudžius komandą ir vėl paleidus CPU vėl turės dirbti dideliais
apkrovimais dar nespėjus tvarkingai išsivalyti savo atmintį ar Swap.

Turbūt geriausias variantas būtų turėti kažką panašaus:

```
*/5 * * * * timeout 2m siusti-naujienlaisius
```

O pritaikius skyrių apie žurnalus:

```
*/5 * * * * timeout 2m siusti-naujienlaisius >> /logs/siusti-naujienlaiskius.$(date '+\%F').log 2>&1
```

## Cron savininkas

Geriausiai būtų, kad savo komandų neaprašinėtumėte kaip `root` (tarkime `sudo crontab -e`), nes taip
sudarysite tikrai daug sąlygų saugumo spragoms atsirasti.

Tarkime jeigu Cron aprašas `root` naudotojo paskyroje yra toks:

```
@hourly /usr/bin/siusti-naujienlaiski
```

Tai užtektų kam nors rašymo teisių į `/usr/bin/siusti-naujienlaiski` ir viskas, šis žmogus galėtų
lengvai pats tapti `root` naudotoju. O tada - galėtų prieiti prie visko sistemoje.

Taigi visada Cron aprašinėkite su paprasto naudotoju ir nenaudokite jokių `sudo` (nei komandoms
aprašuose, nei paties Cron neredaguokite).

## Cron atmintinė

Tikiuosi straipsnis buvo naudingas.

Jeigu reikėtų atmintinę parašyti („špargalkę“), tai atrodytų taip:

```
# Failas redaguojamas su: crontab -e

# Standartinis `sh` pakeičiamas į `bash` nes reikia spec. funkcijos `source`
SHELL = /bin/bash

# Naudoti lietuvišką laiko juostą
CRON_TZ = Europe/Vilnius

# Apie nesėkmes siųsti laišką sistemų administratoriui
MAILTO = dev@domenas.lt

# Importuoti prekes kartą į dieną (bet kada)
@daily importuoti-prekes

# Siųsti savaitės naujienlaiškį kiekvieno mėnesio pirmą dieną, o
# visus gavėjus išsaugoti /var/log/syslog faile
* * 1 * * siusti-savaitini-naujienlaiski | logger

# Tikrinti ar yra naujų užsakymų darbo laiku
*, 8-12,13-17 * * * ar-yra-uzsakymu > /logs/uzsakymai.log 2>&1

# Paleisti Django komandą dėl kurios reikia bash
@hourly source .virtualenv/bin/activate && python manage.py siusti-naujienas
```

Jeigu patys naudojate Cron alternatyvas (`anacron`, `fcron`, `hcron` ar kažką kito) -
būtų smalsu sužinoti dėl ko juos naudojate.
