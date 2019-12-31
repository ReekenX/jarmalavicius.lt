---
title: Spalvota cat komandos išvestis
permalink: /atviras-kodas/spalvota-cat-komandos-isvestis/
category: atviras-kodas
image: i/kodas.png
description: Kaip patobulinti savo Linux darbinę aplinką cat komandai. Ar žinojote, kad su truputį konfigūracijos galite turėti spalvotą išvestį?
---

Visi yra susipažinę su `cat` komanda ir nerasi turbūt nei vieno prie Linux dirbančio žmogaus kuris tos komandos nebūtų panaudojęs.

Vienas iš dalykų kuris man labai patinka ir labai seniai naudoju - tai `cat` komanda su teksto spalvinimu kurį duoda `Pygments` biblioteka.

## Pirmiausiai įdiegiame Pygments

Tai viena populiariausių Python bibliotektų, tai ją įdiegsite taip:

```bash
sudo pip install Pygments
```

## Komandos aliasas

Aliasą teisingiausiai būtų įsirašyti į `.bash_aliases` arba `.zsh_aliases`, tik prieš tai įsitikinkite, kad šie failai yra source'inami.

```bash
alias cat="pygmentize -g"
```

Jeigu esate patyręs Linux naudotojas ir su `BASH` dirbate tikrai daug, tuomet `cat` komandą reikėtų palikti ramybėje ir susikurti kažkokį kitą aliasą, pavyzdžiui `ccat` ar `hcat`, nes `cat` perrašymas turi trūkumų. Pavyzdžiui:

```bash
cat ~/.vimrc | head -n 2
" No compatible mode makes VIM more friendly than old VI
set nocompatible

*** Error while highlighting:
IOError: [Errno 32] Broken pipe
   (file "/usr/lib/python2.7/codecs.py", line 370, in write)
*** If this is a bug you want to report, please rerun with -v.
```

Štai kaip tai atrodo su kodo gabalu:

<p class="text-center">
    <img src="/i/cat_kodas.png" class="img-fluid" style="max-width: 100% !important" />
</p>

<p class="text-muted small text-center">Spalvotas cat komandos turinys</p>

Nuotraukoje gal ne pats geriausias pavyzdys, nes su visokiais nestandartiniais formatais kaip JSX ar pan. Pygments biblioteką galima apkvailinti. Bet daugeliui įprastinių formatų - veikia tikrai neblogai.

Ne taip seniai esu rašęs, kad tą pačią `Pygments` biblioteką dar galima panaudoti ir [API išvestims spalvinti terminale](/atviras-kodas/spalvota-bash-isvestis-api-testavimui).
