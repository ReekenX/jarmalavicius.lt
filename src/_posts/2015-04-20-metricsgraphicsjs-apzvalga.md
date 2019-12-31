---
title: MetricsGraphics.js apžvalga
permalink: /atviras-kodas/metricsgraphicsjs-apzvalga.html
category: atviras-kodas
description: MetricsGraphics.js bibliotekos, kurią sukūrė Mozilla, privalumai ir trūkumai. Kokios praktinės išvados pasinaudojus?
---

Programuojant ne vieną kartą teko braižyti klientams įvairius grafikus.
Tas poreikis nėra iš piršto laužtas - ne kartą teko įsitikinti įvairių
grafikų privalumu kai informacija juose yra žymiai aiškesnė nei ant
popieriaus lapo kokioje nors lentelėje.

Bėda ta, kad atviro kodo bibliotekų yra tūkstančiai internete ir rinktis
tarp jų - tikras galvos skausmas. O jeigu dar pažiūrėste į grafikų
pavyzdžus tai apsvaigs galva. Tiesa, komercinių bibliotektų taip pat yra
didžiulė gausybė. Prie šios kategorijos dar ir priskirčiau tokius
grafikus, kurie yra nemokami, tol kol nenaudoji jų komerciniams
tikslams. Kaip pavyzdžiui [HighCharts](http://www.highcharts.com/).

**Trumpai apie MetricsGraphics**

Beieškodamas naujam projektui grafikų sistemos kuri atitiktų kelis
kriterijus:

-   Nereikalautų nei flash nei kitų papildų.
-   Nebūtų statinis/neįdomus paveiksliukas.
-   Būtų gana gerai dokumentuotas.

Atradau krūvas bibliotekų, tarp kurių buvo ir pakankamai naujas
[Mozilla](https://www.mozilla.org) kūrinys pavadinimu
[MetricsGraphics](http://metricsgraphicsjs.org/).

![ MetricsGraphics.js logotipas](/i/images/metricsgraphicsjs.png)

Šiek tiek panaršius intro puslapyje pamatysite, kad tai:

-   Dažnai atnaujinamas ir tikrai „nemiręs“ projektas.
-   Turi tikrai gausią pavyzdžių bazę.
-   Tikrai gana greitai veikia su tūkstančiais „taškų“.
-   Pakankamai gerai „žiūrisi“.

MetricsGraphics gana neblogas pasirinkimas. Ypač, kai visas „grožis“
slepiasi po galingu D3 framework'u. O tie kas yra naudoję D3 tikrai
žinosit, kad šiai bibliotekai reikia skirti nemažai dėmesio pramokti ja
naudotis. D3, pakankamai lengvai, lengvus dalykus padaro itin
sudėtingais. Dėl šios priežasties kažkokia papildoma biblioteka ant
„viršaus“ kaip MetricsGraphics man pasirodė itin gera mintis.

**MetricsGraphics privalumai**

Kaip ir visi kiti projektai, taip ir šis, turi tiek pliusų tiek minusų.
Pradžiai apie privalumus.

Naudotis ir pasileisti buvo išties lengva. Gana gerai išpuoselėti
paprasti pavyzdžių kodai lengvai persikėlė į dabartinį esamą projektą.

Didelis privalumas tai, kad grafikus galėsite turėti į savo projektą
įmetę vos tris failus.

Kaip ir daugelis kitų bibliotekų, taip ir ši leidžia interaktyviai
„apžiūrėti“ duomenis ant grafikų pasilinkus pele. Mažmožis, bet tikrai
reikalingas.

**MetricsGraphics trūkumai**

Grafikai tikrai atrodo gana profesionaliai. Tačiau pakeisti iš grafinės
pusės kažką juose - vargu ar pavyks. Tik tokius mažmožius kaip tekstų
dydžius ar kelias spalvas.

Neteisingai skaičiuoja max y reikšmę. Susidūriau ir pats, ir mačiau, kad
dar nesutvarkyta klaida kurią kiti žmonės paskelbė GitHub. Kadangi API
leidžia pačiam paskelbti kokia maksimalią Y reikšmę, taigi, teko pačiam
susiskaičiuoti ir ją paduoti į API.

X juostos tekstas (apačioje) irgi kažkas nesuprantamo. Dėl nebūtinai
teisingų skaičiavimų tai ką rodo grafikas ir X ašis - nebūtinai sutaps.

![MetricsGraphics gražu, bet nebūtinai veikia](/i/images/metricsgraphics_grafikas.png)

O automatinis X ašies reikšmių paskaičiaivimas tikras galvos skausmas.
Nepavyko suprasti kaip jis veikia, bet vienintelis būdas turėti
tvarkingą grafiką yra persiskaičiuoti tas reikšmes pačiam.

Dar vienas trūkumas - grafikų tipų gausos nebuvimas. Baziniai
(dažniausiai naudojami grafikai) tikrai yra, tačiau jeigu panaršytumėte
[D3 galerijoje](https://github.com/mbostock/d3/wiki/Gallery),
pamatytumėte kiek dar daug gali Jums pritrūkti dideliame grafike kur yra
statistikos poreikis.

**Įžvalgos po pasinaudojimo arba - išvados**

Kaip jau minėjau, bibliotekos ieškojau, nes galingasis D3, kuris leistų
tikrai pasidaryti absoliučiai viską ir kaip tik širdis norėtų, padaro
lengvus dalykus labai sudėtingais. Dėl to ir poreikis buvo ieškotis
tokios bibliotekos, kuri išspręstų kai kuriuos dalykus už mane.

Kadangi pats projektas MetricsGraphics.js yra labai dar jaunas, tai jame
tikrai apstu klaidų kurias tikrai sunku ištaisyti nekeičiant
MetricsGraphics.js kodo.

Dėl šios priežasties po kelių savaičių padarytų darbų teko ieškotis
kitos bibliotekos. Iškilus poreikiui pakeisti bent šiek tiek grafikų
išvaizdą (arba kai ką jose pataisyti) - kitos išeities neliko.

Žinoma, projektas dar gerokai patobulės, todėl nesakau, kad nereikėtų
kada dar išmėginti. Na, o jeigu reikia kažkur pavaizduoti visai neblogą
grafiką (grafikus) tam neskiriant per daug laiko, tai MetricsGraphics
tam puikiai tiks.

Jeigu teko patirti panašių įspūdžių su D3 ar MetricsGraphics būtinai
pasidalinkite komentaruose!
