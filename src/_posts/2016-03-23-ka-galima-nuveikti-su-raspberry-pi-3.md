---
title: Ką galima nuveikti su Raspberry Pi 3
category: raspberry-pi
image: i/raspberry-pi/ka-galima-nuveikti-su-raspberry-pi-3.png
description: Straipsnis apie Raspberry Pi (versijos 3) panaudojimą ir praktinį pritaikymą.
---

2016 metų vasario 29 dieną Raspberry Pi kūrėjai nustebino mus jau trečia Raspberry Pi versija. Kaip visuomet bazinė struktūra išlieka ta pati - kreditinės kortelės dydžio ir labai lengvas kompiuteris, turintis vieną GB RAM atminties, bei atrodantis labai panašiai į savo ankstesnes versijas.

![Raspberry Pi 1 (kairėje) ir Raspberry Pi 3 (dešinėje) (asmeninė nuotr.)](/i/raspberry_pi_1_ir_3.png)

Tai mano jau ketvirtas Raspberry Pi kurį turiu. Kadangi jis tik neseniai pasirodė, Lietuvoje jį rasti yra keblu, tačiau tikrai galima: pavyzdžiui [RS elektroninėje parduotuvėje](http://lt.rsdelivers.com/product/raspberry-pi/raspberry-pi-3/raspberry-pi-model-3-b-sbc/8968660.aspx). Perkant Raspberry dar rekomenduočiau būtinai jam nupirkti kažkokią [dėžutę](http://lt.rsdelivers.com/product/raspberry-pi/tzt-241-aaa-01/official-pi-3-red-white-case/9098132.aspx). Nors ši Raspberry Pi versija neturi tokių pavojingai išsikišusių kondensatorių kaip turėjo, tarkime, pirma versija, bet vistiek, kuom nors aplieti, numesti ar užmesti ant šio kompiuterio, tikriausiai, nenorėsite.

![Raspberry Pi 3 dėžute (asmeninė nuotr.)](/i/raspberri_pi_3_dezute.png)

Ir aišku, labai geram-greitam veikimui nepagailėkite pinigų nusipirkti itin greitą micro SD kortelę. Kuo greitesnį įrašymo ir skaitymo greitį jį turės - tuo greičiau viskas veiks Jūsų Raspberry. Nors Raspberry Pi ir greitas ir turi tikrai nemažai resursų, bet darant veiksmus operacinėje sistemoje bus labai daug kreipinių daroma paimti informacijai iš SD kortelės. Labai daug. Taigi, lėta kortelė gali tiesiog sugadinti Jūsų požiūrį į šį kompiuterį.

![Kairėje microSD kortelė, dešinėje SD (asmeninė nuotr.)](/i/sd_korteles.png)

Ši nauja versija siūlo jos turėtojams galingesnį CPU - 1200 Mghz, lyginant su ankstesne versija kuri turėjo 900 Mghz, ar su dar ankstesne kuri turėjo 700.

Didesnės naujovės šioje versijoje - net 4 USB prievadai. Tai itin svarbu, jeigu savo Rasbperry norėsite paversti žaidimų stotimi. Anksčiau, pasijungti vairalazdę ar kelis valdymo pultelius buvo itin sudėtinga be USB šakotuvų.

Ši naujoji versija palaiko net ir Windows operacinę. Tiesa, kaip ir anksčiau, Raspberry operacinių sistemų distribucijos yra atskiros dėl savo arm procesoriaus architektūros, todėl tiesiog diegti Ubuntu ar kokią nors kitą operacinę sistemą nepavyks. Būtina ieškoti arm architektūros operacinių sistemų. Jų, net ne viena, yra [Raspberry Pi parsisiuntimų svetainėje](https://www.raspberrypi.org/downloads/).

Naujovė - jeigu norite naujinti savo Raspberry į Raspberry Pi 3 - reikės keisti savo SD / MMC / SDIO į MicroSDHC kortelę. Kadangi jos nebrangiai kainuoja, didelės problemos greičiausiai nebus.

Ypatingai gera žinia - Raspberry Pi 3 turi integruotą Wifi. Viena iš problemų jau minėjau - kad anksčiau Raspberry Pi turėjo tik 2 USB. Taigi, įkišate į vieną iš jų wifi adapterį, ir turite tik vieną laisvą USB.

Bluetooth ryšys yra taip pat svarbi gera naujovė. Ypatingai jeigu naudositės failų perdavimais, kokiomis belaidėmis bluetooth ausinėmis ar kokiais nors valdymo kontroleriais (pavyzdžiui belaidžiais žaidimų pulteliais).

Kur galima panaudoti Raspberry Pi 3
-----------------------------------

Jeigu ieškosite informacijos internete, tai pirmoje vietoje sutiksite du dalykus: Retro žaidimų kompiuterio gaminimą arba Media centro kompiuterį. Ir vieną ir kitą turiu savo namuose.

Retropie - žaidimų kompiuteriui
-------------------------------

Jeigu prisimenate tokius senus žaidimus ant Nintendo (arba senesnių konsolių) kaip Mario, Battle City ar pan., tai tikriausiai kils noras realiai pabandyti. Laimei, čia jokių techninių žinių nereikės norint tai įgyvendinti. Pagal savo Raspberry Pi versiją užteks [parsisiųsti SD kortelės atvaizdą](http://blog.petrockblock.com/retropie/retropie-downloads/), jį [įsirašyti į SD kortelę](https://www.raspberrypi.org/documentation/installation/installing-images/) ir pasileisti.

Žinoma, Jums reikės kažkokios išvesties, tarkime dviejų žaidimų pultelių arba bent jau klaviatūros. O pačių žaidimų, nemokamai ir legaliai galima susirasti tiesiog internete (vienas pavyzdžių yra [pdroms.de](http://pdroms.de/) jeigu neklystu).

Verta paminėti, kad anksčiau norint turėti Retropie ant savo Raspberry Pi B modelio (pirmos versijos) reikėdavo laukti net 16 valandų kol viskas įsidiegs. Dabar, dėl atvaizdų pagalbos įsidiegti viską galima per kelias minutes per daug nelaužant galvos techniniais dalykais.

Kodi - media centras
--------------------

Labai populiarus Raspberry Pi panaudojimas yra media centro pakūrimas. Esu gavęs komentarų, kad kaip toks kompiuteris gali pavežti didelės raiškos filmus. Tikrai gali. Tiesa, senesnės Raspberry Pi versijos nors ir rodydavo filmus geros raiškos, be jokių vaizdo ir garso trikdžių, bet kitais dalykais, tokiais kaip naudotis pele, arba naršyti po nustatymų meniu žiūrint filmus - naudotis be strigimo vargu ar pavyks. Tai itin erzina, kai reikia su pele išjungti filmą, bet pelė stipriai „pristabdo“.

Dėl Raspberry Pi 3 patobulinimų, džiugu pranešti, kad šios bėdos pagaliau jau nėra. Tikriausiai dėl procesoriaus patobulinimo, nes nudžiugau pamatęs, kad didelės raiškos filmo leidimo metu ką nors papildomai darant niekas nestringa.

Vėlgi, media centrą įdiegsite tikrai lengvai. Parsisiųskite [kortelės atvaizdą](https://kodi.tv/download/), [įsirašykite į SD kortelę](https://www.raspberrypi.org/documentation/installation/installing-images/) ir pasileiskite. Taip, tikriausiai į galvą šaus mintis - bet man dar reikia ir filmų! Laimei, media centras turi labai daug papildinių. Kadangi Raspberry Pi 3 turi Wifi palaikymą, tai jis per papildinius galės Jums rodyti įvairius filmus, juokelių video, žinias ar pan. Įskiepių tikrai labai daug, tai net jeigu ir Youtube yra Jums ne prie širdies, vistiek rasite daug kitų dalykų į kuriuos galima „pavėpsoti“.

![Kodi diegimo instrukciją rasite http://www.instructables.com/id/Raspberry-Pi-2-Media-Center-Kodi-on-XBian/](/i/kodi.jpg)

Panašiai kaip ir Chromecast, savo media centrą galėsite valdyti ir per išmanųjį telefoną.

Kiti panaudojimo būdai
----------------------

Tikriausiai ne vieną kartą dalyvausite (ar jau dalyvavote) kokioje nors diskusijoje kurioje išgirdote „man reikia kompiuterio naršyti internete“. Jau ir anksčiau siūliau Raspberry Pi tokiem žmonėm, tik tiek, kad anksčiau dar tekdavo pridurti, kad reikės nusipirkti Wifi adapterį arba LAN kabelį nutiesti iki Raspberry Pi. Patikėkite, tai greitai atbaido tokius žmones. Na, dabar dėl to rūpintis nereikia. Kas dar smagu, kad daugelis šiuolaikinių monitorių ar televizorių turi USB prievadą kurį galima panaudoti Raspberry Pi „maitinimui“.

Tiesa, ankstesnės versijos neturėjo Windows palaikymo. O čia naujovė su šia versija, taigi nereikės gąsdinti žmonių su Linux'ais.

Labai populiarus panaudojimas Raspberry yra elektronikoje. Tie kas yra susidūrę, tikriausiai pasakys, kad tam labiau skirtas yra Arduino. Deja, turėdamas abu, galiu pasakyti, kad testuoti savo padarytas elektronines sistemas su Raspberry yra N kartų lengviau. Vien dėl to, kad be jokio programavimo galima valdyti GPIO kontaktus (kas tai yra rasite [čia](https://www.raspberrypi.org/documentation/usage/gpio/). O Arduino turi programuoti, kompiliuoti, įrašinėti į atmintį...

NAS serveris dar vienas itin populiarus panaudojimas. NAS (Network Attached Storage - angl.) yra toks Raspberry Pi pajungimo būdas, kuriuo metu failus prijungtus prie jo pasieksite per internetą. Greičiausiai pagalvosite, kad kam tai daryti, kai dabar visokie Google ar Dropbox siūlo įspūdingai dideles nemokamas talpyklas. Deja, bet į tas talpyklas siųsti Torrent'ų negalėsite. O su Raspberry Pi pasidaryti daug didesnės talpyklos sistemą panašią į Dropbox su [Owncloud](https://owncloud.org/) galėsite tikrai nesunkiai.

![Owncloud](https://trello-attachments.s3.amazonaws.com/56e00142190ccbd2f2ad385d/828x519/720ff33cff3796a1796ba4861d4330c1/owncloud.png)

Kiek sudetingesni dalykai reikalaus daugiau laiko. Pavyzdžiui buvau pasidaręs namų apsaugos sistemą su Raspberry Pi, kuri filmuoja namus ir praneša, jeigu yra judesiai. Taip pat ir vaizdo kamerų peržiūra su telefonu. Tą galima susikonfigūruoti įrašius į operacinę sistemą Motion programinę įrangą (atviro kodo).

Skraidantys Dronai, namų automatizavimo įranga, klusteriai (clusters - angl.) pareikalaus daugiau naršymo internete, konfigūravimo ir priežiūros.

Apibendrinimas
--------------

Ši Raspberry Pi 3 versija tikrai gerokai patobulėjo lyginant su senesne versija. Kai toks jos pritaikymo spektras platus - nuo paprastų personalinių kompiuterių iki elektroninių sistemų, tai tikriausiai dar teks įsigyti ateityje daugiau šių kompiuterių.

Taigi, nepraleiskite progos išsibandyti ir jeigu kažką neįprasto ar įprasto, bet naudingo, pavyks pasigaminti - būtinai duokite žinoti.
