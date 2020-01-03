---
title: Yank komanda terminalo išvesčiai kopijuoti
category: atviras-kodas
image: i/copy_paste.jpg
description: Ar kada norėjote komandos išvestį persikopijuoti tiesiog be pelės? Yank komanda leidžia tai gana nesunkiai pasidaryti.
---

Daug dirbant su komandine eilute tikrai ne vieną kartą tenka kažką persikopijuoti. Ypač dažnai iš kažkokios komandinės eilutės rezultato gali prireikti persikopijuoti kažką.

Taigi tokiems kopijavimams tikrai pravers komanda `yank`. Paleiskite komandą kurios išvestį norėsite persikopijuoti (jos dalį) ir tuomet perleiskite per `yank` komandą. Ją parsisiųsti galite iš [Yank Github puslapio](https://github.com/mptre/yank).

Diegimo instrukcijas rasite repozitorijoje. O greitam išbandymui tiesiog „klonuokite“ repozitoriją, ir paleiskite komandą `make`.

Pavyzdžiui persikopijuoti kažkurio proceso `PID` galite su:

```
    pgrep -f chromium | yank
```

Ir galėsite klaviatūros rodyklių pagalba pasirinkti ką persikopijuoti. Vėliau perkopijuotą informaciją galėsite įsiterpti su shift+insert klavišais klaviatūroje.

Dar vienas smagus panaudojimas yra IP adreso persikopijavimas iš `ifconfig`:

```
    ifconfig | yank -d " :"
```

Atkreipkite dėmesį į -d („delimiter“ angliškai) argumento panaudojimą. Jis leidžia skaldyti išvestį į tam tikrus skirtukus. Labai panašiai veikia `awk -F` komanda. Mums reikia dviejų skirtukų šioje komandoje - dvitaškio kuris būna prieš ip tekstą ir tarpo kuris bus po jo. Būtent šios formuluotės sąlyga ir yra " :".

Kaip viskas veikia galite pasižiūrėti trumpoje animacijoje:

![Yank komandos panaudojimo variantai](/i/yank.gif)

O daugiau informacijos apie iškarpinės konfigūracijas ir komandos panaudojimo būdus rasite [GitHub puslapyje](https://github.com/mptre/yank).
