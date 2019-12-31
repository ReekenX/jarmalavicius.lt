---
title: Alternatyva python -m SimpleHTTPServer
permalink: /atviras-kodas/alternatyva-python-simplehttpserver
category: atviras-kodas
image: i/static.png
description: NodeJs alternatyva populiariąjam Python SimpleHTTPServer moduliui. Kodėl NodeJs statinis web servisas daug geriau?
---

Kiekvienas programuotojas bus ne kartą susidūręs su tuo, kad reikia kažkam parodyti failus jų nekeliant į serverį. Būnant ant to paties tinklo lengviausias būdas pasidalinti failais yra:

```
$ python -m SimpleHTTPServer
Serving HTTP on 0.0.0.0 port 8000 ...
```

Kitam žmogui tereikės atidaryti naršyklėje `IP-ADRESAS:8000` ir galės pažiūrėti maketą arba tiesiog parsisiųsti failus. Labai paprastas būdas pasidaryti statinių failų web server - laikinai.

IP adresas turi būti to kompiuterio iš kurio leidžiate šią komandą.

## SimpleHTTPServer trūkumai

Šį Python modulį panaudojau kokį tūkstantį kartų savo karjeroje. Labai patogu kai nori pasidalinti vienu ar keliais failais.

Esi priekinės sąsajos programuotojas (angl. „frontend developer“) ir nori parodyti padarytą svetainės prototipą ar maketą? Deja, čia `SimpleHTTPServer`pasireiškia su dideliu trūkumu - failų siuntimasis nėra asinchroniškas. Todėl tam, kas juos bando pažiūrėti ar parsisiųsti - viskas bus siunčiama po vieną failą vienu metu. Ir užkrauti tipinį svetainės puslapį užtruks N sekundžių.

Kitas minusas - paleidai statinį serverį - o koks tavo IP adresas? Reikės ieškoti savo IP adreso (taip, su `ifconfig`).

## NodeJs alternatyva

Internete yra pavienių skriptų kurie gali išspręsti `SimpleHTTPServer` lėtumą, bet NodeJs alternatyva tiesiog reikalauja mažiau darbo. O ir prisėdus prie kito kompiuterio lengviau tą patį gauti su:

```
$ sudo npm install http-server -g
$ http-server
Starting up http-server, serving ./
Available on:
  http://127.0.0.1:8080
  http://192.168.8.101:8080
  http://172.18.0.1:8080
Hit CTRL-C to stop the server
```

IP ieškoti nereikės - jis jau Jums po ranka.

Aišku ir vienas (`SimpleHTTPServer`) ir kitas (`http-server`) veiks tik tuomet jeigu sistemoje jau yra Python/NodeJs/NPM. Bet kas gi šiais laikais neturi Python ar NodeJs, tiesa?
