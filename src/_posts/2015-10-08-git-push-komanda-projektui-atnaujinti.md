---
title: GIT PUSH komanda projektui atnaujinti
category: git
image: i/git_push_komanda.png
description: Automatinis projektų atnaujinimas po git push. Kaip naujinti produkcines sistemas vien tik git push pagalba (reikia ssh priėjimo).
---

Nors dažniausiai savo projektus deployin'u [Jenkins](http://jenkins-ci.org/) pagalba (kai sėkmingai pasileidžia visi testai ir linter'iai neaptinka klaidų), kartais leidžiu sau šiek tiek tingesnę darbo aplinką - deployment'ą tiesiai į produkcinį serverį.

Vienas iš tokių projektų yra šis statinis tinklaraštis. Nors jame testuoti būtų ką, tačiau to daryti prasmės nėra. Todėl iškart parašęs straipsnį ar šiaip ką atnaujinęs sakau `git push production` ir GIT HOOK'ai pasirūpina visais kitais reikalingais dalykais. Taigi, šis straipsnis apie tai, kaip susikonfigūruoti tokią aplinką darbui.

Pirmiausiai reikėtų suprasti kaip tai turėtų veikti. Savo darbo aplinkoje, kur dirbate, konfigūruoti praktiškai nieko nereikės. Užtenka turėti tik saugyklos ir produkcinio serverio `remote` įrašus.

Pavyzdžiui tipiniai mano 'remote' yra:

    $ git remote -v
    origin  saugykla.example.org:personal-projects/www.jarmalavicius.lt (fetch)
    origin  saugykla.example.org:personal-projects/www.jarmalavicius.lt (push)
    production  server.example.org:www.jarmalavicius.lt (fetch)
    production  server.example.org:www.jarmalavicius.lt (push)
    staging  staging.example.org:www.jarmalavicius.lt (fetch)
    staging  staging.example.org:www.jarmalavicius.lt (push)

Kaip iš pavadinimo turėtų būti aišku, kad `origin` saugykla saugoja privatų repozitorijos turinį (čia veikia prieigos teisės ir saugoma visa istorija tarsi centriniame repozitoriume), `production` yra `ssh` kelias iki projekto failų, `staging` yra testavimo versijos `ssh` kelias iki failų.

Kaip prisidėti `remote` tikriausiai žinosite:

    git remote add origin saugykla.example.org:personal-projects/www.jarmalavicius.lt

Taigi, susikonfigūravę teisingus `remote` sąrašus reikėtų eiti į serverius ir susikurti labai paprastą GIT HOOK'ą automatiniams atnaujinimams padaryti.

Analizuokime šį užrašą iš `git remove -v` komandos:

    production  server.example.org:www.jarmalavicius.lt (fetch)

Keliaujame į `server.example.org` ir jame esantį namų katalogą `www.jarmalavicius.lt`. Susikurkime failą `.git/hooks/post-receive` su turiniu:

    #!/bin/sh

    cd ..
    git checkout -q -f master

Ir, aišku, jam suteikiame vykdymo teises su `chmod +x .git/hooks/post-receive`.

Toks kodo gabaliukas atrodo gana grubiai. Pirmoji eilutė `cd ..` yra naudojama todėl, kad `git` skripto vykdymo metu bus `.git` kataloge. Todėl jame būnant pavykdžius `git checkout` komandą gautume klaidos pranešimą: `fatal: This operation must be run in a work tree`.

Taigi, teisingam keliui gauti arba naudojame `cd ..` arba `git --work-tree=../` komandas.

Tiesa, Jūsų `.git` katalogas nebūtinai privalo būti ten pat kur ir pats projektas guli. Jeigu taip nėra, tai reikėtų antrą eilutę pakeisti į `git --work-tree=/kelias/iki/projekto`.

Kita eilutė `git checkout -q -f master` yra savaime suprantama. Čia reikėtų atkreipti dėmesį į kelis dalykus:

* `-q` tylusis režimas. Čia tam, kad po `git push` nematytume kas vyksta serveryje. Kadangi klaidos, jeigu jų būtų, būtų išvestos, tai nėra reikalo matyti „sėkmės pranešimų“.
* `-f` nurodo failų perrašymą net jeigu serveryje yra yra keistų failų. Gal toks režimas atrodo kiek agresyvus, bet patikėkite, išvengsite žymiai daugiau bėdų jeigu jį naudosite failų perrašymui, nei nenaudosite. Ir be to - **neprofesionalu dirbti tiesiogiai produkciniame serveryje (tuo labiau ten palikti pakeistų failų)**.
* `master` nurodo kurį branch'ą naujinti. Čia galima rinktis branch'ą arba išvis jo nerašyti.

Taigi, kai sekantį kartą kažką sukursite ir norėsite tuoj pat pamatyti pakeitimus produkciniame serveryje - galėsite pavykdyti komandą `git push production` ir vos po kelių sekundžių turėti pakeitimus.

Tikriausiai patys turėtumėte įvertinti rizikas ir tokį dalyką naudoti labai protingai.

Kitame straipsnyje aprašysiu kaip nustatyti pagal modifikuotą kodą:

* ar pavyzdžiui jūsų projektui reikia pavykdyti kažkokias migracijas (ar kitą verslo logiką);
* kaip apsisaugoti nuo kitų branchų kodo gavimo serveryje;
* kaip užtikrinti lengvą duomenų atstatymą jeigu kažkas įvyko blogai;
* kaip užtikrinti tam tikrą kokybės kontrolę ir užkirsti kelią atnaujinimams jeigu push'inamas kodas neatitinka kai kurių standartų.
