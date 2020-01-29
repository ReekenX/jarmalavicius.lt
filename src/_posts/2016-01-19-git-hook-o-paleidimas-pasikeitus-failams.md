---
title: GIT Hook'o paleidimas pasikeitus failams
category: git
image: i/placeholder.jpg
description: GIT Hooko paleidimas tik pasikeitus tam tikriems failams - labai naudinga kai pasiimate pakeitimus kurie reikalauja atsinaujinti savo paketų programinę įrangą.
---

Anksčiau rašiau kaip su [GIT PUSH](/git/git-push-komanda-projektui-atnaujinti) komanda atnaujinti projektus ir serveryje įvykdyti automatinius veiksmus. Dažniausiai tai:

* Python, PHP ar kitokio programinio kodo atnaujinimas;
* duomenų bazės migracijos;
* media ir kitų statinių failų atnaujinimai;
* duomenų valymo operacijos (sesijų, kešo);
* trečios šalies programinės įrangos konfigūracijos (pvz. apache/nginx perkrovimas).

Produkcinėje sistemoje norėsis ne tik „atominių“ operacijų (čia pagelbės tik nebent [load balancer'ų](https://en.wikipedia.org/wiki/Load_balancing_\(computing\)) panaudojimas), bet ir kuo optimaliau atlikti šias operacijas. Nes laikas ypatingai brangus dalykas, tuo labiau produkcinėje sistemoje.

Vienas iš patarimų kaip daryti tokius deployment'us greičiau - vykdyti komandas tik kai tam tikri failai buvo keisti. Pavyzdžiui nenaujinti duomenų bazės, jeigu tarp pakeistų failų nėra migracijų katalogo redagavimų.

O padaryti tokį tikrinimą nėra sunku su `post-rewrite` hook'u kurį aprašytume `.git/hooks/post-rewrite` faile:

```bash
#!/bin/bash

changedfiles=( $(git diff --name-only HEAD@&#123;1&#125; HEAD) )

if [[ "$&#123;changedfiles[*]&#125;" =~ "bower.json" ]]; then
    bower install && bower update
fi

if [[ "$&#123;changedfiles[*]&#125;" =~ "package.json" ]]; then
    npm install
fi

if [[ "$&#123;changedfiles[*]&#125;" =~ "migrations/" ]]; then
    python manage.py migrate
fi

if [[ "$&#123;changedfiles[*]&#125;" =~ "migrations/" ]]; then
    php vendors/phpmigrations/manage.py migrate
fi
```

Ir jeigu esate pastabus programuotojas, žinosite, kad reikia suteikti šiam failui vykdymo teises su `chmod +x .git/hooks/post-rewrite`.

Trumpi paaiškinimai. Kintamajam `changedfiles` priskiriame masyvą pakeistų failų (dėl to ir yra skliaustai apie komandą `git diff --name-only HEAD@&#123;1&#125; HEAD`). Vėliau `if` sąlygomis tikriniame ar jis turi bent vieną elementą kuris gali atitikti užklausą (operatorius `=~`). Ir jeigu atitinka - vykdome komandas. Aukščiau pateikiau ne vieną variantą kuris gali praversi JavaScript, PHP ar kitų kalbų programuotojams. Žinoma, nenaudokite to vien tik migracijoms - panaudokite ir kitoms operacijoms.

Šis `post-rewrite` hook'as vykdomas kai vyksta istorijos redagavimas. Jis pavykdys „commit“ žinutės keitimo (`git commit --amend`) ar istorijos medžio lipdymo/konstravimo metu (`git rebase`).

Jums gali praversti angliškas [hook'ų aprašymas GIT dokumentacijoje](https://git-scm.com/docs/githooks).
