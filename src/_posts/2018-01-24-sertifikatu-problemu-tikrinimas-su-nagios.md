---
title: Sertifikatų problemų tikrinimas su Nagios
category: atviras-kodas
image: i/monitorinimas.png
description: Sekite savo HTTPS sertifikatų galiojimą, konfigūraciją ir kitokias problemas su Nagios! Su kodo pavyzdžiais.
---

Kai turite daug HTTPS domenų, tai jiems stebėti verta turėti monitorinimo sistemą, tokią kaip Nagios.Vienas iš darbų kurį turėtų atlikti bet kuri monitorinimo sistema - stebėti Jūsų turimų projektų sertifikatus.Sertifikatui tikrinti Nagios'e galima susikurti komandą (faile `commands.cfg`):```
define command {
  command_name check_https_cert
  command_line /usr/nagios/[..]/check_ssl_cert -w 14 -c 7 -H $HOSTADDRESS$ -r /etc/ssl/certs/
}
````Argumentų aprašymas:| -w 14         | Nagios uždės 'Warning' būseną, kai iki sertifikato galiojimo pabaigos lieka 14 dienų. |
| -c 7          | Nagios uždės 'Critical' būseną, kai sertifikato galiojimas baigsis už 7 dienų. |Ir tuomet jau priskiriant komandą servisui (faile `services.cfg`):```
define service{
  hostgroup_name      https-websites
  use                 generic-service
  service_description HTTPS Cert
  check_command       check_https_cert
}
```Ir pačiame Nagios'e gausime HTTPS sertifikato tikrinimui skirtą taisyklę:{% include post_image.html image="https://www.jarmalavicius.lt/i/nagios_jarmalavicius.png" text="" %}Nurodytų failų reikėtų ieškoti `/etc/nagios/conf.d/` kataloge. Tačiau priklausomai nuo sistemų, galima rasti ir `/usr/local/nagios`.## Kokių pranešimų galima tikėtis?Nagios'as praneš apie sertifikato pasiekiamumą ir jo galiojimo datos pabaigą.Ne kartą buvau papuolęs į konfigūracijų copy-paste būseną, kuomet kažkuri svetainė gaudavo kitos svetainės sertifikatą. Vėlgi - Nagios praneš ir apie tai.Daugiau galima paskaityti angliškame [tikrinimo komandos apraše](https://exchange.nagios.org/directory/Plugins/Network-Protocols/HTTP/check_ssl_cert/details).
