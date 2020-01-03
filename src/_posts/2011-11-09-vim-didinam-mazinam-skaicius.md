---
title: VIM - didinam ir mažinam skaičius
category: vim
image: i/vim_macos.png
description: Su VIM redaktoriumi galite ne tik programuoti ir atlikti aritmetikos veiksmus, tačiau ir skaičių manipuliacijas be jokių papildomų įskiepių ar komandų kombinacijų. Paprasta, patogu ir labai naudinga kai dirbama su skaičiais ar indeksais.
---

Ne kartą teko matyti kaip programuotojai su VIM redaktoriumi keisdami kode masyvus ar kitokius duomenis ranka didindavo/mažindavo skaičius. Nors, tikriausiai, praktika reta, tačiau tą daryti tikrai tenka.Žinoma, nieko blogo viską daryti ranka, bet tikriausiai kaip kiekvienas save gerbiantis programuotojas - pirmiausiai pamąstysite kaip tą padaryti kuo mažiau paspaudimų. Tad tiems, kas naudojasi VIM redaktoriumi programuojant, tikrai pravers keli patarimai.Pirmiausiai pradėkime nuo pavyzdinės situacijos. Tarkime turime tokį masyvą:    $masyvas[1] = $vardas;
    $masyvas[2] = $pavarde;
    $masyvas[3] = $salis;
    $masyvas[4] = $miestas;
    $masyvas[5] = $adresas;Ir norime į pirmąjį elementą įkišti pilną vardą ir pavardę, o vėliau, kad viskas būtų kaip buvę (`$masyvas[1] = $vardas . TARPAS . $pavarde`).![Mano VIM redaktorius panaudotas rašant straipsnį](/i/vim_didinam_mazinam_skaicius.png)Mums padės VIM klaviatūros spartieji klavišai. Norėdami padidinti skaičiuką (nesvarbu iš kelių simbolių jis yra) spausime CTRL+a arba CTRL+x skaičiaus reikšmės sumažinimui. Trumpai tariant:    užėjus ant skaičiaus 321 ir paspaudus CTRL+a gausime skaičių 322
    užėjus ant skaičiaus 321 ir paspaudus CTRL+x gausime skaičių 320Viską atliekame `normal` režime.Taigi, norint padidinti/sumažinti visus ar dalį viršuje rašyto masyvo elementų raktus, pirmiausiai atsistosime ant skaičiaus 1 ir pasinaudosime makro komanda:    qq       # pradedame įrašinėti makro komandą
    CTRL+a   # padidiname skaičių
    j        # žengiame žemiau masyvo
    q        # išjungiame makro komandąĮsirašius makro komandą, galime pavykdyti ją norimą kiekį kartų. Kadangi masyve yra penkios eilutės, o vieną jau pakeitėme, užteks parašyti:    4@q      # Vykdys makro komandą 4 kartusIr rezultatas mūsų bus toks:    $masyvas[2] = $vardas;
    $masyvas[3] = $pavarde;
    $masyvas[4] = $salis;
    $masyvas[5] = $miestas;
    $masyvas[6] = $adresas;
    $masyvas[1] = $vardas . TARPAS . $pavarde;  # žiūrėti aukščiauTikiuosi pravers :)
