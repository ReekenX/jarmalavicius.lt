---
title: Django framework - kas tai?
category: django
image: i/django/django-framework-kas-tai.png
description: Django karkasas pradėtas kurti 2005 metais. Dabar - tai pats populiariausias Python web frameworkas. Kas tai ir kam to reikia?
---

Pradėsiu ilgą ir nebūtinai nuobodžią straipsnių seriją apie Django framework. Kaip ją įdiegti, naudotis, kokie jos privalumai ir kodėl verta ją mokytis.

Django web framework yra atviro kodo Web 2.0 aplikacijų framework'as parašytas su Python programavimo kalba. O jos programavimas buvo pradėtas kuriant naujienų svetaines. Tiesa, kurį laiką ši sistema dar buvo uždaro kodo, bet 2005 metų liepos mėnesį ji buvo išleista BSD licencija. Pavadinta Django vardu gitaristo Django Reinhardt garbei.

{% include post_image.html image="/i/django_logo.png" text="" %}

Ir jau po trijų metų, 2008 metais pasauliui buvo pranešta kad naujai susikūrusi organizacija Django Software Foundation nuo šiol programuos Django.

Bet kas visgi tai per dalykas? Pirmiausiai šis framework'as sukurtas palengvinti programuoti sudėtingus sprendimus naudojant duomenų bazę. Nors šiuo metu sistema leidžia net turėti projektus kurie veikia be duomenų bazės. Programuota laikantis MVC architektūros (apie tai kitame straipsnyje). Nors darbartiniais laikais kyla pakankamai daug ginčų dėl kai kurių sistemos vietų, bet šis projektas stengiasi išlaikyti pernaudojamumo ir priderinamumo principus. Todėl Django ateina kaip framework'as ant kurio gali programuoti bet ir prie kurio gali prijungti įvairius komponentus. O jų tikrai daug (apie atskirus komponentus parašysiu vėliau). Taip pat vienas iš svarbių programavimo principų tapo DRY (don't repeat yourself).

Šiuo metu interneto svetainių sukurtų su Django yra ne tik užsienyje daug, bet ir toje pačioje Lietuvoje. Žymiausios pasaulio svetainės naudojančios Django yra Pinterest, Instagram, Dpaste. Daugiau svetainių rasite [DjangoSites.org](http://djangosites.org) svetainėje. Tiesa, toje pačioje svetainėje lietuviškų svetainių buvo bent kelios. Šiuo metu - tik viena.

Pats jau daugiau nei 3 metus šiuo framework'u naudojuosi ir galiu pasakyti, kad tai yra velniškai greitas, lankstus ir patogus framework'as. Įgyvendinti kritiniai dalykai kuriuos dažnai tenka tvarkyti patiems naudojant kitus frameworkus: apsauga nuo XSS, clickjacking, SQL injections. Duomenų migracijų komponentai, thumbnail komponentai, NoSQL moduliai. Komandinės eilutės programos greitai ir lengvai padės pasiekti maksimalių rezultatų. Šiam framework parašyta nemažai ir knygų (kelias kurias perskaičiau būtinai parekomenduosiu vėliau).

Pradžiai trumpai tiek. Tie kurie nekantrauja daugiau sužinoti ar išbandyti siūlau oficialioje svetainėje [djangoproject.com](http://djangoproject.com) pereiti per 4 dalių žinyną. Jame tikrai labai daug visko apie Django.