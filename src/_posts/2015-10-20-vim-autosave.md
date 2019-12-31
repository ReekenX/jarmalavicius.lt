---
title: VIM autosave
permalink: /vim/vim-autosave
category: vim
image: i/klaviatura.jpg
description: Automatinis išsaugojimas berašant su VIM - puikus produktyvumo hackas programuojantiems su VIM. Automatinį išsaugojimą galite turėti ir be įskiepių!
---

`VIM` mylėtojų Lietuvoje tikrai daug. Aš pats perėjęs ne vieną redaktorių (tikriausiai kaip ir visi kiti programuotojai) ir tie kurie prijaučia `VIM` (arba `Emacs`) tikrai supras skirtumą tarp pastarųjų ir tokių kaip `Eclipse` ar `Notepad++`.

Kaip ten bebūtų, šis straipsnis ne apie bandymą įrodyti kodėl vienas ar kitas geriau - ganėtinai sunku apie tai ginčytis. Sentimentai irgi stiprus dalykas. Straipsnis apie automatinį failų išsaugojimą su VIM redaktoriumi.

![](/i/vim_logo.png)

Taip, aš jau seniai `:wq` (arba `ZZ` arba tiesiog `:w`) komandos nenaudoju, nesvietiškas laiko švaistymas. Tokios komandos naudingos vienkartiniams dalykams, bet aktyviam darbui - ne. Kad nespaudėlioti šių klavišų teks atlikti vieną iš dviejų dalykų - pasidaryti kokį nors maping'ą arba naudoti įrankius kurie kas tam tikrą laiką išsaugotų pakeitimus faile.

Vienas iš tokių įskiepių VIM'ui yra [vim-auto-save](https://github.com/vim-scripts/vim-auto-save). Pats jį naudojau pusmetį, tačiau „atsimušiau“ į kelis bjaurius dalykus:

* Jeigu šį įskiepį naudosite su automatiniais linter'iais - turėsite labai stipriai stabadantį redaktorių.
* Jis visada saugo duomenis kas tam tikrą laiko tarpą. Tai reiškia, kad jeigu aktyviai „refaktorinat“, tai išsaugojimas įvyks iškart kai tik paspausite „ESC“ klavišą. Taigi, sintaksės klaidos pasikartos tikrai labai dažnai Jūsų kode.
* Dėl pastarojo dalyko naudoti tokį dalyką kaip „grunt watch“ tampa neįmanoma, nes `grunt` pamatęs pakeitimus mėgins atlikti savo darbus ir „nusikeiks“ pamatęs, jog kažkokie failai turi sintaksės klaidų.

Taigi, ėmiau ir pasirašiau aš patobulinimą šiam įskiepiui. Ne ne, iškart pasakysiu, kad straipsnis ne apie savo įrankio reklamavimą. Taigi, skaitom toliau.

Sugaišus daug laiko ir turint truputėlį pahakintą kodą pasidomėjau kas vyksta kai VIM'as saugoja failus ir priėjau prie išvados, kad visas šis tobulas funkcionalumas gaunamas vos keliom eilutėm kodo `.vimrc` faile:

    set updatetime=1000
    autocmd CursorHold,CursorHoldI * silent update

Paaiškinimas labai paprastas: jeigu vieną sekundę ekrane nieko nevyksta, tuomet `VIM` gauna `update` komandą ir jos metu atnaujinamas failas. Tiesioginė paskirtis `updatetime` yra swap failo sukūrimui, jeigu redaktorius nieko nedaro ilgiau nei nurodytą laiko tarpą milisekundėmis.

Tai išsprendžia ir bėdas apie kurias esu rašęs anksčiau. Jeigu aktyviai dirbate prie kodo, tai išsaugojimas nebus vykdomas tol, kol neduosite klaviatūrai laiko pailsėti nuo paspaudimų.

Vienas iš didelių privalumų yra tai, kad, priešingai nei [vim-auto-save](https://github.com/vim-scripts/vim-auto-save), galite nustatyti savo laiką kada išsaugoti pakeitimus. Jeigu rašote greičiau, tikriausiai norėsite turėti `updatetime` reikšmę 500 ar net mažiau, jeigu rašote lėčiau - 2000 ar daugiau.