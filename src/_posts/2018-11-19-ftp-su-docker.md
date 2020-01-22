---
title: FTP su Docker
category: docker
image: i/FTP-icon.jpg
description: Reikia laikino FTP demono serveryje? Arba visai ne laikino, bet konfigūruojamo FTP serviso Jūsų klientams? Su Docker pagalba tai tik kelios sekundės.
---

Kažkada [užsiiminėjant savanoriška veikla](/remigijus-jarmalavicius) teko bendrauti su Lietuviška IT įmone kuri viename projekte turėjo ištaisyti kelias savo klaidas. Na, gal ne tiek, kad kelias klaidas, veikiau jau visiškai neveikiantį projektą sutaisyti. Tačiau įmonė buvo iš tų dinozauriškų laikų, kur support'ą savo neveikiantiems projektams darė per... FTP :(

Ir žinoma, kas šiais laikais nori į serverius diegti FTP? Laimei, žinojau, kad prieigos reikia 1-3 dienoms - kol projektas bus pataisytas. Taigi FTP pakūriau su Docker pagalba.

## Sukurkime FTP serverį su Docker

Vos viena komanda ir ant standartinio prievado (angl. „port“) bus pakurtas FTP servisas / demonas kuris turės vieną vartotoją ir galės vaizduoti tik vieną FTP katalogą:

```
docker run -d -v /kelias/iki/projekto:/home/vsftpd \
           -p 20:20 -p 21:21 -p 47400-47470:47400-47470 \
           -e FTP_USER=VARTOTOJAS \
           -e FTP_PASS=SLAPTAŽODIS \
           -e PASV_ADDRESS=SERVERIO-IP \
           --name ftp \
           --restart=always \
           bogem/ftp
```

Panaudotas Docker atvaizdas - {% include external_link.html url="https://hub.docker.com/r/bogem/ftp" text="bogem/ftp" %}

## Kodėl ne ProFTPd ar kita įranga?

Iš esmės gali kilti klausimas kam reikia Docker'io čia, kai nuo to paties skiria vos viena komanda:

```bash
apt-get install proftpd
yum install proftpd
[..]
```

Pirmiausiai tai, kad gyvename jau ne dinozaurų laikais ir Docker jau turėtų tapti vos ne būtinybė serveriuose. Arba kitokios, konteinerizuotos, Docker alternatyvos.

Antra - Docker duoda tiek pat kontrolės kaip ir įdiegtos specializuotos programinės įrangos.

Trečia - Docker daugeliu atveju išsprendžia poreikį konfigūruoti programinės įrangos nustatymus. Vos viena komanda - ir FTP servisas jau pilnai veikiantis, turi vartotojus ir gali būti bet kada lengvai atjungtas.

## FTP sustabdymas

Ar veikia ar neveikia Docker FTP atvaizdas/konteineris matysite su `docker ps` komanda. Jeigu nėra FTP įrašo - vadinasi konteineris neveikia ir FTP neveikia. Jeigu įrašas yra, reiškia FTP vis dar veikia.

Išjungti konteinerį galima su tokia Docker komanda:

```
docker stop ftp
```

## FTP pašalinimas iš sistemos

Sustabdžius konteinerį galima jį pašalinti:

```
docker rm ftp
```

Docker konteinerio nebematysite:

```
docker ps -a | grep ftp
```

Jeigu žinote, kad FTP tikrai daugiau nebereikės, tuomet galite pašalinti ir patį atvaizdą kuris yra vis dar Jūsų diske. O diske jis todėl, kad kitą kartą paleidus FTP kūrimo komandą - viskas suveiks žaibiškai, nes atvaizdas užkešuotas ir siųsti iš interneto jo jau nereikės.

Pašalinkite atvaizdą ir atlaisvinkite disko vietą:

```
docker rmi bogem/ftp
```
