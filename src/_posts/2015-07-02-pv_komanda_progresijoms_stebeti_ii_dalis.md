---
title: Komandų progresijos sekimas su pv komanda, II dalis
permalink: /pv/komandu-progresijos-sekimas-su-pv-ii-dalis.html
image: i/pv/komandu-progresijos-sekimas-su-pv-ii-dalis.png
category: atviras-kodas
description: Straipsnis apie pv komandą. Kaip ja naudotis ir kokie jos privalumai, II dalis.
---

Praėjusiame [straipsnyje](/pv/komandu-progresijos-sekimas-su-pv-i-dalis.html)
papasakojau apie `pv` komandą ir parodžiau keletą jos panaudojimo būdų.

Štai dar keletas pavyzdžių kaip naudoti komandą `pv` kasdieniniams darbams. Archyvuokime katalogą
ir stebėkime jo progresą:

    $ tar cjf - katalogas | pv > archyvas.tar.bz2
    3.55MB 0:00:02 [ 1.2MB/s] [   <=>          ]

Kaip pastebėsite, kad progresijos juosta nieko nerodys, tiesiog ves nuo vieno iki kito galo.
Taip yra todėl, kad `pv` komanda nežino koks bus katalogo turinio dydis. Jį teks nurodyti atskira
komanda, pavyzdžiui:

    $ tar -cf - katalogas | \
         pv -s $(du -sb katalogas | awk '&#123;print $1&#125;') | \
         bzip2 > archyvas.tar.bz2
    1.39MB 0:00:03 [ 929kB/s] [==>     ]  6% ETA 0:00:45

Šiame pavyzdyje mes komandai `pv` nurodome katalogo dydį kurį suskaičiuojame su kita
`bash` komanda. Pavyzdyje tai yra `du -sb some_directory | awk '&#123;print $1&#125;'`, kuri
išves mums katalogo dydį baitais (-s argumentas sumai, -b argumentas išvedimui baitais).

Aišku, taip rašyti komandas nėra labai patogu. Taigi, dažnai naudojant teks pasirašyti
`bash alias` ar kokį `bash` skriptą.

Dar vienas naudingas pavyzdys naudojantis komanda `dd`, kuri taip pat neturi jokių galimybių
stebėti kiek darbo jau atlikta. Taigi, pasinaudojame `pv`:

    dd if=/mnt/mylargefile.img | pv | dd of=~/mycopy.img

Priminsiu, kad vėlgi egzistuos bėda, kad `pv` komanda nežino tikslaus turinio dydžio,
todėl reikės arba jį perduoti su `pv -s` arba apseiti be progresijos išvesties (naudingos
informacijos gali ir taip pakakti, nes rodomas srauto greitis ir praėjęs laikas).

Reikia failą perduoti vietiniame tinkle ir stebėti kaip vyksta darbas? Ne bėda. Štai kaip atrodytų
siuntėjo komanda:

    cat backup.iso | pv -b | nc -l 3333

Štai kaip atrodytų gavėjo komanda:

    nc 192.168.0.1 3333 | pv -b > backup.iso

Taip pat `pv` naudoju ir dump'inant duomenis iš duomenų bazių. Tiesa, tai ne visai lankstus
dalykas dėl apribojimų kurie kliudo sužinoti siunčiamo srauto dydį. Bet užtenka žinoti apytikslį
dydį, kad pateiktas rezultatas būtų tikrai geras:

    mysqldump -h produkcinis_serveris duombaze | pv -s 3g | mysql -h kitas_serveris duombaze

Sužinoti kiek apytiksliai duomenų bazė užima vietos teks pasikreipti į oficialią dokumentaciją.
Mysql variklyje galima:

    SELECT TABLE_NAME, table_rows, data_length, index_length,
    round(((data_length + index_length) / 1024 / 1024),2) "Size in MB"
    FROM information_schema.TABLES WHERE table_schema = "schema_name";

Komanda `pv` tikrai gali praversti tokiais atvejais kai svarbu (arba bent jau „būtų gerai“)
žinoti kiek darbo komandai liko atlikti. Labai praverčia kai dirbama tiesiogiai su failais,
nes nereikia rūpintis teisingu dydžiu nustatymu `pv` komandoje. Bet išsiaiškinus srauto dydį,
nesunkiai komandą galima pritaikyti rodyti tikrai naudingą informaciją.

Taip pat siūlyčiau pasižiūrėti
[aprašymo puslapį](http://manpages.ubuntu.com/manpages/dapper/man1/pv.1.html) dėl komandos
papildomų parinkčių ką rodyti, kaip rodyti ir ko nerodyti.
