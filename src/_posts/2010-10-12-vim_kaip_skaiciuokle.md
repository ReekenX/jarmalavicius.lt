---
title: VIM kaip skaičiuoklė
permalink: /vim/vim-kaip-skaiciuokle
category: vim
image: i/vim_calc.png
description: VIM redaktorius gali tarnauti kaip skaičiuoklė - nereikia persijungti į atskirą terminalą, kad atliktumėte aritmetikos veiksmus. Vos keliomis komandomis ir keliais paspaudimais savo skaičiavimo operacijas galite perkelti į BC komandą.
---

Ne kartą yra tekę su VIM’u atidarinėti įvairius ne tik programavimui skirtus failus, bet ir CSV, XML ir kitus dokumentus, kuriuose būdavo tekstai su įvairiais skaičiais, sumomis, kiekiais, PVM’ais. Taip pat ir iš interneto atsiųstas HTML ataskaitas, kuriose kartais tam tikrus duomenis tekdavo pačiam paskaičiuoti.

Dažnai tokius dokumentus sunku įkelti į Excel/Spreadsheet programas, ir ten dar kartą perskaičiuoti, palyginti skaičius. Tad vieną dieną pasidomėjau ar pats VIM’as neturi tokių skaičiavimų galimybių tiesiog rašyti lygtis ir gauti atsakymus.

Ir pasirodo turi!

Labai paprastus ir nesudėtingus skaičiavimus galima padaryti su VIM rašymo režime (insert mode) paspaudus Control+R ir = simbolį. Tuomet galima įvesti nesudėtingą lygtį ir VIM’as parodys atsakymą (pvz 20+180\*2 parašys į kursioriaus poziciją atsakymą 380). Tačiau tokie skaičiavimai per daug paprasti ir kartais sudėtingesnėms operacijoms to neužtenka.

Tačiau sudėtingesniems skaičiavimams panaudosime VIM'ą ir bc komandą. Prieš pradedant, pasitikrinkite, ar tikrai pas jus instaliuota bc programa (bc – An arbitrary precision calculator language). Su ja galima paskaičiuoti labai tiksliai po kablelio, jeigu reikia, žinoma. Ubuntu operacinėje instaliuoti galite pasinaudoję “Ubuntu Software Center” arba komandinėje eilutėje parašę:

    apt-get install bc

Pirmiausia pradėkime nuo paprasto uždavinuko kaip ir prieš tai turėjome (tik kitais skaičiais):

    (2 * 250) + 100

Pažymėkime su 'v’ komanda visą operaciją ir paspauskite '!bc’. Tuomet pažymėtas tekstas bus perduotas į bc komandą kuri grąžins mums atsakymą vietoje pažymėto teksto:

    600

Internete taip pat esu radęs labai įdomią komandą, kuri gali suskaičiuoti visą eilutę ir parašyti atsakymą nieko nepažymint ir po lygybės ženklo (šią komandą įveskite VIM redaktoriuje):

    map gbc yypkA = <Esc>jOscale=2<Esc>:.,+1!bc<CR>kJ

Tarkime turime:

    10 + 20 + 30 + 40 + 50

Kursorių palikite bet kur eilutėje kurioje norite atlikti skaičiavimus ir paspauskite ESC klavišą, dvitaškį ir gbc. Jums iš kart bus duotas rezultatas:

    10 + 20 + 30 + 40 + 50 = 150

Mano duoti pavyzdžiai yra patys paprasčiausi. Šios komandos gali suskaičiuoti daug rimtesnius uždavinius:

    2 * sqrt (2) = 2.82
    3 * (2 - 1) + 4.0 ^ 6 = 4099.00
    4 / 3 = 1.33
    3 + 4 - 2 * (1 / (3 + 2)) = 6.60

Kadangi net pačiame programavime tenka milijonus kartų atsidaryti skaičiuoklę, tai manau man ir tiems kurie programuoja su VIM’u naudinga žinoti, kaip išsisukti be jos.
