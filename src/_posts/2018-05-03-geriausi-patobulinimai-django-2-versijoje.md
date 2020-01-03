---
title: Geriausi patobulinimai Django 2 versijoje
category: django
image: i/django_2.png
description: Kas naujo ir gero Django 2 versijoje? Ką verta žinoti, atkreipti dėmesį ir kas gali būti labai naudinga. Pavyzdžiai iš praktinių patyrimų.
---

Django programuotoju tapau dar 2009 metais, kada kūrėjai turėjo tik 1.1 platformos versiją. Tada, be eilinio ir dar vieno framework'o pasaulyje, Django išsiskyrė puikiu scaffolding'u - Django administracija. Aišku, per kelis metus konkurenciniai framework'ai šį privalumą tiesiog „suvalgė“.

Per devynerius metus pasikeitimų šiame framework'e įvyko tikrai daug. 2017 metų gruodį buvo išleista dar viena versija, pagrindinė, Django 2.0. Po keletos mėnesių migravau į šią versiją projektą iš 1.11 (kurį pradėjau nuo 1.4 versijos) į Django 2.0.

Po šiokios tokios praktikos išrinkau geriausius šios versijos patobulinimus.

## Python 3 palaikymas

Net ne palaikymas, o privalomybė. Nauja Django versija veikia tik su Python 3.4 arba aukštesnėmis versijomis.

Tokiose situacijose labai praverčia konteinerizavimai - man užteko `Dockerfile` pakeisti Python versiją ir viską supushint'i į produkcinę sistemą.

Išties gera naujovė. Kiek matau iš operacinių sistemų priklausomybių ir atviro kodo projektų - Python 2 labai sunku atsikratyti, nors praėjo daug metų kada Python 3 buvo išleistas.

## Draugiška mobiliems adminisracija

Šio pakeitimo labai laukiau ne vienerius metus. Yra tekę ne vieną kartą dėti ant Django administracijos temą, kuri paverčia administraciją draugiška mobiliems įrenginiams. Dabar to daryti nereikės, viskas - standartiniais būdais.

{% include post_image.html image="/i/django_2_mob.png" text="Django 2.0 su mobilios versijos palaikymu" %}

## Draugiškas adresų rašymas

Regexp'as adresuose man atrodė kaip vienas nepraktiškiausių dalykų Django framework'e.

Dabar adresus galima aprašinėti gana gražiu formatu:

```python
# senas variantas:
url(r'^straipsniai/(?P<year>[0-9]{4})/$', views.artcles),

# naujas variantas:
path('straipsniai/<int:year>/', views.artcles),
```

## Autocomplete laukai administracijoje

Tai itin patogu kada kažkoks turinys yra grupėse ir ieškote grupės pavadinimo. Pavyzdžiui prekių grupės, puslapių kategorijos, naudotojų tipai.

Daugiau apie [autocomplete laukus Django dokumentacijoje](https://docs.djangoproject.com/en/2.0/ref/contrib/admin/#django.contrib.admin.ModelAdmin.autocomplete_fields).

## Metodas values_list()

Šio patobulinimo turbūt laukiau labiausiai.

Dažnai iš duomenų bazės reikia sąrašo tik su tam tikrais laukais. Rails'ai turi `pluck` komandą - tai čia praktiškai ta pati Django alternatyva.

Pavyzdžiui jeigu `<select>` HTML elementui ruošite duomenis iš duomenų bazės, tai juos galite paimti tokiu formatu:

```python
>>> Modelis.objects.value_list('id', 'year')
<QuerySet [(1, '2016'), (2, '2017'), ...]>
```

Turbūt dažniausiai naudojama mano operacija programuojant.

## Puslapiavimas kai išeinama iš rėžių

Anksčiau tokius dalykus darydavau rankiniu būdu: žinodamas kiek yra puslapių patikrindavau ar norimas puslapis nėra už jo ribų ar prieš (dabartinis puslapis didesnis už 0, bet mažesnis arba lygus viso puslapių skaičiui).

Dabar `Paginator.get_page()` gali „išmesti“ klaidą `EmptyPage` ir informuoti kada tai įvyksta.

## Pavardė gali būti 150 simbolių

Kvaila, bet daug kartų teko taisyti šį limitą, kai standartinių 30 simbolių nepakakdavo. Dabar, net 150 simbolių!

## Daugiau pakeitimų

Čia tikrai ne viskas. Čia tik geriausi, mano manymu, patobulinimai.

Pats patobulinimų sąrašas įspūdingai ilgas, jį galite rasti [Django oficialiame pranešime](https://docs.djangoproject.com/en/2.0/releases/2.0/).

Į ką visada verta atkreipti dėmesį, tai į žemiausiai aprašytą skyrelį „Features removed in 2.0“. Beveik visada tokiuose skyriuose rasdavau ką nors ką naudodavau projekte. O tai labai praverčia, prieš migruojant versiją.
