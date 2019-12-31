---
title: Postfix laiškų siuntimų statistika
category: atviras-kodas
image: i/placeholder.jpg
description: Siunčiamų laiškų statistikos generavimas Postfix įrangai. Mums padės pflogsumm programinė įranga / pagalbininkas.
---

Ėmė ir atsitiko, kad teko pasitikrinti ar kartais serveriuose nesiunčiamas šlamštas (angl. spam) ar kokie masiniai laiškų siuntimai (angl. bulk mailing).

Žinoma, pirma mintis šovusi į galvą - paprasčiausiai patikrinti klaidų žurnalus serveryje. Tačiau juose tiek daug įrašų, kad rasti „kaltininkus“ gali būti sunku. Čia į pagalbą atskuba programinė įranga - `pflogsumm`.

Įdiegiame (Debian sistemose):

```
    sudo apt-get install pflogsumm
```

Įdiegiame (jeigu Red Hat sistemose):

```
    sudo yum install pflogsumm
```

Ir be jokio konfigūravimo galime pasižiūrėti statistiką iš vieno failo:

```
    cat /var/log/mail.log | /usr/sbin/pflogsumm
```

Ir gausime kažką panašaus:

```
    Grand Totals
    ------------
    messages

         45   received
         43   delivered
          0   forwarded
          4   deferred  (65  deferrals)
          1   bounced
          2   rejected (4%)
          0   reject warnings
          0   held
          0   discarded (0%)

       8361k  bytes received
       8355k  bytes delivered
         34   senders
         22   sending hosts/domains
          7   recipients
          4   recipient hosts/domains
    [..]
```

Statistikos gausite tikrai daug: kaip „sėkmingai“ vyko laiškų siuntimas ir gavimas, kokie domenai gavo daugiausiai laiškų, kokie el. pašto adresai jų gavo, dažniausi sistemų klaidų pranešimai (pvz. jeigu kokie laiškai buvo atmetami). Ir dar daugiau, sunku net išvardinti - pasižiūrėkite patys.

Kadangi statistika išskirta grupėmis (įeinantys laiškai ir išeinantys laiškai) lengva bus rasti kaltininkus kurie galbūt siunčia per daug arba kai yra kas nors konfigūracijose blogai (pvz. ar `smtp` leidžia siųsti laiškus be autorizacijos - vis dar populiari tingių serverių administratorių klaida).

O paranoja sergantiems tikriausiai pravers tokios statistikos siuntimas į paštą:

```
    cat /var/log/mail.log | /usr/sbin/pflogsumm | mail -s "Postfix statistika" vardenis@example.org
```

Pavyzdžiui dienai baigiantis, `crontab -e`:

```
    59 23  *   *   * cat /var/log/mail.log | /usr/sbin/pflogsumm | mail -s "Postfix statistika" vardenis@example.org
```