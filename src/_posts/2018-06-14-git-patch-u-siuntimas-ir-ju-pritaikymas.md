---
title: GIT patch'ų siuntimas ir jų pritaikymas
category: git
image: i/git_patch.png
description: GIT patchų generavimas retenybė? Retenybė, tačiau kartais tenka. Trumpa atmintinė kaip generuoti GIT patchus ir kaip juos pritaikyti kodui.
---

Laikais, kada į GitHubą galima tiesiog supushint'i savo branch'ą ir nesukti sau galvos, turbūt retai kada tenka kam nors generuoti GIT Patch'ą ir jį kur nors siųsti.

Taip retai, kad toks siuntimas tampa galvos skausmu - reikia prisiminti kaip tą daryti (produktyviai) ir kaip vėliau tuos patch'us applyint'i.

Taip nutiko ir man, kai beveik dienai užlūžo Gitlab'as ir reikėjo kažkur pasidėti pakeitimus nes dirbu per kelis kompiuterius.

{% include post_image.html image="/i/gitlab_down.png" text="Gitlab paslaugos neveikimo langas" %}

Kur pasidėti - labai paprasta - Dropbox. Bet kaip juos sugeneruoti ir kaip juos vėliau applyint'i - teko prisiminti. Toliau - trumpa atmintinė visiems (ir sau).

## Patch'ų generavimas

Jeigu pirmiausiai šovė į galvą:

```bash
git diff > failas.patch
```

Tai iškart galiu pasakyti, kad toks generavimas turi krūvas minusų:

* Neproduktyvu, jeigu norėsite tą atlikti ant kelių ar daugiau komitų.
* Prarasite binarinius failus (jie nebus įtraukti).
* Prarasite naujus failus kurie nepridėti su `git add`.
* Taip pat galite įtraukti tik dalį pakeitimų, nes yra skirtumas tarp `git diff` ir `git diff --cached`.

Todėl produktyviausiu būdu tampa: standartinis darbas (kada komitinat daug mažų pakeitimų) ir:

```bash
git format-patch origin/master -o pakeitimai
```

Viena komanda, o daro daug:

* Sukurs katalogą `pakeitimai/` kuriame sudės patch'us.
* Kiekvienas patch'as turės numeraciją: 0001, 0002, ...
* Kiekvienas patch'o failo pavadinimas bus sugeneruotas iš komito teksto, pavyzdžiui: 0001-use-staging-api-for-staging-env.patch

O dėl `origin/master` ar nereikia repozitorijai būti pasiekiamai? Ne, nes siunčiantis pakeitimus (`git fetch` ar `git pull`) GIT'as pasižymi kokie komitai yra kokiose atšakose.

## Patch'ų pridėjimas

Applyint'i pakeitimus labai lengva:

```bash
while true
do
  git apply pakeitimai/*
done
```

Shell'as turėtų paduoti `git apply` išrikiuotus failų vardus.
