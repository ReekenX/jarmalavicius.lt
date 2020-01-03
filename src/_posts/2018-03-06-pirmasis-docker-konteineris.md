---
title: Pirmasis Docker konteineris
category: docker
image: i/pirmas_docker_konteineris.jpg
description: Kaip sukurti pirmą Docker konteinerį, jį pavykdyti ir patikrinti jo statusą.
---

Skaitydami šį straipsnį tikriausiai jau žinote [kas yra Docker](/docker/kas-yra-docker), o galbūt jau yra tekę išbandyti [kokį nors konteinerį](/docker/docker-konteineriu-monitorinimas-su-cadvisor).Naudotis kitų sukurtais konteineriais taip pat smagu kaip ir pačiam juos kurti.Įprastai Docker instaliacija tikrinama paleidžiant anglišką „sveikas pasauli“ konteinerį:```bash
$ docker run hello-world
Unable to find image 'hello-world:latest' locally
[..]
Status: Downloaded newer image for hello-world:latestHello from Docker!
This message shows that your installation appears to be working correctly.
```Tokį testinį konteinerį lengva susikurti ir patiems.## Operacinės sistemos pasirinkimasKiekvienas Docker konteineris prasideda eilute apie operacinę sistemą - su kokia turėtų startuoti.Dažniausiai (arba paprasčiausiai) tam pasirenkama kokia nors Ubuntu versija vien dėl jos populiarumo.Susikurkime failą `Dockerfile` ir visus tolimesnius veiksmus atlikime šiame faile.Jo pirmoje eilutėje nurodykime, kad naudosime Ubuntu operacinę sistemą:```
FROM ubuntu:latest
```Super yra tai, kad `Dockerfile` palaiko komentarus:```
# Rinktis pasenusią operacinės versiją - nerekomenduojama
FROM ubuntu:16.04
```## Komandų vykdymasIT pasaulis labai daug diskutuoja apie mikroservisų architektūras. Gal dėl to Docker'is taip stipriai ir išpopuliarėjo, kadangi čia labai įprasta, kad vienas konteineris daro tik vieną darbą.Kadangi jau operacinę sistemą turime - dabar galime leisti komandas.Komandų aprašai daromi su `CMD` iškvietimu iš argumentai paduodami masyvo principu:```
CMD ["echo", "Sveikas pasauli!"]
```## Konteinerio kompiliavimasVisus Docker konteinerius reikia pirmiausiai sukurti:```
docker build -t sveikas-pasauli .
```Žymės argumentų (`-t sveikas-pasauli`) naudoti nebūtina, bet jie padeda lengviau atpažinti savo sukurtus konteinerius.Kai atvaizdas bus sukurtas, jį galėsite pamatyti `docker images` išvestyje:```
$ docker images
REPOSITORY         IMAGE ID         CREATED           SIZE
sveikas-pasauli    94efed708db0     12 minutes ago    112MB
```112 MB sveria „sveikas pasauli“ atvaizdas? Wow!## Konteinerio paleidimasSukurtą konteinerį galime paleisti ir išbandyti:```
$ docker run sveikas-pasauli
Sveikas pasauli!
```## Fone veikiantys konteineriaiGalime patikrinti ar mūsų Docker konteineris veikia fone su `docker ps`.Deja, ten šio konteinerio nerasite.Taip yra todėl, kad mūsų parašyta komanda išvedė tekstą ir sėkmingai baigė darbą. Tuo galite įsitikinti pažiūrėję ką rašys `docker ps -a` kuri rodo informaciją apie visus konteinerius:```
$ docker ps -a
CONTAINER ID  IMAGE             COMMAND                 STATUS
fbd3ccb23e41  sveikas-pasauli   "echo 'Sveikas pasau…"  Exited (0) 10 minutes
```Konteinerį su Docker pasileidome per kelias minutes. Kituose straipsniuose pakalbėsime apie kokio nors framework'o paleidimą per Dockerį.
