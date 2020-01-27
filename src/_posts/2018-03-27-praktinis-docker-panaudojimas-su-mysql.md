---
title: Praktinis Docker panaudojimas su Mysql
category: docker
image: i/docker_mysql.png
description: Docker praktinis panaudojimas su Mysql duomenų baze. Ar žinojote, kad sistemoje galite naudoti kelias skirtingas Mysql versijas ir nesibaiminti dėl senos operacinės sistemos ar paketų priklausomybių?
---

Į Docker'į pereina tikrai ne kiekvienas programuotojas. Keista, nes praktiškai jiems ir buvo sukurta ši platforma. Ir dažnai kalbėdamas su programuotojais girdžiu kaip jie „šiukšlina“ savo sistemas / kompiuterius, kovoja su paketų priklausomybių problemomis, senoje operacinėje sistemoje bando įdiegti naujus paketus ir pan.

Visas šias problemas turėtų išspręsti Docker. Štai kaip galima turėti vieną populiariausių duomenų bazių sistemų kompiuteryje be jokio vargo: vos vienos eilutės dėka.

{% include post_image.html image="/i/mysql_logo.jpg" text="Docker su Mysql - tik viena eilutė!" %}

## Docker Mysql diegimas

Galima įdiegti Mysql su `apt-get install mysql-server` (arba bet kuriuo paketų valdikliu), bet galima visa tai padaryti daug lanksčiau, su Docker:

```bash
docker run --name vietinis-mysql \
    -v ~/saugykla/mysql:/var/lib/mysql \
    -e MYSQL_ROOT_PASSWORD=root \
    -p 127.0.0.1:3306:3306 \
    -d mysql:latest
```

Ir tada turint `mysql-client` paketą, galima prisijungti prie naujai sukurtos
duomenų bazių sistemos:

```bash
mysql -h 127.0.0.1 -u root -p
```

Be `mysql-client` į duomenų bazę galima patekti su:

```bash
docker exec -it vietinis-mysql mysql -u root -p
```

## Kuo tai geriau nei sisteminė biblioteka?

Jeigu kalbėti tik apie vieną įrangą Dockeryje - Mysql - tai niekuom. Tačiau programavime dažniausiai su viena programine įranga neišsiversite, o čia - Docker jau turi labai daug privalumų.

Jeigu esate Linux „senbuvis“, tai tikrai žinosite, kad įdiegti senesnę programinę įrangą į sistemą yra labai sunku. Su Docker - jokių problemų įdiegti bet kurią Mysql versiją.

Sistemoje ne visada turėsite naujausią Mysql versiją. Turėsite tokią, kokią operacinės sistemos programuotojai pažymi kaip „stabilią“. Jeigu esate tinginys ir operacinės sistemos dažnai neatnaujinate - įdiegti kažkokį paketą be priklausomybių problemų bus tikras galvos skausmas.

Taip pat yra ir su Docker konteinerių pašalinimu. Pabandėte ir jau nebereikia? Tiesiog ištrinate konteinerį su `docker rm`.

O kas jeigu vienu metu reikia turėti net kelias Mysql versijas? Kadangi Mysql yra ganėtinai „backwards-compatible“ tai poreikis gali būti mažas. Labiau tokių problemų iškiltų su ElasticSearch arba Postgres.
