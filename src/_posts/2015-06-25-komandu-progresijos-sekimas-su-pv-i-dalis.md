---
title: Komandų progresijos sekimas su pv komanda, I dalis
category: pv
image: i/pv/komandu-progresijos-sekimas-su-pv-i-dalis.png
description: Straipsnis apie pv komandą. Kaip ja naudotis ir kokie jos privalumai, I dalis.
---

Tikriausiai ne vienam yra ne kartą tekę susidurti, kai vykdoma ilgos trukmės komanda ir sunku nuspėti apie jos vykdymo trukmę. Laimei, atviras kodas ir čia nepagailėjo įrankių. Vienas iš jų - `pv` komanda.Jos dėka savo vykdomose komandose galite stebėti tokią informaciją:* Kiek laiko praėjo.
* Kiek procentų komandos jau įvykdyta.
* Komandos įvesties/išvesties greičius.
* Viso duomenų perduotų kiekis.
* Kiek laiko liko iki apytikslės pabaigos.Tiesa, ne visais atvejais visa informacija rodoma, bet ją galima atskirai išjungti / įjungti.Pradžiai įsidiegiame (Debian sistemose):```
    sudo apt-get install pv
```Įdiegimo komanda Centos ir Fedora sistemose:```
    yum install pv
```Trumpai apie komandų užrašymo formatą. Jis dažniausiai toks:```
    pv [argumentai] duomenu_failas | kita-komanda
```Pavyzdžiui norime į serverį įkelti nemažą tekstinį failą. Šią užduotį naudosime kaip pavyzdį, nes tokius reikalus tikriausiai norėsime tvarkyti su `rsync` arba `scp`:```
    pv /mano/didelis/failas | ssh example.org 'cat - > /dev/null'
```Ir matysime kažką panašaus:```
    335mB 0:00:11 [ 329kB/s] [================================>] 100%
```Bet toks komandos panaudojimas yra gana paprastas. Prisiminkime komandą `tar` kuri mums neduoda jokių parinkčių numatomam vykdymo laikui stebėti.Pamėginkime išarchyvuoti didelį failą:```
    pv archyvas.tar.gz | tar xzf - -C /tmp
```Gausime išvestį:```
    12.5MB 0:00:00 [13.8MB/s] [===============================>] 100%
```Gali susidaryti įspūdis, kad `pv` komanda veiks tik tada, kai jai galime paduoti failinį duomenų srautą. Tačiau tai netiesa. Kitame straipsnyje parodysiu įdomesnių panaudojimo atvejų, ne tik su darbu su failais.
