---
title: BASH skriptų kompiliavimas į binarinius paleidžiamuosius failus
category: atviras-kodas
image: i/ascii_menas.png
description: BASH skriptus rašyti lengva ir jie veikia daugumoje platformų. Jeigu nenorite atskleisti BASH skripto turinio, tuomet šis straipsnis apie jų kompiliavimą.
---

Namų kataloge turiu `bin/` katalogą kuriame per daug metų sukaupiau gausybę
skriptų. Tarp jų yra skriptų visokiomis kalbomis: BASH, SH, Ruby, PHP, Python,
JavaScript (Node). Šis katalogas auga ir per Dropbox yra perduodamas kitiems
mano kompiuteriams.

Dauguma kalbų, tokių kaip Ruby ar Python, leidžia sukompiliuoti savo skriptus.
O šiuos - galima dalinti kitiems.

Tačiau ar žinojote, kad tą patį galima padaryti ir su BASH? T.y. pasidaryti
binarinį paleidžiamą failą?

## SHC paketas

Jeigu nesinori perduoti pliko ir visiem perskaitomo BASH skripto, įdiekime
`shc`.

Naujuose Ubuntu tai galima padaryti su:

```bash
apt install shc
```

Debian arba senesniuose Ubuntu OS:

```bash
apt-get install shc
```

Fedora ir Centos OS:

```bash
yum install shc
```

MacOs:

```bash
brew install shc
```

## Skriptų kompiliavimas

Kompiliavimas vyksta labai paprastai ir vos viena komanda:

```bash
shc -f bash_skriptas.sh -o sukompiliuotas_skriptas
```

Vėliau, savo skriptą galima paleisti su komanda: `./sukompiliuotas_skriptas`.

Tiesa, kažkam jį perdavus / nusiuntus gali reikėti pakeisti paleidimo teises:

```bash
chmod +x sukompiliuotas_skriptas
```

## Sukompiliuoto skripto tikrinimas

Patikrinti ar tai tikrai sukompiliuotas failas galima keliomis komandomis:

```bash
$ file sukompiliuotas_skriptas
sukompiliuotas_skriptas: Mach-O 64-bit executable x86_64
```

Arba tiesiog pažiūrėjus jo turinį su `less sukompiliuotas_skriptas`.

Ką daugiau gali ši komanda galite perskaityti
{% include external_link.html url="https://linux.die.net/man/1/shc" text="shc žinyno puslapyje" %}.
