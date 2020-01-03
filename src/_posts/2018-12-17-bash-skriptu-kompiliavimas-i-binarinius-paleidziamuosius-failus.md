---
title: BASH skriptų kompiliavimas į binarinius paleidžiamuosius failus
category: atviras-kodas
image: i/ascii_menas.png
description: BASH skriptus rašyti lengva ir jie veikia daugumoje platformų. Jeigu nenorite atskleisti BASH skripto turinio, tuomet šis straipsnis apie jų kompiliavimą.
---

Namų kataloge turiu `bin/` katalogą kuriame per daug metų sukaupiau gausybę skriptų. Tarpų jų yra skriptų visokiomis kalbomis: BASH, SH, Ruby, PHP, Python. Šis katalogas auga ir per Dropbox yra perduodamas kitiems mano kompiuteriams.Dauguma kalbų, tokių kaip Ruby ar Python, leidžia sukompiliuoti savo skriptus. O šiuos - galima dalinti kitiems. Tačiau ar žinojote, kad tą patį galima padaryti ir su BASH?Jeigu nesinori perduoti plik,o ir visiem perskaitomo BASH skripto, įdiekime `shc`:```
apt-get install shc
yum install shc
brew install shc
```## BASH skriptų kompiliavimasKompiliavimas vyksta labai paprastai:```
shc -f bash_skriptas.sh -o sukompiliuotas_skriptas
```Vėliau, savo skriptą galima paleisti su komanda: `./sukompiliuotas_skriptas`.## Sukompiliuoto skripto tikrinimasPatikrinti ar tai tikrai sukompiliuotas failas galima keliomis komandomis:```
$ file sukompiliuotas_skriptas
sukompiliuotas_skriptas: Mach-O 64-bit executable x86_64
```arba tiesiog pažiūrėjus jo turinį su `less sukompiliuotas_skriptas`.Ką daugiau gali ši komanda galite perskaityti [shc žinyno puslapyje](https://linux.die.net/man/1/shc).