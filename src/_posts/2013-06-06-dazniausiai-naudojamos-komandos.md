---
title: Dažniausiai naudojamos komandos
category: atviras-kodas
image: i/placeholder.jpg
description: Dažniausiai naudojamos komandos, bash populiariausios komandos, top bash komandos, top naudojamos komandos.
---

Jau kelintą kartą manęs klausia kaip gauti dažniausiai naudojamų komandinėje eilutėje komandų sąrašą. Nors tokių skriptukų galima tikrai rasti daugybę internete ir nieko čia naujo, tačiau surasti tų komandų paaiškinimus būna sunku. Todėl šį straipsnį skiriu tiems, kas ne tik nori pažiūrėti populiariausių komandų sąrašą, bet ir suprasti kaip tai daroma.

Kaip minėjau, skriptų galite rasti internete daugybę. Laimei, kad dauguma jų bus panašios į šią, todėl supratus mano pavyzdinę eilutę - tikrai suprasite ir kitas. Taigi turime tokią komandinę eilutę kuri duoda rezultatą visų komandų pagal panaudojimų kiekį sąrašą. Norint atrinkti tik 10 populiariausių, užtektų prirašyti gale: `| head -n 10`.

Gauname išvestį (pavyzdys):

    26 ls -alh
    20 cd Parsiuntimai
    17 ssh localhost 'mysqldump'

Kaip jau akivaizdu, pirmiausiai gauname visą istoriją su komandomis komandos history dėka. Ši istorija yra pagal datą (paskutinis įrašas išvestas šios komandos rodo paskutinę vykdytą komandą). Tačiau visos šios komandos yra prefiksuotos numeriu. Šis numeris reiškia komandos panaudojimo numerį. 3 ls reikštų, kad komanda ls buvo trečia istorijoje (trečia komanda kurią rašėte). Tačiau mums numerių nereikia. Kadangi history nepateikia jokių pagalbinių argumentų, kurie leistų matyti tik komandų sąrašą, tai tokį komandų filtravimą padarysime patys su awk &#123;print \$2&#125; komanda.

Taigi jau turėsime tokį sąrašą (pavyzdys):

    cd Parsiuntimai
    ls -alh
    ls -alh
    [..]

Komandos mūsų istorijoje gali būti sudėtinės. T.y. galime turėti komandą kuri susideda iš kitokių komandų, pavyzdžiui:

Kaip matote, komanda įvykdo mysqldump komandą nutolusiame serveryje ir rezultatą perduoda į vietinę komandą mysql. Taigi, mūsų trečioji komanda

    awk 'BEGIN &#123;FS="|"&#125;{print \$1}'

leidžia atfiltruoti tokias sudėtines komandas ir palikti tik pirmąsias (jų
„pradžias“). Jeigu žiūrėti tik į pavyzdį, tai būtų prisijungimas prie nutolusio
serverio ir mysqldump įvykdymas. Jeigu savo TOP'e norite matyti pilną komandą (su visomis sudėtinėmis logikomis), tai tiesiog pašalinkite šio filtravimo komandos dalį.

Vėliau atfiltruotą komandų sąrašą išrikiuojame pagal pavadinimą sort pagalba.
Norėdami sužinoti kiek komanda kartų buvo minėta išrikiuotame pagal pavadinimą
sąraše, paleidžiame uniq -c komandą. Ji duos komandos pakartojimų skaičių ir komandos pavadinimą. Rezultatas kurį turėsime (pavyzdys):

    17 ssh localhost 'mysqldump'
    26 ls -alh
    20 cd Parsisiuntimai

Kadangi toks sąrašas bus išrikiuotas pagal pavadinimą, bet ne pagal skaičių kiek kartų jis pasikartojo, tai jis mums jokios naudos neduos. Taigi, sąrašą galime dabar išrikiuoti komandos sort -rn pagalba. Argumentas -n nurodo, kad rikiuojama bus ne abėcėlės, bet skaičių tvarka. Kadangi mūsų visa išvestis prefiksuota skaičiais, tai komanda pagal tą skaičių išrikiuos visas eilutes. Rikiavimas bus atliktas didėjimo tvarka (viršuje bus rečiausiai pasikartojančios operacijos, o apačioje dažniausiai), o pridėjus argumentą -r šį sąrašą apversime aukštyn kojomis.

![Mano dažniausiai naudojamos komandos](/i/dazniausiai_naudojamos_komandos.png)

Galbūt žinote paprastesnį ir trumpesnį komandos užrašą? Jeigu taip, tai pasidalinkite su kitais!
