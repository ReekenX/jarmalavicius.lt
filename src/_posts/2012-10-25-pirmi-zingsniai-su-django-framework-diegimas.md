---
title: Pirmi žingsniai su Django - diegimas
permalink: /django/pirmi-zingsniai-su-django-framework-diegimas.html
image: i/django/pirmi-zingsniai-su-django-framework-diegimas.png
category: django
description: Kaip įsidiegti Django virtualio Python aplinkoje, pasileisti ir patikrinti ar viskas po įdiegimo yra gerai.
---

Praėjusiame straipsnyje trumpai aprašiau kas yra [Django framework'as](/django/django-framework-kas-tai.html)
ir kodėl jis man patinka. Šis straipsnis bus skirtas tiems, kas pirmą
kartą apie šią sistemą girdi ir jos nėra naudojęs. Kaip ir visi kiti
geri dalykai, taip ir šis, prasideda nuo diegimo. Laimei jis tikrai
paprastas, juk tai Python!

![Python logotipas](/i/images/python_logo.png)

Bet prieš rodant kaip tą padaryti Linux sistemoje siūlau neteršti savo
sistemų diegiant paketus į sisteminius katalogus. Vietoje to
pasinaudokime senu geru
[virtualenv'u](http://www.virtualenv.org/en/latest/index.html). Trumpai
tariant ši programinė įranga sukurs kataloge virtualią aplinką, kurioje
galėsite laikyti visus savo projekto paketus neteršiant sistemos. Vėliau
norint išdiegti savo projektą su visais paketais ir priklausomybėmis,
užteks tiesiog pašalinti sukurtą katalogą.

Taigi pradėkime. Pirmiausiai sukurkime virtualią aplinką:

    $ virtualenv .virtualenv

Bus sukurtas katalogas “.virtualenv” kuriame bus Jūsų virtuali aplinka.
Katalogą galite pavadinti kaip tik norite. Su tašku priekyje pats vadinu
tik todėl, kad taip greičiau akys randa projektui nepriklausančius
katalogus. Tuo labiau, šio katalogo pagal nutylėjimą nerodys failų
valdymo programos kaip Dolphin ir Nautilus. Taip pat, su šiuo katalogu
retai kada vykdomi kokie nors veiksmai ranka.

Tam, kad diegiant paketus neįdiegti jų į sistemą reikia aktyvuoti
virtualią aplinką kurią sukūrėme anksčiau. Reikia įvesti tokią komandą:

    $ source .virtualenv/bin/activate

Jeigu Jūsų terminalas „nusikeiks“, kad nėra tokios komandos kaip
„source“, tuomet vietoje jo rašykite tiesiog tašką. Kad viskas sėkmingai
pavyko turėtumėte pamatyti šalia savo terminalo komandinės eilutės
įvesties (PS1) tekstą su virtualios aplinkos katalogo pavadinimu. Mano
atveju tai būtų:

    (.virtualenv) $

Dabar rašydami tokias komandas kaip „easy\_install“, „pip“ ar „python“
viską atliksime virtualios aplinkos rėžiuose. Taigi, įdiekime su pip
komanda Django kurį ir norime išbandyti:

    (.virtualenv) $ pip install django

Kadangi pip komandai nenurodėme versijos, bus atsiųsta naujausia Django
versija, kuri šiuo metu yra 1.4. Norėdami gauti kokią nors ankstesnę
tikslią versiją, galime rašyti pavyzdžiui:

    (.virtualenv) $ pip install django

Django bus įdiegta į virtualią aplinką (katalogo .virtualenv gilumoje).
Ar tikrai Django veikia ir viskas pavyko gerai galime pasitikrinti tokia
komanda python konsolėje:

    (.virtualenv) $ python
    >>> import django
    >>> django.get_version()
    '1.4'

Taigi patikrinome, kad Django sėkmingai įdiegta į virtualią aplinką, kad
Django versija tikrai naujausia (rašant straipsnį versija buvo 1.4).

Šiam kartui tiek. Kitame straipsnyje parodysiu kaip paleisti projektą
naršyklėje ir ką pagal nutylėjimą ten rasite.
