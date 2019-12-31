---
title: Logcheck ignoruojamų taisyklių tikrinimas
category: atviras-kodas
image: i/logcheck-ignoruojamu-taisykliu-tikrinimas.png
description: Logcheck yra puiki programinė įranga kuri gali pranešti apie įvarias problemas serveriuose. Tačiau testuoti šio įrankio taisykles ganėtinai sunku.
---

Neįsivaizduoju serverio kuriame neveiktų [logcheck](http://freshmeat.net/projects/logcheck). Kas dar neturėjo progos patyrinėti šios programinės įrangos -  pasakysiu, kad tai tiesiog paprasta programėlė kuri pasirūpina, kad būtumėte informuotas kai klaidų žurnalas pasipildo.

Kaip ir WEB programuotojui taip ir  serverių administratoriui, kuris nori žinoti kas vyksta serveriuose, `logcheck` yra tikras išsigelbėjimas. Tik įdiegus (užteks paprasto `apt-get install logcheck`) reikės susikonfigūruoti apie ką norėsite būti informuotas. Faile `/etc/logcheck/logcheck.conf` rasite ne tik konfigūracijos nustatymus, bet ir jų aprašymus komentaruose. Todėl atskirai jų nenagrinėsiu.

**Logcheck konfigūracijų rekomendacijos**

Mano pirma rekomendacija būtų nusistatyti `paranoid` pranešimų lygį. Žymiai geriau gauti labai daug žinučių ir atsifiltruoti ko nereikia, negu kažką pražiopsoti. Tą padarysime konfigūracijų failą nustatę:

```
    REPORTLEVEL="paranoid"
```

Ir būtinai įsirašykite savo el. pašto adresą kur norėsite gauti pranešimus:

```
    SENDMAILTO="sysadmin@example.org"
```

Visa kita, ne tiek ir svarbu. Kada pranešimus gausite galite pasitkrinti `cron` faile `/etc/cron.d/logcheck` (greičiausiai pagal nutylėjimą tai bus kas valandą).

**Žinučių ignoravimas su logcheck**

Susikurkite nuosavą failą kataloge `/etc/logcheck/ignore.d.paranoid` ir jame aprašykite ignoravimo taisykles.

Štai kaip atrodytų tipinis, tingių PHP programuotojų, ignoravimo failas `/etc/logcheck/ignore.d.paranoid/php-errors`:

```
    ^.*Client sent malformed Host header
    ^.*Directory index forbidden by Options directive: .*
    ^.*Invalid Content-Length.*
    ^.*Invalid URI in request POST TP.*
    ^.*Invalid URI in request.*
```

Kaip matome - regexp. Tiesa, nebūtinai. Galite tiesiog dalį teksto įrašyti - taip pat suveiks.

**Logcheck ignoravimo komandų testavimas**

O kaip pasitestuoti `logcheck` išvestį po ignoravimo komandų jeigu ten aprašėte labai sudėtingą regexp'ą? Su kita komanda!

```
    cat /var/log/apache2/error.log | egrep -v -f /etc/logcheck/ignore.d.paranoid/php-errors
```

Ir gausime tokias žinutes kurios yra `/var/log/apache2/error.log` faile, tačiau nesutampa su faile `/etc/logcheck/ignore.d.paranoid/php-errors` aprašytomis išraiškomis. Priešingą paiešką mums duoda `egrep -v` komanda.

**Logcheck praktinis panaudojimas**

Man, kaip Python ir PHP programuotojui, yra svarbu žinoti kas vyksta ne tik pačiuose serveriuose kuriuos turiu, bet ir sukurtoje programinėje įrangoje. Tokios žinutės iš sisteminių failų dažnai yra pravertusios sutvarkyti ne vieną rimtą bėdą, kol ji netapo rimtesnė.

Pavyzdžiui programuojant PHP drąsiai galiu rašyti visokias loginimo sąlygas su paprastu [error_log()](https://secure.php.net/manual/en/function.error-log.php) ir tikrai žinau, kad `logcheck` pasirūpins, jog nepraleisčiau tokių žinučių.

Programuojant Python greičiausiai jau teks konfigūruoti [logging](https://docs.python.org/2/library/logging.html) paketą. Žinutes nureipti į atskirą klaidų žurnalo failą ir `logcheck` pasakyti, kad jis iš jų skaitytų.

Kalbant apie gerąsias praktikas, siūlau nenustatinėti `logcheck` laiškų siuntimo „realiu laiku“ (tarkime kas dvi minutes), nes galite gauti labai daug spam'o į savo pašto dėžutę.
