---
title: Didelių Mysql duomenų bazių parsisiuntimas
category: atviras-kodas
image: i/mysqldump.png
description: Kaip parsisiųsti 100GB ar didesnį / mažesnį Mysql duomenų bazės dumpą.
---

Duomenų bazių dump'ų parsisiuntimas yra dažniausiai normali praktika dirbant su projektais. Kartais tie duomenų bazės dump'ai užima labai daug. Rašysiu apie kokius 100GB - tuo pačiu nedidelis ir didelis duomenų bazės archyvas.

Iš mano praktikos, parsisiųsti 100GB ir įdiegti trunka ne trumpiau nei 4 valandas. Net ir galingose/greitose sistemose. Bet čia kalbu tik apie serveris -> kompiuteris persiuntimą/diegimą.

Kiek tiksliai trunka 100GB priklauso ne tik nuo sistemų, diskų, interneto greičio, užimtų resursų bet ir būdo kuriuo tai darote.

## Kaip sužinoti kiek užima duomenų bazė?

Sužinoti kiek maždaug sveria duomenų bazė galite su [SQL užklausa](https://coderwall.com/p/gzoaeq/mysql-datbase-size-in-gb):

```sql
SELECT table_schema AS "Database",
     Round(Sum(data_length + index_length) / 1024 / 1024 / 1024, 1) AS "Size in GB"
FROM information_schema.tables
GROUP BY table_schema
```

Atspausdins kažką panašaus į tai:

```
+--------------------+------------+
| Database           | Size in GB |
+--------------------+------------+
| project1           |      119.1 |
| project2           |       82.8 |
| project3           |       35.6 |
| mysql              |       10.0 |
+--------------------+------------+
4 rows in set, 0 warning (0.45 sec)
```

Visada prieš dump'inant pasitikrinkite kiek sveria duomenų bazė, kad galėtumėte kuo greičiau tai padaryti.

## O kas jeigu yra maža duomenų bazė?

Mažiau sveriančias duomenų bazes (iki 5GB) galite dump'inti gana paprastai:

```bash
ssh example.org 'mysqldump nuotoline-duombaze | gzip -c' \
  | gzip -d \
  | mysql lokali-duombaze
```

Gzip glaudinimą naudokite visada. Įprastai 5GB gali tapti kokiais 1GB ar mažiau.

Verta pabrėžti, kad tokį siuntimą greičiausiai pajus tame pačiame tinkle sėdintys kolegos. Bet srauto ribojimas - kita tema.

## Didelės duomenų bazės parsiuntimas

Turbūt neverta kalbėti, kad siųstis produkcinės sistemos dump'ą yra prasta mintis saugumo prasme.

Programavimui dažnai nereikės labai senų įrašų, todėl greičiausiai užteks iš kiekvienos lentelės pasiimti N tūkstančių paskutinių įrašų.

Nudumpinti didelę sistemą galima skripto pagalba:

```bash
#!/bin/bash
if [ -z "$1" ]
then
    echo "ERROR: Missing required arguments"
    echo "USAGE: $0 ssh-hostname-params remote-db-name local-db-params"
    exit 1
fi
MAX_ROWS=100000
COMMIT_COUNT=0
COMMIT_LIMIT=10
for TABLE in `ssh $1 "mysql $2 -N -e 'SHOW TABLES'"`
do
    ROWS=$(ssh $1 "mysql -N $2 -e 'SELECT COUNT(*) FROM $TABLE'")
    if [ $ROWS -lt $MAX_ROWS ]
    then
        echo "Getting all $ROWS rows from table $TABLE..."
        ssh $1 "mysqldump --hex-blob --routines --triggers $2 --tables $TABLE | gzip -c" \
          | gzip -d \
          | mysql $3 &
    else
        echo "Getting last $MAX_ROWS out of total $ROWS rows from table $TABLE..."
        FROM_ROWS=$(($ROWS-$MAX_ROWS))
        ssh $1 "mysqldump --hex-blob --routines --triggers $2 --tables $TABLE --where='1 LIMIT $FROM_ROWS, $MAX_ROWS' | gzip -c" \
          | gzip -d \
          | mysql $3 &
    fi
    (( COMMIT_COUNT++ ))
    if [ ${COMMIT_COUNT} -eq ${COMMIT_LIMIT} ]
    then
        COMMIT_COUNT=0
        echo "Waiting for $COMMIT_LIMIT processes to finish..."
        wait
    fi
done
if [ ${COMMIT_COUNT} -gt 0 ]
then
    wait
fi
```

Paleidimas turėtų būti gana aiškus:

```bash
./skriptas serveris nuotoline-duombaze lokali-duombaze
```

Kuom šis skriptas sprendžia problemą didelėms duombazėms:

* Siunčiami tik paskutiniai `MAX_ROWS` lentelių įrašai. Kaip matote, kad parsiųsti paskutinius reikia dar ir paskaičiuoti kiek tų įrašų yra.
* Vienu metu daromi iki 10 siuntimų ir tuomet palaukiama kol 10 segmentas baigsis ir tada siunčiama dar 10 vienu metu. Skaičių galite padidinti/sumažinti pakeitę `COMMIT_LIMIT` konstantą.
* Skriptas praneša kokios lentelės, kiek juose yra įrašų ir ar siunčiama visa lentelė ar tik jos dalis.
* Naudojamas gzip suglaudinimas kad pataupyti visų pusių resursus.

## Praktinis pavyzdys

Teko parsisiųsti 116GB (staging) duomenų bazės dump'ą - parsisiuntus tik paskutinius šimtą tūkstančių įrašų pats dump'as virto 15GB duomenų baze.

Parsisiuntus 36GB (staging) archyvą - duomenų bazė užėmė 2.6GB.

## Privalumai ir trūkumai

Privalumai turbūt akivaizdūs: greitas parsisiuntimas, mažai išnaudoto interneto srauto, greita darbo pradžia.

Tačiau už to, žinoma, slypi ir trūkumų lavina - sąryšiai tarp lentelių. Dėl tokio parsisiuntimo kai kurie įrašai turės trūkstamų sąryšių. O tai nuves į tai, kad programinė įranga veiks ne korektiškai arba kai kurie komponentai neveiks visai.

Ar mano praktikoje tai kada nors pakenkė? Ne, nes visada suradus ko trūksta (greičiausiai bet koks framework'as praneš, kad toje ir toje lentelėje trūksta sąryšio) galima parsisiųsti tam tikrą lentelę.

Kitas didelis trūkumas ir ko reikia saugotis - CPU išnaudojimas. Tokio parsisiuntimo metu naudosite labai daug CPU resursų tiek nuotoliniame serveryje, tiek lokaliai. Taip irgi galite sutrikdyti kitų kolegų darbą.

Priminsiu, kad toks dump'inimas yra skirtas tik programavimo tikslams.
