---
title: Atvaizdai užimantys daugiausiai disko vietos Dockeryje
category: atviras-kodas
image: i/docker_apsivalymas.png
description: Trūksta disko vietos Jūsų mikroserveryje? Greičiausiai dėl Docker kaltės - ją kaupti itin lengva. Disko vietą gali užimti ne tik media katalogas Jūsų projekte, bet ir Docker konteineriai, atvaizdai, skirsniai.
---

Dirbant su Docker gali ne kartą kilti klausimas kur dingsta disko vieta.Jeigu žinote ar skaitėte anksčiau kaip veikia Docker, tai jis kiekvienam Dockerfile žingsniui kuria kešavimo atvaizdą. Vėliau kešavimo atvaizdas pernaudojamas dar kelis kartus kol galop sukuriamas norimas atvaizdas kurį jau leisite konteineryje. Tačiau kešas vistiek užsiliks.## Kiek užima atvaizdaiPažiūrėti kiek užima Docker atvaizdai galima su komanda:```
$ docker imagesREPOSITORY                               [..]         SIZE
apikaupyklalt_kaupykla.lt-api            [..]         670MB
jarmalaviciuslt_jarmalavicius.lt-web     [..]         1.4GB
python                                   [..]         918MB
quizaminacom-api_quizamina.com-api       [..]         1.01GB
imagemizecom-api_imagemize.com-api       [..]         1.04GB
python                                   [..]         74.3MB```## Atvaizdų dydžiai pagal TOP'ąJeigu domina išsirikiuoti atvaizdus pagal dydį, kad identifikuoti kas daugiausiai vietos užima ir ką galima optimizuoti:```
$ docker images | awk 'NR!=1 {print $7"\t"$1}' | sort -rh1.4GB   jarmalaviciuslt_jarmalavicius.lt-web
1.04GB  imagemizecom-api_imagemize.com-api
1.01GB  quizaminacom-api_quizamina.com-api
990MB   adminkaupyklalt_kaupykla.lt-admin
918MB   python
783MB   docker.elastic.co/elasticsearch/elasticsearch
703MB   services_apache
670MB   apikaupyklalt_kaupykla.lt-api
```Trumpas komandos `awk 'NR!=1 {print $7"\t"$1}` paaiškinimas:`NR!=1` - praleidžia pirmą eilutę kurioje yra antraštės juosta (stulpelių pavadinimai).`{print $7"\t"$1}` - sukeičiame pirmą ir paskutinį stulpelį, kad vėliau rikiavimo komanda galėtų išrikiuoti gražų sąrašą su TOP'ais.Trumpas `sort -rh` komandos paaiškinimas:`-r` - reiškia angl. `reverse`. Paprastas rikiavimas su `sort` būna didėjančiai, o mums reikia mažėjančio (todėl `-r`), kad viršuje matytume pačius didžiausius, apačioje - pačius mažiausius atvaizdus.`-h` - reiškia angl. `human numeric`. Rikiuoja pagal pagal skaičius, tačiau žiūri ir prie jo esančią raidę M (MB), K (KB), G (GB) ir t.t.## Kaip pašalinti atvaizdus ir gauti daugiau disko vietos[Kaip atsilaisvinti disko vietos su Docker](https://www.jarmalavicius.lt/docker/vietos-atlaisvinimas-po-darbo-su-docker) jau rašiau praėjusiame straipsnyje.