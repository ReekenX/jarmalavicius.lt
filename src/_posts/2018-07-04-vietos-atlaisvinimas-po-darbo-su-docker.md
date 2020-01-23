---
title: Vietos atlaisvinimas po darbo su Docker
category: docker
image: i/hdd.png
description: Ar žinote, kad galite atlaisvinti 10GB ar dar daugiau disko vietos po darbo su Docker? Kaip valyti užsilikusius nenaudojamus konteinerius, atvaizdus, saugyklas ir kitus duomenis - šiame straipsnyje.
---

Kad ir kaip efektyviai dirbsite su Docker - neišvengsite to, kad jis „suvalgys“ daug disko vietos.

Dabar mano projektų kataloge galima suskaičiuoti šimtus `docker-compose.yml` ir `Dockerfile` failų. Kai kurie projektai programuojami dažniau - kiti rečiau.

Tie, kurie jau visai užmiršti, guli tiesiog eikvodami disko vietą ir nieko naudingo nedaro. O disko vieta šiais laikais brangus resursas, jeigu kalbėti apie serverius.

Štai keletas komandų kurios padės atlaisvinti diską.

## Paprastas apsikuopimas viena komanda

Jeigu norite tik prasivalyti nuo šiukšlių, lengviausiai pavykdyti vieną komandą ir to užteks:

```bash
$ docker system prune

WARNING! This will remove:
        - all stopped containers
        - all networks not used by at least one container
        - all dangling images
        - all build cache
Are you sure you want to continue? [y/N] y

[..]
deleted: sha256:444ff179082f40ce3b53de4
deleted: sha256:5554d3b9257f76349ec2642
deleted: sha256:d93d2a5931da6a282368079

Total reclaimed space: 2.408GB
```

Kaip matote iš išrašo aukščiau - pravalys kešą, nebenaudojamus atvaizdus, interneto prieigas ir išjungtus konteinerius.

Tie, kas nenori valyti konteinerių, gali pasinaudoti pavienėmis komandomis žemiau.

## Kaip išvalyti nebenaudojamus atvaizdus?

Išvalyti nenaudojamus atvaizdus galima taip:

```bash
$ docker image prune -a

WARNING! This will remove all images without
at least one container associated to them.
Are you sure you want to continue? [y/N] y

[..]
untagged: redis:latest
untagged: ubuntu@sha256:91680dba9ee085
untagged: redis@sha256:fb38b203a9488b1

Total reclaimed space: 5.514GB
```

## Kaip išvalyti neveikiančius konteinerius?

Čia padės šiek tiek daugiau `bash` magijos:

```bash
docker ps -a | grep Exit | cut -d ' ' -f 1 | xargs docker rm
```

Trumpas paaiškinimas:

* `docker ps -a` - parodys visus veikiančius ir neveikiančius konteinerius;
* `grep Exit` - neveikiančių konteinerių sąraše gale bus užrašas `Exited DATA`;
* `cut -d ' ' -f 1` - iš konteinerių sąrašo iškerpame pirmą žodį - tai bus konteinerio ID;
* `xargs docker rm` - konteinerių ID perduosime `xargs` komandai kuri prie kiekvieno pavykdys `docker rm KONTEINERIO-ID`.

## Kaip išvalyti nenaudojamus skirsnius (volumes)?

Tai padės padaryti viena komanda:

```bash
$ docker volume prune

WARNING! This will remove all local volumes not used
by at least one container.
Are you sure you want to continue? [y/N] y

[..]
faf4ccf09ddff08a11e2527f480d4878619
046006d6601fe4929a0272e218a00e55374
629a4cb272f3913e0c1b5dc3f5d74be343f

Total reclaimed space: 2.179GB
```

## Ar trinti yra saugu?

Konteinerius, kaip ir atvaizdus, trinti yra saugu. Jeigu vėl mėginsite leisti projektą, tai Jums Docker per naujo parsiųs atvaizdus (jeigu to reikia) ir per naujo sukurs konteinerius.

Valydami skirsnius būkite atsargūs - tai Jūsų sukaupti duomenys. Aukščiau aprašyta komanda `docker volume prune` išvalys tik neprijungtus prie nieko skirsnius (nenaudojamus), todėl komanda yra saugi. Tokius skirsnius visada galite pasitikrinti su `docker volume ls -f dangling=true`.

Po pusės metų intensyvaus darbo su Docker keliomis komandomis pavyko atlaisvinti daugiau nei 13GB disko vietos.
