---
title: Kaip pagreitinti HDD disko darbą
category: atviras-kodas
image: i/hdd_ssd.jpg
description: Kaip gauti laikinos disko vietos arba kaip pagreitinti skaitymą iš HDD disko.
---

Daug anksčiau, kai dar mano asmeniniai kompiuteriai turėjo lėtus HDD diskus, ne kartą tekdavo susidurti su disko greičio bėda. Dabar SSD diskai yra velniškai pigūs todėl nėra nė kalbos apie jų atsinaujinimą.Tuomet, tokias „lėtumo“ problemas spręsdavau disko katalogą (Linux sistemose) perkeldamas į atmintį (RAM). Tą padaryti galima keliomis komandomis ir net nereikia perkrauti kompiuterio, kad tai išsimėginti.Pavyzdžiui jeigu Jūs savo visus laikinus failų parsisiuntimus keltumėte į `/tmp/` katalogą, tai viskas vyktų greičiau jeigu jį perkeltumėte į RAM. Tokio failo skaitymas ir vykdymas būtų ženkliai greitesnis, nei HDD (pavyzdžiui nešiojamo kompiuterio, kuris veikia 5 tūkstančių apsisukimų greičiu). Komanda:```
sudo mount -o size=1G -t tmpfs none /tmp
```Viena komanda perkelsite katalogo `/tmp/` turinį į RAM atmintį, kurioje rezervuosite 1GB vietos. Tai reiškia, kad turėsite 1GB atminties tuo metu mažiau. Tai anokia bėda, jeigu turite nemažai vietos (bent 4GB ar 8GB).Tokia komanda gali būti perkelta į `/etc/fstab` failą ir tuomet, startuojant Linux, automatiškai bus prijungtas katalogas.Savo prijungtus katalogus galite matyti parašę:```
mount # nereikia `sudo`
```Bet kaip minėjau, perėjus į SSD toks poreikis dingo. Tačiau komandą vis dar naudoju iki šiol. Kodėl? Nes dažnai būna tokių situacijų serveriuose, kai pritrūksta [inodes](https://en.wikipedia.org/wiki/Inode).O su tokia situacija tikrai galima susidurti kai tenka atnaujinti operacinę sistemą kokiame sename serveryje neturinčiame daug resursų.Mažas pastebėjimas, kad mount'inimas neištrina Jūsų failų. Katalogas, žinoma, bus tuščias, tačiau iki tol, kad atsisakysime `mount` operacijos:```
sudo umount /tmp
```Ir matysite senus failus.
