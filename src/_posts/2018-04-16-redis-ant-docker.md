---
title: Redis ant Docker
category: docker
image: i/redis.png
description: Kaip įsidiegti Redis su Docker? Kaip prisijungti prie Docker konteinerio? Ar žinote, kad vienu metu galite turėti net keletą Redis sistemoje?
---

Jau esu [rašęs ne vieną straipsnį](/docker) apie tai koks geras dalykas yra Docker. Taip pat minėjau kaip lengva įsidiegti [Mysql su Docker](/docker/praktinis-docker-panaudojimas-su-mysql). Bet ar žinojote, kad kokį Redis pasikurti yra žymiai lengviau?

Šiuolaikiniai web'ai, ypač turintys daugiau lankomumo, tikriausiai neišgyventų be Redis. Ypač kai kalbame apie visokius banerius, statistikos rinkimus, A/B testavimą.

Ubuntu operacinėje sistemoje Redis įdiegti labai lengva su paketų valdikliu:

```bash
apt-get install redis-server
```

Tai tikrai nėra blogas variantas ir galbūt nėra didelio tikslo užkrauti viską ant Docker.

Bet ant Docker pats diegimas taip pat ypatingai paprastas:

```bash
docker run --name redis-serveris -p 8000:6379 -d redis
```

Prisijungti prie Redis galima dviem būdais. Jeigu turite `redis-cli` (įdiegti galima įdiegus `redis-tools`):

```bash
redis-cli -p 8000
```

Arba pasinaudojant tuo pačiu Docker:

```bash
docker exec -it redis-serveris redis-cli
```

Praktinis išbandymas Redis su Docker:

<p class="text-center">
<img src="/i/redis_su_docker.gif" />
</p>
<p class="text-center small text-muted">Redis išbandymas su Docker</p>

Produkcinėje sistemoje vienas iš Redis privalumų ant Dockerio būtų tai, kad skirtingiems projektams (arba mikro projektams) galima turėti skirtingus Redis konteinerius. Taip ne tik duomenys nesusimaišytų, bet ir saugiau būtų.
