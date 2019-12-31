---
title: Kaip terminale dirbti su CSV failais
permalink: /atviras-kodas/kaip-terminale-dirbti-su-csv-failais
category: atviras-kodas
image: i/csv_failo_turinys.png
description: Bash terminale galima lengvai dirbti su CSV failais programos miller pagalba. Filtruokite, rūšiuokite CSV duomenis terminale!
---

Labai mėgstu CSV failo formatą kai kalba eina apie išvestį terminale. Jis patogus skaitymui, jį lengvai supranta GUI programos, o ir didelį failą atsidaryti - jokia bėda. Aišku, kalbame apie darbą su duomenimis terminale.

Pirmiausiai tai trumpai kas yra CSV failo formatas, jeigu yra dar nežinančių apie ką eina kalba:

* tai paprastas tekstinis failo formatas tekstiniams duomenims laikyti;
* pirmoje failo eilutėje gali būti (gali ir nebūti) išvardinti duomenų stulpeliai;
* kitose eilutėse arba nuo pat pirmos gali būti išvardinti duomenys - vienas duomenų masyvas per eilutę;
* stulpeliams atskirti naudojami kableliai (iš to kilęs formato pavadinimas - kableliu atskirtos reikšmės);
* reikšmės turinkčios kablelį turi būti apskliaudžiamos kabutėmis;
* kabutės reikšmėse turi būti aprašomos dviem kabutėmis arba dedamas '\' simbolis prieš jas.

Jeigu kartais prireikia dirbti su CSV failu terminale, tai puikiai pravers atviro kodo [miller](https://github.com/johnkerl/miller) programa. Kadangi kūrėjai instrukcijų (dar?) neparašė, tai įdiegsime ją taip paprastai:

```
git clone https://github.com/johnkerl/miller.git
cd miller
autoreconf -if
./configure
make
```

Sutinku, ne pats gražiausias diegimo procesas, bet ką jau padarysi. Yra kur tobulėt programos autoriams.

Ir Jūsų kompiuteryje bus įdiegta `mlr` komanda, kurią galėsite pasinaudoti darbui su CSV failais.

Programos pagalos apraše rasite krūvas panaudojimo pavyzdžių.

Pasižiūrime CSV failo turinį:

```
$ mlr --csv cat Managers.csv

playerID,yearID,teamID,lgID,inseason,G,W,L,rank,plyrMgr
wrighha01,1871,BS1,NA,1,31,20,10,3,Y
woodji01,1871,CH1,NA,1,28,19,9,2,Y
paborch01,1871,CL1,NA,1,29,10,19,8,Y
lennobi01,1871,FW1,NA,1,14,5,9,8,Y
```

Rodome tik kai kuriuos stulpelius:

```
$ mlr --csv cut -f playerID,yearID  Managers.csv

playerID,yearID
wrighha01,1871
woodji01,1871
paborch01,1871
lennobi01,1871
```

Darome tikrą CSV failo duomenų filtravimą:

```
$ mlr --csv filter '$yearID > 1871'  Managers.csv

playerID,yearID,teamID,lgID,inseason,G,W,L,rank,plyrMgr
cravebi01,1872,BL1,NA,1,41,27,13,2,Y
millsev01,1872,BL1,NA,2,17,8,6,2,Y
clintji01,1872,BR1,NA,1,11,0,11,9,Y
woodji01,1872,BR1,NA,2,18,3,15,9,Y
```

Išrikiuojame duomenis pagal stulpelį:

```
$ mlr --csv sort -f playerID Managers.csv

playerID,yearID,teamID,lgID,inseason,G,W,L,rank,plyrMgr
actama99,2007,WAS,NL,1,162,73,89,4,N
actama99,2008,WAS,NL,1,161,59,102,5,N
actama99,2009,WAS,NL,1,87,26,61,5,N
actama99,2010,CLE,AL,1,162,69,93,4,N
```

Darome aritmetines operacijas:

```
$ mlr --csv put '$years = $yearID + 1000' then cut -f playerID,years Managers.csv

playerID,years
wrighha01,2871
woodji01,2871
paborch01,2871
lennobi01,2871
```

Trumpai tariant - įspūdinga biblioteka. Lengvai eksportuoti duomenys į CSV failą gali virsti tikra duomenų baze su daugybe galimybių. Žinoma, gerai išmanant `awk` galbūt ir nenorėsis mokintis naudotis dar viena programa, bet man, asmeniškai, po `awk` ši komanda pasirodė kaip produktyvesnis būdas tai daryti.

Išbandykite patys. O programos pagalbos apraše rasite dar daugiau naudingų pavyzdžių.
