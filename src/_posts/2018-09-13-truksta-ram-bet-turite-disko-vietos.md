---
title: Trūksta RAM, bet turite disko vietos?
category: atviras-kodas
image: i/ram.jpg
description: Įsigijote mažą serveriuką savo mikroservisui, tačiau jam karts nuo karto neužtenka RAM? Dažniausiai tai lengvai išsprendžiama, nes mikroservisams disko vietos dažniausiai būna per akis. Tuo pasinaudojus galima gauti netikros RAM atminties, kuri nors bus lėtesnė, bet vistiek labai naudinga.
---

Įsigijote mažą serveriuką savo mikroservisui, tačiau jam karts nuo karto neužtenka RAM? Dažniausiai tai lengvai išsprendžiama, nes mikroservisams disko vietos dažniausiai būna per akis. Tuo pasinaudojus galima gauti netikros RAM atminties, kuri nors bus lėtesnė, bet vistiek labai naudinga.

Taip, kalbu apie SWAP skirsnius.

SWAP skirsniai, grubiai tariant, veikia taip: jeigu operacinė sistema savo atminties neišlaiko RAM'uose, tai dalį tos atminties gali įrašyti į diską, kad ji nepasimestų. Didžiausias minusas yra tas, kad RAM'ai yra N kartų greitesni už diskus, todėl to pasekoje atminties skaitymas ir rašymas šiek tiek kentės. Bet tai vistiek geriau nei išvis neturėti galimybės paleisti mikroserviso ar mokėti už didesnį serverio planą kai jo tikrai nereikia.

## Tikriname ar turite SWAP skirsnių

Dažniausiai jokiuose serveriuose (serveriai.lt, EC2, DigitalOcean) neturėsite SWAP'o. Tą galite pasitikrinti su komanda:

```
    sudo swapon --show
```

Jeigu komanda neišvedė jokio turinio - vadinasi SWAP'o nėra, o tai yra gerai.

Kadangi naudosime disko vietą, tai reikia žinoti kiek jos turime ir nuspręsti kiek iš turimo kiekio galima rezervuoti:

```
    df -h
    udev            968M     0  968M   0% /dev                                                                                                                                                                                                 
    tmpfs           200M  2.3M  198M   2% /run                                                                                                                                                                                                 
    /dev/sda1        40G   28G  9.4G  75% /                                                                                                                                                                                                    
    tmpfs           997M     0  997M   0% /dev/shm                                                                                                                                                                                             
    tmpfs           5.0M     0  5.0M   0% /run/lock                                                                                                                                                                                            
    tmpfs           997M     0  997M   0% /sys/fs/cgroup
```

Iš pavyzdžio aukščiau matosi, kad turime 9GB laisvos vietos. Todėl RAM'ams galėtume skirti kokius 2GB. Tai reiškia, kad tik 7GB disko vietos liks po rezervacijos.

## SWAP sukūrimas

Sukurkime SWAP failą į kurį operacinė rašys atminties informaciją:

```
    sudo fallocate -l 2G /swapfile
```

Ties `2G` galite nurodyti norimą dydį. Ši komanda sukurs pasirinkto dydžio failą - taip vyksta disko vietos rezervacija.

Toliau, saugumo sumetimais, SWAP failą padarykime skaitomą tik `root` naudotojui, kad kiti negalėtų skaityti atminties turinio:

```
    sudo chmod 600 /swapfile
```

Ir dabar galime užregistruoti failą kaip SWAP skirsnį:

```
    sudo mkswap /swapfile
    sudo swapon /swapfile
```

## Pasitikriname ar turime daugiau atminties

Pasitikrinti savo naują atmintį galima su:

```
    sudo swapon --show
    NAME      TYPE SIZE   USED PRIO
    /swapfile file   2G 839.8M   -2
```

## Atmintis dingsta po perkrovimo

Jeigu tokio atminties padidinimo reikia tik vienam kartui (tarkime turite procesą kurį leisite tik kartą ir jis naudoja daugiau RAM atminties nei turite), tai bus džiugu, kad po serverio perkrovimo SWAP'o neliks, o SWAP failą galėsite ištrinti ir taip atgauti disko vietą.

Tačiau jeigu norite, kad mikroservisai (kaip pavyzdys) nuolat turėtų RAM'ą, tuomet užteks skirsnių registracijos metu užregistruoti ir SWAP'ą keliomis komandomis:

````
    echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
```

Failo `/etc/fstab` atsarginę kopiją visada pravartu turėti.