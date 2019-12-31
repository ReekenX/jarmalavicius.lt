---
title: Paketų, esančių requirements.txt, automatinis atnaujinimas
permalink: /django/atnaujiname-paketus-is-requirements-txt
category: django
image: i/django/atnaujiname-paketus-is-requirements-txt.png
description: Failo requirements.txt atnaujinimas be skausmo ir laiko gaišimo su Pur komanda. Kaip naudotis ir ką ji gali padėti Python programuotojams.
---

Bene kiekvienas projektas Python kalboje turi `requirements.txt` failą, kuriame surašyti **paketų pavadinimai ir jų priklausomybės** (versijos, su kuriomis programa turėtų veikti). Tiesa, pastarųjų, versijų, gali ir nebūti. Tuomet sistema turėtų įdiegti naujausias tuo metu paketų versijas.

Dirbant ilgiau su projektu - reikės šias **versijas atnaujinti**. Tą daryti verta bent dėl kelių priežasčių:

* Paketai gali turėti **saugumo spragų** (pavyzdžiui `OpenSSL` susiję pakeitai jų turi dažniausiai);
* Senesni paketai gali turėti **neištaisytų programinės įrangos klaidų** (ypatingai naudojant frameworkus, tokius kaip `Django`);
* Naujesni paketai gali būti **optimizuoti**.

## Kaip atnaujinti paketus?

Jeigu turime kažką panašaus į šį `requirements.txt`:

    django-admin-jqueryui==1.8.22
    django-admin-shortcuts==1.2.5
    django-appconf==0.6
    django-awesome-bootstrap==3.0.3
    django-compressor==1.3
    django-debug-toolbar==0.11.0
    django-extensions==1.3.3
    django-imagekit==3.2.2

Tuomet greičiausiai atnaujinti paketus bus su `pur` įrankiu.

## Pur įdiegimas

Įdiegti galima pasinaudojus `pip` įrankiu:

    pip install pur

Arba, jeigu nenaudojate virtualios aplinkos, tuomet prie komandos prirašykite `sudo`, kad įdiegti į sistemą.

## Atnaujiname paketų versijas

Paprasčiausiai duokime šiai komandai `requirements.txt` failą:

    pur -r requirements.txt

Jeigu esate tame pačiame kataloge kur ir šis failas, tuomet užtektų ir `pur` komandos pakvietimo be jokių argumentų.

Jis atnaujins requirements.txt failą su naujausiomis versijomis ir parodys atnaujinimų sąrašą:

    Updated django-admin-shortcuts: 1.2.5 -> 1.2.7
    Updated django-awesome-bootstrap: 3.0.3 -> 3.2.0
    Updated django-compressor: 1.3 -> 2.1.1
    Updated django-debug-toolbar: 0.11.0 -> 1.7
    Updated django-extensions: 1.3.3 -> 1.7.8
    Updated django-jquery-js: 2.0.3 -> 3.1.1
    Updated django-jquery-ui: 1.10.3.1 -> 1.11.4.1
    Updated django-model-utils: 2.0.3 -> 3.0.0
    Updated django-ordered-model: 0.3.0 -> 1.4.1
    Updated django-select2: 4.2.2 -> 5.10.0
    Updated django-tastypie: 0.11.1 -> 0.13.3
    Updated django-webtest: 1.7.5 -> 1.9.1

## Atnaujiname paketus

Tik nepamirškite, kad **šis įrankis neatnaujina paketų**. Jis tik **atnaujina jų versijas į naujausias** `requirements.txt` faile. Todėl atnaujinti paketams reikės dar pavykdyti:

    pip install -U -r requirements.txt
