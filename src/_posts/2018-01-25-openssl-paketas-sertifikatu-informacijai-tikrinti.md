---
title: OpenSSL paketas sertifikatų informacijai tikrinti
category: atviras-kodas
image: i/https.png
description: Kaip su Bash patikrinti HTTPS paketų informaciją, galiiojimo laiką ir klaidas.
---

[Let's Encrypt](https://letsencrypt.org/) išgelbėjo daugelį svetainių turėtojų nuo mokamų HTTPS sertifikatų. Jeigu anksčiau sertifikatą domenui pirkdavau už 60€ metams, tai dabar jį galima susigeneruoti nemokamai tiesiog turinti prieigą prie serverio.## Let's Encrypt sertifikato galiojimo problemaLet's Encrypt sertifikatai galioja tik 90 dienų. Juos reikia atnaujinti prieš galiojimo pabaigą, kitaip svetainės lankytojai negalės patektį į Jūsų svetainę.Laimei pats Let's Encrypt atsiųs Jums laišką-įspėjimą (laiškas siunčiamas į pašto dėžutę su kuria registruotas sertifikatas):```
Hello,Your certificate (or certificates) for the names listed below will expire in
9 days (on 20 Dec 17 08:22 +0000). Please make sure to renew
your certificate before then, or visitors to your website will encounter errors.www.jarmalavicius.lt[..]
```## Sertifikato problemų monitorinimasSu laiškais būna daug problemų - jie pasimeta, nueina į Spam'ą ir pan. Todėl tikrai rekomenduočiau pasirūpinti monitorinimo sistemą.Apie vieną monitorinimo būdą esu jau rašęs, jį galite rasti straipsnyje - [kaip tikrinti HTTPS sertifikatus su Nagios](http://localhost:4000/atviras-kodas/sertifikatu-problemu-tikrinimas-su-nagios.html).## Tipinės sertifikatų bėdosNereikia ieškoti internete įrankių su kuriais galima būtų spręsti arba surasti sertifikatų bėdas. Linux aplinkoje užteks vieno - `openssl`.Detalią informaciją apie sertifikatą gausime taip:```
openssl s_client -showcerts -connect www.jarmalavicius.lt:443
```Ar serverio sertifikatas tvarkingas matysite paskutinėje eilutėje:```
Verify return code: 0 (ok)
```Apie įvairias problemas galima sužinoti taip pat iš paskutinės eilutės, pavyzdžiui:```
Verify return code: 21 (unable to verify the first certificate)
```## Ar atsinaujino serverio sertifikato data?Atnaujinus sertifikatą ir mėginant pažiūrėti jo galiojimo pabaigos datą per naršyklę galite pamatyti seną datą. Taip yra dėl to, kad net ir sertifikatų informacija yra kešuojama ir bent jau ant Chrome naršyklės, tipinis CTRL+F5 nepadės.Sertifikato datas galima pasitikrinti su:```
$ openssl s_client -servername NAME -connect jarmalavicius.lt:443 2>/dev/null | openssl x509 -noout -dates
notBefore=Jan 24 12:23:39 2018 GMT
notAfter=Apr 24 12:23:39 2018 GMT
```## Neatsinaujino sertifikato data?Po sertifikatų atnaujinimo web serverio perkrovimas yra būtinas. Konfigūracijoms užtenka `nginx reload` arba `apache2ctl reload`.Kartais Let's Encrypt Jūsų sertifikatą padės į `/live/domenas.lt-001` ar kitokį katalogą, todėl reikėtų įsitikinti ar serverio konfigūracijoje nurodytas tas pats kelias.Pažiūrėti kuriame kataloge yra naujesnis sertifikatas galite paėmę pasinaudoję `pem` failu:```
$ openssl x509 -enddate -noout -in cert.pem
notAfter=Mar 20 03:11:24 2018 GMT
```
