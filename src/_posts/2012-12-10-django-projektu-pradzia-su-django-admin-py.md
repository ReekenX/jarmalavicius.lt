---
title: Django projektų pradžia su django-admin.py
permalink: /django/django-projektu-pradzia-su-django-admin-py.html
image: i/django/django-projektu-pradzia-su-django-admin-py.png
category: django
description: Django projektai prasideda nuo projekto sukūrimo. Kokias komandas rasite django-admin.py ir ką kiekviena komanda daro.
---

Praėjusiuose straipsniuose skaitėte, [kas yra Django](/django/django-framework-kas-tai.html) ir
[kaip jį įsidiegti](/django/pirmi-zingsniai-su-django-framework-diegimas.html).
Šiandien trumpai susipažinsime su Django projektų kūrimo skriptu ir
dažnu programavimo pagalbininku - django-admin.py.

Kai įdiegėte virtualenv aplinką gavote Django administravimo skriptą
pavadinimu django-admin.py. Jeigu kažkiek esate nagrinėję Django, tuomet
įspėju nemaišyti - šis skriptas neturi nieko bendro su Django automatine
administracija, apie ką kalbėsime vėliau. Tai skriptas, kurio pagalba
galite greitai ir lengvai susikurti bazines aplikacijas savo projektui.
Paleidę komandą python .virtualenv/bin/django-admin.py gausite pilną šio
skripto komandų sąrašą. Šiuo metu, naujausioje 1.4 versijoje, jis atrodo
taip:

    Usage: django-admin.py subcommand [options] [args]

    Options:
      [..]

    Available subcommands:
      cleanup
      compilemessages
      createcachetable
      dbshell
      diffsettings
      dumpdata
      flush
      inspectdb
      loaddata
      makemessages
      reset
      runfcgi
      runserver
      shell
      sql
      sqlall
      sqlclear
      sqlcustom
      sqlflush
      sqlindexes
      sqlinitialdata
      sqlreset
      sqlsequencereset
      startapp
      startproject
      syncdb
      test
      testserver
      validate

Komandų sąrašas tikrai didelis. Ką ten didelis, žvėriškas tiesiog.
Komandos kiekvienai programavimo situacijai. Šių komandų ypač pasigendu
kartais programuodamas PHP projektus, nes dabartiniai PHP framework'ai
dar tik bando pasiekti šį funkcionalumą. O daugumą framework'ų išvis
neturi migracijų ar kelių duombazių palaikymo vienu metu.

Apie kiekvieną komandą galima pasiskaityti plačiau prie jos prirašius
argumentą --help. Pavyzdžiui:

    python .virtualenv/bin/django-admin.py sqlall --help

Arba:

    python .virtualenv/bin/django-admin.py help syncdb

Kad per daug savęs neperkrauti, susipažinkime pirmiausiai su projektų
kūrimo komanda:

    python .virtualenv/bin/django-admin.py startproject parduotuve

Ši komanda sukurs naują katalogą pavadinimu parduotuve. Jame rasite
failą manage.py, kurį galėsite naudoti vietoje django-admin.py ir tokiu
pačiu pavadinimu parduotuve dar vieną katalogą. Kodėl du katalogai turi
tokį patį pavadinimą, tačiau skirtingus failus juose? Taip yra todėl,
kad katalogas parduotuve su failu manage.py yra projekto katalogas. Visa
kita, kas yra šiame kataloge, priimtina vadinti aplikacijomis. Natūralu,
kad tvarkingai programuojant, yra gerai atskirti projekto logiką ir
nekišti jos į pavienių, pernaudojamų, aplikacijų logiką. Pavyzdžiui
projekte parduotuve galima turėti aplikaciją krepšelis, vėliau sukurti
apmokėjimai ir pan. Laikantis tokios logikos, vieną kartą sukurtą
programą dažniausiai galima pernaudoti kitame projekte (kaip tą padaryti
kalbėsime vėliau).

Sukūrus parduotuvės projektą, galime jį paleisti (vidinį Django
serverį):

    python parduotuve/manage.py runserver

Ir savo naršyklės lange išvysime pirmajį Django pasisveikinimo langą
surinkę adresą localhost:8000.

![Django - pirmas langas paleidus runserver](/i/images/django_pirmas_langas.png)

Taigi, įsidiegėme virtualią aplinką, įsidiegiame Django ir
pasitikrinome, kad Django sėkmingai veikia. Dabar trumpai aprašysiu
kiekvieną komandą kurią rasite django-admin.py. Tiesa, kol kas tai bus
viskas nauja, bet vėliau prie to galėsime sugrįžti mokydamiesi Django.
Taip pat, daugelį jų pamokysiu naudotis kituose straipsniuose. Lai šis
puslapis būna „špargalkė“ ateičiai.

Taigi, django-admin.py komandų sąrašas ir trumpas jų aprašymas:

-   **cleanup** - valo Django „šiukšles“. Kadangi Django sesijų
    identifikatorius saugo duomenų bazėje, tai ši komanda išvalo jau
    seniai negaliojančius įrašus. Patogu naudoti su CRON programa.
-   **makemessages** - sugeneruoja django.po failą į kurį surašo visus
    galimus projekto vertimus.
-   **compilemessages** - sugeneruoja binarinius django.mo failus,
    kuriuos naudoja vertimų tekstams atvaizduoti.
-   **diffsettings** - parodo skirtumus tarp dabartinio nustatymų failo
    settings.py ir Django standartinio.
-   **dbshell** - atidaro duomenų bazės valdymo terminalo programą
    (jeigu tai MySQL duomenų bazė, tai paleis mysql komandą).
-   **dumpdata** - leidžia eksportuoti duomenų bazę ir išsaugoti jos
    turinį į kažkokį failą pasirinktu formatu.
-   **loaddata** - leidžia su dumpdata padarytus duomenis įkelti į
    duomenų bazę.
-   **syncdb** - sukuria duomenų bazę iš models.py failų.
-   **flush** - taip sakant „perinstaliuoja“ duomenų bazę. Pačią duomenų
    bazę išvalo taip, kaip ji atrodytų lyg ką tik paleidus syncdb.
-   **inspectdb** - iš duomenų bazės sugeneruoja Django modelius kuriuos
    galima saugoti models.py failuose. **Va čia tai įrankis!**
-   **sql** - atspausdina SQL užklausas duomenų bazės lentelėms sukurti
    tam tikrai aplikacijai.
-   **sqlall** - atspausdina SQL užklausas duomenų bazės lentelėms
    sukurti tam tikrai aplikacijai. Skirtumas nuo aukščiau aprašytos
    komandos yra tas, kad ši komanda dar atspausdina indeksų kūrimo
    sakinius ir jeigu kokia informacija buvo išsaugota dumpdata komandos
    pagalba, tai tuos sakinius paverčia SQL užklausomis ir atspausdina.
-   **sqlreset** ir **reset** - atspausdins SQL užklausas su sakiniais
    šalinti lenteles (DROP TABLE) ir sukurti per naujo (CREATE TABLE)
    tam tikrai aplikacijai.
-   **sqlclear** - atspausdina SQL užklausas su sakiniais šalinti
    lenteles tam tikrai aplikacijai.
-   **sqlcustom** - atspausdina SQL sakinius duomenų bazei tam tikros
    aplikacijos, kai informacija yra krunama iš tokių failų kaip sukurtų
    su dumpdata pagalbos.
-   **sqlflush** - atspausdina SQL sakinius duomenų bazės lentelėms
    valyti.
-   **sqlindexes** - atspausdina SQL sakinius indeksams duomenų bazėje
    sukurti tam tikrai aplikacijai.
-   **sqlinitialdata** - uždraustoji komanda, dabar pervadinta į
    sqlcustom.
-   **sqlsequencereset** - atspausdina užklausas kurios pradės iš naujo
    pirminių raktų skaičiavimą tam tikrai aplikacijai.
-   **shell** - paleidžią interaktyvią terminalo programą kurioje
    galėsite vykdyti python sakinius.
-   **validate** - patikrina ar Jūsų aprašyti modeliai yra teisingi.
    Kam apskritai ši komanda buvo sukurta?
-   **test** - pavykdo automatinius testus.
-   **startapp** - sukuria aplikacijos šabloną.
-   **startproject** - sukuria projekto šabloną.
-   **runserver** - paleidžia virtualų serverį, kurio pagalba savo
    svetainę pasieksite naršyklėje surinkę atitinkamą IP adresą ir
    prievadą.
-   **runfcgi** - šios komandos pagalba savo projektą galite paleisti
    ant fastcgi (pvz.: nginx web serviso).
-   **testserver** - paleis testinį serverį. Realiai turėsite tuščią
    duomenų bazę su pradiniais duomenimis (initial data) ir serveris
    skirtas patikrinti ar projektui šių pradinių duomenų užteks.
-   **createcachetable** - jeigu kešavimui naudojate duomenų bazės
    variklį, tuomet ši komanda leidžia sukurti lenteles reikalingas šiai
    informacijai saugoti.

Būtina pabrėžti, kad sakiniai kuriuose yra „tam tikrai aplikacijai“
reikalauja aplikacijos argumento (jis privalomas). Tai reiškia, kad
vykdydami komandą turite nurodyti aplikacijos pavadinimą ir ši komanda
nėra skirta VISOMS Jūsų projekto aplikacijoms.

Tik primenu, kad kiekviena iš komandų aukščiau išvadintų turi dar ir
argumentų sąrašą. Tačiau apie juos jau pasiskaitysite patys, kai jų
prireiks. Dabar žinodami komandas galima pradėti kurti savo WEB
aplikacijas (nebūtinai WEB). Apie tai - kitame straipsnyje.
