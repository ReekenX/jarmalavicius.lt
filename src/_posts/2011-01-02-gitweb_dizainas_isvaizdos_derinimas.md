---
title: Gitweb išvaizdos derinimas
permalink: /mano-projektai/gitweb-dizainas-isvaizdos-derinimas.html
image: i/mano-projektai/gitweb-dizainas-isvaizdos-derinimas.png
category: mano-projektai
description: Gitweb senas, bet geras įrankis pasidaryti GIT repozitorijų peržiūrą privačiai. Standartinė išvaizda baisi - šis straipsnis apie tai, kaip tai sutvarkyti.
---

Tikriausiai daugelis yra matę kaip svetainėje
[git.kernel.org](http://git.kernel.org) atvaizduojami Kernel išeities
kodai. Konkrečiai kalbu apie Kernel projektų Gitweb saugyklą. Nors ši
saugykla ir atrodo ne itin maloniai, tačiau savo paskirtį ji atlieka
puikiai: leidžia naršyti po GIT versijavimo sistemose saugomus
projektus, jų istorijas, konkrečių istorijų pakeitimus, ieškoti įvairaus
turinio (autoriaus, tam tikrų pakeitimų komentarų ir pan.).

Tad šiame straipsnyje labiau dėmesį noriu atkreipti į šio projekto
Gitweb išvaizdą. Kiek teko skaityti įvairiuose forumuose ir pan., žmonės
naudodami Gitweb nelabai žino kaip pasikeisti išvaizdą, nors visas šis
projektas telpa į tris failus: su Perl parašytas CGI skriptas, stiliaus
failas ir JavaScript. Tad kaip lengvai išvaizdą padaryti ne tokią
atgrasią papasakosiu plačiau.

**Gitweb privalumai**

Verta pažymėti kelis dalykus dėl ko mane sužavėjo šis projektas:

-   Naršyklėje daug patogiau žiūrėti kodo skirtumus ir istorijas negu
    terminalo lange. Vos keliais mygtuko paspaudimais galima atsisiųsti
    kodą iki tam tikro pakeitimo (funkcija pavadinimu "snapshot").
-   Galima matyti kokius projektus dariau vėliausiai, o kokius visai
    neseniai.
-   Prie kiekvieno projekto galima matyti projekto trumpą aprašymą. Tad
    turint daugiau nei 100 projektų tas labai patogu.
-   Paieška veikia ypatingai greitai. Surasti tam tikrus autorius,
    pakeitimų komentarus ir pan. labai lengva.
-   Kadangi Gitwebas repozitorijas atvaizduoja tik iš vieno katalogo,
    tai padarius tokią centrinę visų projektų repozitoriją, labai lengva
    daryti jos atsargines kopijas.
-   Visada galima užsiprenumeruoti tam tikro projekto istorijos RSS.

**Kaip instaliuoti Gitweb?**

Debian sistemose instaliuoti labai paprasta:

    sudo apt-get install gitweb

Konfigūracinis failas randasi */etc/gitweb.conf*. Labai patiko, kad
Gitweb yra labai lankstus, leidžia pakeisti labai daug ką kas gali
nepatikti standartiniame atvaizdavime. Pavyzdžiui konkrečios
repozitorijos aprašymo (description) ilgį. Ką galima pakeisti galima
rasti pačiame */usr/share/gitweb/index.cgi* faile.

**Gitweb dizaino keitimas**

Kaip Gitweb atvaizduoja su standartiniu dizaino šablonu galima pamatyti
Kernel svetainėje arba nuotraukoje apačioje.

Tačiau tokia išvaizda gali tiesiog demotyvuoti naudotis šiuo tikrai geru
projektu. Ir tikrai demotyvuoja :)

Tačiau paieškojęs internete radau keletą dizaino temų. Viena iš jų
Kogakure sukurta tema. Ši tema labai stipriai pagyvino repozitorijų
centrą. Pažiūrėkime nuotraukas:

Daugiau nuotraukų galite rasti mano gitweb dizaino repozitorijoje.

O instaliuoti tokią temą labai paprasta. Pirmiausiai parsisiųskite temą:

    git clone git://github.com/ReekenX/gitweb-theme.git

Persikopijuokite gitweb.css ir gitweb.js failus į katalogą
*/usr/share/gitweb*. Šios temos tikrasis autorius siūlo pasidaryti failų
atsargines kopijas. Tačiau jeigu tai padaryti pamiršite, tai siūlau
tiesiog perinstaliuoti šią programą ir taip atgausite originalius
dizaino failus:

    sudo apt-get purge gitweb
    sudo apt-get install gitweb

O jūs ar naudojate Gitweb? Ar laikote GIT projektus tiesiog
kataloguose/serveriuose per ssh prieigą? O galbūt naudojate Viewgit'ą,
Git-PHP, WIT? Pasidalinkite privalumais/trūkumais ar idėjom :)
