---
title: Statiniai puslapiai su Docker
permalink: /docker/statiniu-puslapiu-laikymas-su-docker
category: docker
image: i/statinis_saitas.png
description: Kaip statines svetaines ar failus konteinerizuoti su Docker pagalba. Keli patarimai ta tema ir kam to gali reikėti.
---

Šių laikų IT tendencija - mikroservisai. Todėl net paprasčiausius projektus bandoma konteinerizuoti. Net statinius projektus.

Kaip tik tokie yra visi mano projektai. Ne išimtis ir šis tinklaraštis.

Konteinerizuotus projektus lengviau deploy'inti, monitorinti, daryti atsargines kopijas ir svarbiausia priežastis - plėsti (angl. „scale“).

Paversti savo statinę svetainę į konteinerizuotą mikroservisą yra itin lengva kai tai darai su Docker.

Įsivaizduokime, kad mūsų projektas guli `src` kataloge. Tuomet kataloge virš jo susikurkime `Dockerfile`:

```docker
FROM nginx

ENV APP_HOME /usr/share/nginx/html
WORKDIR $APP_HOME
COPY src $APP_HOME

EXPOSE 80
```

Tiek nedaug reikia nurodyti `nginx`, kad mūsų projekto katalogą įkeltų į tipinę `nginx` vietą - `/usr/share/nginx/html`. Pagal nutylėjimą `nginx` rodys viską iš šio katalogo (paveiksliukus, media, HTML ir pan.).

Viską galėtume gerokai sutrumpinti, pavyzdžiui neturėti `$APP_HOME` env kintamojo kūrimo - bet tada teks ilgą kelią rašyti kelis kartus. Todėl vadovaukitės DRY pricipu.

Galima neturėti `WORKDIR $APP_HOME` sakinio, bet jis labai gelbėja, kada norite prisijungti prie Docker konteinerio ir pažiūrėti ar yra ten kažkokių problemų. Tuomet komanda `docker exec -it svetaine bash` Jus nukels tiesiai į `/usr/share/nginx/html` - sutaupysite laiko.

Sukurti atvaizdą galima su:

```bash
docker build -t svetaine .
```

O pasinaudoti juo taip:

```bash
docker run -p 8001:80 svetaine
```

Ir naršyklėje surinkę adresą `http://127.0.0.1:8001` matysite savo svetainės turinį.

Tą patį galima padaryti ir produkcinėje sistemoje.

Tuo pačiu tai dar viena puiki [alternatyva Python SimpleHTTPServer arba Node http-server moduliui](/atviras-kodas/alternatyva-python-m-simplehttpserver).
