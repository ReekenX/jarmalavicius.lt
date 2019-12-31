---
title: Kas yra Docker?
category: docker
image: i/docker.png
description: Apie Docker konteinerizavimo sistemą produkcinėse sistemose ir programuotojų kompiuteriuose. Kuo tai skiriasi nuo Vagrant ar Virtualbox?
---

Žmonėms kurie nors kiek matę Virtualbox'ą paaiškinti nesunku - tai kažkas panašaus, tik be grafinės aplinkos. Pasileidžiate per komandinę eilutę kažkokią operacinę sistemą, programinę įrangą joje ir dirbate.

Tačiau tam yra Vagrant'as, pasakys daugelis!

Viena iš priežasčių dėl ko apskritai toks dalykas kaip Dockeris buvo sukurtas - tai resursų pernaudojimas. Vagrant'as paleisdavo visą operacinę sistemą ir tik tada norimą programinę įrangą. Todėl įrangos paleidimas trukdavo bent kelias minutes. Tuo tarpu Docker'is paleidžia viską per kelias sekundes. Taip yra todėl, kad daugelis resursų, tokie kaip Kernelio moduliai, yra pernaudojami iš vykdančiosios sistemos.

Kaip pavyzdys, jeigu norėtume paleisti web servisą nuo nulio - apache/nginx - tai:

* Virtualbox'e užkrautume kokią nors OS, kaip Ubuntu, tada įdiegtume web servisą ir jau pusvalandžio bėgyje galima būtų dirbti.
* Vagrantui reikėtų parašyti konfigūracijų failą, kuris užkrautų OS ir paleistų web servisą. Jau po 5-15 minučių galėtume dirbti.
* Dockeriui reikėtų parašyti konfigūracijų failą ir jis pernaudojęs esamos sistemos resursus paleistų web servisą kelių minučių bėgyje.

Svarbu pabrėžti, kad Docker'is šiuo metu yra populiariausia konteinerių (taip vadinami operacinių sistemų / programinės įrangos atvaizdai) sistema. Todėl jeigu esate programuotojas, išmokti anksčiau ar vėliau tikrai bus verta.

<img src="/i/docker-susidomejimas.png" class="img-fluid" />

<p class="text-center small">Susidomėjimas Docker sistema pagal Google Trends</p>

Nuotraukoje viršuje matyti kaip stipriai Docker susidomėjimaas augo nuo 2013 metų.

## Docker diegimas

Kaip įdiegti - atskirai rašyti neverta, nes kartais informacija keičiasi. Užteks atsidaryti [oficialų diegimo puslapį](https://docs.docker.com/install/).

Iš dokumentacijos verta paminėti, kad reikėtų nepraleisti tos dalies kur paprastam vartotojui suteikiamos teisės valdyti Docker konteinerius. Praleidus šią vietą vėliau visas komandas susijusias su Docker'iu teks leisti per `sudo`. Laiko gaišimas.

## Kaip išbandyti?

Sekančiuose straipsniuose daugiau aprašysiu apie Dockerio komandas. Labai smalsiems patarčiau [įsidiegti docker-compose](https://docs.docker.com/compose/install/) ir pasileisti [mano programavimo platformą](https://github.com/ReekenX/docker-for-webdevs) kuri padaryta su Docker. Platformoje rasite apache2, php, mysql, memcached, redis, elasticsearch, postgres. Žodžiu visko ko standartiniam web programuotojui gali prireikti.
