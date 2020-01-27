---
title: SD kortelių greičio tikrinimas prieš naudojant
category: raspberry-pi
image: i/sd-korteliu-greicio-tikrinimas-pries-naudojant.png
description: Kaip sužinoti SD (ar microSD) kortelės greitį prieš ją naudojant su Raspberry Pi.
---

Visai neseniai teko „pakurti“ dar vieną projektą su Raspberry Pi. Tvarkiau
namų zonos filmavimo įrangą ir kadangi buvo labai svarbu turėti greitą SD
kortelę teko tikrinti N tokių kortelių iš savo stalčiaus, kuriame jų prikaupiau
per N metų.

Laimei su Linux tai padaryti nėra sunku, nes yra ne viena programa kuri netrunka
laiko įsidiegti ir panaudoti. Surasti kokiu greičiu dirba SD (micro SD ar USB)
kortelė yra lengva.

Pirmiausiai įdėjus ją į kitą kompiuterį reikėtų sužinoti kuriame Linux įrenginyje
kortelė buvo priregistruota. Tą padaryti galima pasižiūrėjus komandos `fdisk -l`
išvesties skirtumą prieš kortelę įdedant ir po įdėjimo.

Žinant, kur priregistruotas naujas įrenginys, pasižiūrėti jo įrašymo ir skaitymo
greitį galima pasinaudojus `hdparm` programa.

Praktinis panaudojimo pavyzdys:

```bash
$ sudo fdisk -l

[..]

Device     Boot Start     End Sectors  Size Id Type
/dev/sdb1  *       63 7897086 7897024  3,8G 83 Linux

$ sudo hdparm -t /dev/sdb1

/dev/sdb1:
 Timing buffered disk reads:  48 MB in  3.06 seconds =  15.68 MB/sec
```

Patarimas - greitį pasitikrinkite kelis kartus. Jis gali nežymiai kisti. Taip yra
dėl daugelio priežasčių.

Kadangi turėjau ne vieną kortelę - lengvai išsirinkau greičiausią. Naujos
pirkti nereikėjo. Jau anksčiau esu rašęs, kad kuo greičiau duomenis skaito Jūsų SD
(ar microSD) kortelė, tuo greičiau veiks Raspberry Pi operacinė sistema ir joje
esančios programos, kurios naudoja tą diską.
