---
title: VIM Plugged paketų valdiklis
category: vim
image: i/vim_plug.png
description: VIM Plugged gali padėti nuimti nuo galvos skausmą diegiant VIM įskiepius. Straipsnyje apie tai kaip susikonfigūruoti, naudotis ir išgauti geriausius dalykus ką siūlo VIM PLUG. Bei kokie jo privalumai lyginant su kitais paketų valdikliais.
---

Vargu ar šiais laikais kas nors programuoja „pliku“ VIM'u (arba `vi`) ir nesinaudoja jokiais įmantriais įskiepiais produktyviai darbo aplinkai sukurti.

Dar prieš 3-5 metus, kai automatinių įskiepių tvarkyklių fronte buvo nematyti, teko visus įskiepius diegti ranka: dėti konfigūracijas atskirai į docs/, colors/, ftplugin/ ir t.t. direktorijas. Vėliau atsiradus keliems įrankiams išbandžiau [VIM Pathogen](https://github.com/tpope/vim-pathogen). Nors tada, tai atrodė kaip patogesnis įrankis nei diegimas ranka, tačiau šiais laikais vargu ar būtų produktyvu tokiu įrankiu naudotis.

`VIM Pathogen` įdiegimas nėra sudėtingas, tačiau palyginti su kitais įrankiais - reikalaujantis daugiau darbo. Jo diegimo instrukcija reikalauja indentavimo parinkčių (laikino) išjungimo - kas, iš praktikos pasakysiu, vėliau gali stipriai pagadinti kitus dalykus.

Taip pat `VIM Pathogen` paketų diegimas vistiek vyksta rankiniu būdu - tenka „klonuoti“ projektus į specialią direktoriją, kad tai veiktų ir rūpintis rankiniu įskiepių atnaujinimu.

Taigi, ieškom geresnių alternatyvų!

Įrašius į Google „vim plugin manager“ rastume ne vieną įrankį. Populiariausias turbūt būtų [Vundle](https://github.com/VundleVim/Vundle.vim). Peržiūrėjus jo README aprašymą nusprendžiau dar paieškoti ir sustojau su sekančiu sąraše - [VIM Plug](https://github.com/junegunn/vim-plug). Nieko ypatingo negaliu pasakyti, bet pasirinkau tik todėl, kad jo diegimo instrukcija ir priežiūros aprašymas buvo trumpiausi.

Didelis privalumas yra jo įdiegimas. Viena komanda ir viskas:

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Paketų valdymas ypatingai paprastas, vos trys eilutės kodo ir važiuojam!

    call plug#begin('~/.vim/plugged')

    Plug 'autorius-1/pavadinimas-1'
    Plug 'autorius-2/pavadinimas-2'

    call plug#end()<F37>

Užrašas 'autorius-1/pavadinimas-1' nurodo, kad tokią repozitoriją „klonuos“ iš GitHub. Pavyzdžiui 'ReekenX/vim-rename2' reikštų repozitorijos [vim-rename2](https://github.com/ReekenX/vim-rename2) klonavimą. Žinoma, prievartos GitHub naudotis nėra - galite rašyti ir pilnus/kitus adresus.

Taigi, susirašom įskiepius kuriuos naudosime. Puikų sąrašą galite rasti [čia](https://github.com/ReekenX/dotfiles/blob/master/.vimrc). Paleidžiame VIM'ą ir jame komandą `:PlugInstall`. Ir viskas - visi įskiepiai per kelias sekundes bus sudiegti. Pažiūrėkite [oficialiame aprašyme diegimo paveiksliuką](https://github.com/junegunn/vim-plug) - atrodo tikrai įspūdingai!

![VIM paketų diegimas su VIM Plug](/i/vim_plug_diegimas.gif)

Didžiausi `VIM Plug` privalumai:

* Labai paprastas įdiegimas (vos kelios komandos).
* Lygiagretus komandų vykdymas leidžia greitai viską įdiegti.
* Įskiepius galima pakrauti esant poreikiui (žiūrėkit oficialią dokumentaciją).
* Komandos atnaujinimams, valymui, statusams ir pan.
