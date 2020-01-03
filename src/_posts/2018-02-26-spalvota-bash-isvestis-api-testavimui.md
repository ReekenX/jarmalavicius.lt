---
title: Spalvota BASH išvestis API testavimui
category: atviras-kodas
image: i/json.png
description: Kodėl kartais Bash API testavimui yra geriau nei Postman? Kaip galima turėti prodyktyvesnį API testavimą terminale ir kuom jis pranašesnis.
---

Daug dirbant su API tokie įrankiai kaip [Postman](https://chrome.google.com/webstore/detail/postman/fhbjgbiflinjbdggehcddcbncdddomop) yra nepakeičiami. Tačiau jeigu reikia vieno-kito API pabandymo ar „testinio važiavimo“, tai surinkti `curl` sakinį terminale - paprasčiau.

Pats dažnai pasiduodu darbui su API terminale, todėl čia ypatingai svarbu matyti kuo patogesnį vaizdą.

Panagrinėkime labai nedidelį pavyzdį:

```
$ curl -X POST 'https://example.com/api/v1/users/token'
{"error":"UNAUTHORIZED","message":"Invalid username / password"}
```

Kai nedaug turinio - viskas labai paprasta.

## Formatavimas

Turint daug daugiau turinio/išvesties - skaityti bus nepatogu. Todėl formatavimui galima pasitelkti Python pagalbą:

```
$ curl -qs -X POST 'https://example.com/api/v1/users/token' | python -m json.tool
{
    "error": "UNAUTHORIZED",
    "message": "Invalid username / password"
}
```

Verta pastebėti, kad pridėjau `-qs` parametrus kurie paslėps nereikalingą `curl` progresijos informaciją.

## Kiti įrankiai, be Python

Žinoma, yra visokių įrankių, kaip [JQ](https://stedolan.github.io/jq/), kurie gali suformatuoti `json` išvestį, tačiau Python'as tam turi standartinę biblioteką. O Python'ą galima rasti praktiškai visur.

Didelis tokio įrankio kaip [JQ](https://stedolan.github.io/jq/) privalumas yra tas, kad jis gali tekstą ne tik gražiai suformatuoti, bet jį dar ir atfiltruoti. Pavyzdžiui jeigu API išvardina visus miestus, koordinates ir šalis kurioms jie priklauso - galite atsifiltruoti viską išskyrus koordinates jeigu jų nereikia.

Didelis šio įrankio minusas: labai prasta dokumentacija ir velniškai sunku naudotis. Ne kartą teko pasiduoti bandant per daug gudriai išfiltruoti duomenis.

Todėl paprastiems dalykams puikiai tiks `python -m json.tool`, o sudėtingesniems, kai reikia dar ir su duomenimis dirbti - teks Google'inti.

## Spalvos

Jeigu duomenų tikrai daug - būtų patogiau juos matyti dar patogiau - su spalvomis. Įdiekime `Pygmentize` biblioteką:

```
$ sudo pip install Pygments
```

Ir tada prie `python -m json.tool` pridurkime `pygmentize -l json`.

Pavyzdys kaip tai atrodo mano terminale:

{% include post_image.html image="/i/spalvotas_json.png" text="curl API | python -m json.tool | pygmentize -l json" %}

## Aliasas pagalbai

Kad nerašyti tos ilgos komandos kaskart kai reikia, `bash` ir `zsh` esu pasidaręs alias'ą:

```
alias json="python -m json.tool | pygmentize -l json"
```

Todėl galiu rašyti trumpiau komandas:

```
$ curl -X POST 'https://example.com/api/v1/users/token' | json
```

Ir taip greitai gauti patogią išvestį.
