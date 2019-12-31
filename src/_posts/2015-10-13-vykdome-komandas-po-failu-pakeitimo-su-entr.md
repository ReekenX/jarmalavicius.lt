---
title: Vykdome komandas po failų pakeitimo su Entr
permalink: /atviras-kodas/vykdome-komandas-po-failu-pakeitimo-su-entr
category: atviras-kodas
image: i/placeholder.jpg
description: Straipsnis apie automatinį komandų vykdymą kai stebimas failas yra keičiamas.
---

Daugelis tikriausiai žino `grunt watch` komandą kuri naudojama stebėti failus ir pavykdyti nurodytas komandas tiems failams pasikeitus. Dažnai šio funkcionalumo reikia ir kitiems dalykams, nebūtinai projektų failams.

Anksčiau naudojau `inotifywait` kurį galite gauti įsidiegę operacinėje sistemoje `inotify-tools` paketą. Naudojimo pavyzdys:

```
    while inotifywait -e close_write failas.txt; do ./komanda.py; done
```

Viena iš didelių bėdų kurią reikia išspręsti yra failų pakeitimas kitu failu. Dauguma teksto redaktorių išsaugant failą tiesiog užrašo failą vietoje kito failo ir `inotifywait` komanda nustoja veikti - nes tokio failo kurį tikrinate - jau nebėra (linksinio „node“, jeigu tiksliau).

Šią problemą tenka spręsti sukant ciklą `while true` ir tokiu būdu tikrinant ar failas keitėsi. Tai ne pats gražiausias ir patogiausias būdas tą daryti.

O sprendimų tam tikrai yra. Vien GitHub ką Jums gali pasiūlyti: [filewatcher](https://github.com/thomasfl/filewatcher) ar [when-changed](https://github.com/joh/when-changed)

O aš tokiems dalykams naudoju labai primityvią komandą `entr`. Įdiegiame labai paprastai:

```
    apt-get install entr
```

Jai paduosime failą/failus kuriuos norime stebėti ir komandą kurią norime vykdyti. Gerai tai, kad ji neturi `inotifywait` aprašyto apribojimo. Taigi, failai gali būti perrašomi.

Štai pavyzdys kaip ją panaudojau rašant šį straipsnį:

```
    ls vykdome-komandas-po-failu-pakeitimo-su-entr.md | entr pelican content
```

Taigi, tik pakeičiu nurodytą failą ir `entr` automatiškai pavykdys `pelican` turinio konstravimo komandą.

Kadangi failus nurodome terminalo „globingo“ (neįsivaizduoju kas arčiausiai būtų lietuviško atitikmens) pagalba, tai galima nurodyti ir ne vieną failą:

```
    ls content/* | entr pelican content
```

Aišku, gali tekti susidurti su situacija kada reikia kelių komandų pavykdymo. Į pagalbą ateina `bash -c` ar bet kokio kito shell'o komandų vykdymo programa. Štai kaip perkuriu statinį tinklaraščio turinį ir atnaujinu naršyklės langą kai rašau straipsnį:

```
    ls content/* | entr bash -c "pelican content; bash browser-refresh.bash Vykdome"
```
