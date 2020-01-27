---
title: Decentralizuota versijavimo sistema. Kas tai?
category: git
image: i/git/decentralizuota-versijavimo-sistema.png
description: Ar žinai kas yra decentralizuota versijavimo sistema ir ką tai reiškia? Skaityk.
---

Trumpai tariant, **decentralizuota versijavimo sistema** (netiesioginis vertimas iš populiaraus angliško teksto „distributed version control“) - yra tokia versijavimo sistema, kuri leidžia daugeliui su ja dirbančių žmonių sistemų dirbti taip, kad jiems visiems nereikėtų vieno išeities taško.

Pavyzdžiui **centralizuota versijavimo sistema SVN** „priverčia“ jos naudotojus dalintis vienu išeities tašku - kodą ar kitokius resursus kelti į vieną, sutartą, serverį. Iš to seka tokios problemos, kad tam, kad dalintis išeities kodu, reikia turėti skaitymo/rašymo teises į tą vieną serverį. Dalijimasis kodu tuomet tampa apsunkintas.

GIT šiuo atveju neprašo savo išeities kodą kam nors siųsti.

Čia puikus pavyzdys būtų <a href="https://github.com">github.com</a> projektas. Tai vienas populiariausių projektų laikantis milijonus atviro kodo išeities kodų, kuriuos bet kada galima parsisiųsti. Visos repozitorijos (išeities kodo saugyklos) yra viešai prieinamos (t.y. bet kuris žmogus turi repozitorijos skaitymo teises).

Tačiau rašymo teises į repozitoriją turi tik jos savininkas ar įgaliotas asmuo. Dėl šios priežasties, norint paskelbti oficialioje repozitorijoje savo pakeitimus teks gauti leidimą arba siųsti autoriui pakeitimus ir prašyti juos įkelti.

Kas šioje situacija vaizduoja „decentralizavimą“? Ogi tai, kad iš vienos vietos gautą kodą Jūs neprivalote su niekuo dalintis. Galite kodą modifikuoti (jeigu leidžia licencija), platinti (jeigu leidžia licencija) tarp savo draugų ar įmonės kolegų.

## Realus decentralizuotos sistemos pavyzdys

Asmeniškai aš kuo daugiau projektų stengiuosi viešinti atviram kodui. Kaip pavyzdys, GitHub projektas - geriausia vieta.

Štai viena iš mano repozitorijų <a href="https://github.com/reekenx/dotfiles">ReekenX/dotfiles</a> laiko mano namų katalogo failus. Tai yra konfigūraciniai failai, kuriuos aš visada „įmetu“ į savo asmeninius kompiuterius ar serverius. Tą darau tam, kad visokie komandinės eilutės įrankiai veiktų su mano numatytomis konfigūracijomis.

Pavyzdžiui tekstų redaktorius <a href="http://www.vim.org/">VIM</a> yra paruoštas startuoti su mano konfigūracijomis, todėl visuose kompiuteriuose šis redaktorius veikia ir atrodo taip kaip ir kituose.

Šią repozitoriją gali parsisiųsti visi ir modifikuotis pagal poreikius. Šią repozitoriją gali naudoti jūsų draugai ir pakeitimus taip pat galite keistis nesunkiai vien todėl, kad GitHub palaiko decentralizuotos GIT versijavimo sistemos įrankį.

## Decentralizuotos sistemos privalumai

Dažniausios operacijos (commit'ai, istorijos peržiūra ir pan.) yra labai greiti, nes nereikia komunikuoti su centriniu serveriu.

Komunikacija yra reikalinga nebent kai atliekamos informacijos dalijimosi procedūros (pavyzdžiui modifikuotas išeities kodas).

Galima turėti ne vieną saugyklą kurioje galite saugoti repozitoriją.

Viešoms saugykloms galite turėti privačią repozitorijos saugyklą. Tarkime jeigu GitHub puslapis būtų nepasiekiamas (būna ir tokių įvykių).

Vienu metu gali dirbti didelis kiekis žmonių netrikdant komunikacijos kanalų (primenu, kad dažniausioms operacijoms komunikacijos nereikia).

## Decentralizuotos sistemos trūkumai

Dėl to, kad sistema yra decentralizuota, reiškia, kad po kurio laiko darbo su repozitorija teks apsikeisti informacija (tarkime su savo kolegomis). Dėl šios priežasties kaip dirbti su decentralizuota sistema yra sukurta ne viena sisteminė darbo eiga („git-flow“ pavyzdžiui). Tai dar vienas dalykas ką reikėtų išmokti studijuojantiems programavimą.

Sunkiai įgyvendinama priėjimų kontrolė. Jeigu kodas paimtas, tarkime iš GitHub, tai nebūtinai reiškia, kad tolimesni patobulinimai ten ir liks. Dažnai būna, kad patobulinus programinę įrangą, jos patobulinimai nėra grąžinami atgal.
