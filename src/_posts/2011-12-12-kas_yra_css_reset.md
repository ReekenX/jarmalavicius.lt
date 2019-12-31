---
title: Kas yra CSS reset ir kaip juo naudotis?
permalink: /atviras-kodas/kas-yra-css-reset
category: atviras-kodas
image: i/kas-yra-css-reset.png
description: Programuoti be CSS reset šiais laikais neįmanoma. Mano versija - HTML4 ir HTML5 CSS reset.
---

Ne paslaptis, kad interneto svetainės atrodo nevienodai ant skirtingų naršyklių. Programuotojai jau seniai žino kaip šias problemas galima spręsti. Vienas iš tokių sprendimo būdų yra `CSS reset` failas apie kurį šiandien trumpai ir papasakosiu.

Ir kodėl gi taip nutinka, kad tas pats HTML atvaizduojamas puslapis atrodo skirtingai? Priežastis viena - skirtingi svetainių „paišymo“ varikliai ir jų nuolat besikeičiančios versijos. Ne paslaptis Internet Explorer naršyklė, kuri [interneto svetaines atvaizduoja prasčiausiai](http://www.jeffwu.net/?p=204) - joje krūvos neatitikimų su W3 konsorciumo nustatytais standartais interneto svetainių HMTL (ir ne tik) kodui atvaizduoti. Jos „paišymo“ variklis „Trident“ jau seniai yra galvos skausmas programuotojams.

Kiekvienos naršyklės [puslapio atvaizdavimo variklis](http://en.wikipedia.org/wiki/Web_browser_engine) nustato savo reikšmes pagal nutylėjimą HTML elementams „nupiešti“ puslapyje. Todėl tarpai tarp objektų vienoje naršyklėje yra didesni, kitoje mažesni. Raidės pagal nutylėjimą vienoje naršyklėje gali būti vaizduojamos vienokio šrifto ir dydžio, kitoje naršyklėje su kitokio.

Todėl norint to išvengti reikia programuojant nustatyti visas reikšmes į konkrečias, o nepalikti apie jas nuspręsti naršyklių varikliams. Būtent tam ir skirtas `CSS reset` failas. Jame nurodomos visų įmanomų HTML elementų standartinės atvaizdavimo reikšmės. Tačiau tokių `CSS reset` failų interneto platybėse yra labai daug, tad kurį ir kodėl pasirinkti?

Todėl vieną dieną neapsikenčiau, ir surinkęs geriausias praktikas iš pačių populiariausių CSS framework'ų (daug nuorodų rasite [stackoverflow puslapyje](http://stackoverflow.com/questions/116754/best-css-reset)) pasigaminau nuosavą `CSS reset` biblioteką kuri tinka tiek HMTL4, tiek HTML5.

**Bonusai**

Žinoma, man to dar neužteko. Kadangi dažnai tenka puslapiuose naudoti float, cursor ir pan., tai pridėjau taip sakant „bonusų“. Kol kas dar labai nedaug, bet, manau, kad tą sąrašą padidinsiu.

![ CSS reset kodas valdomas per SASS (VIM redaktoriuje)](/i/css_reset.png)

Šią biblioteką su [Public Domain](http://www.gnu.org/philosophy/categories.html#PublicDomainSoftware) licencija rasite mano [Github profilyje](https://github.com/ReekenX/html5-css-reset).

**Kelios versijos**

Kiek teko matyti kitų CSS reset failuose, tai dažniausiai jie yra nesuspausti. Resursus būtina taupyti, todėl produkcinėje svetainės versijoje visada pateikite suspaustą failą kurį taip pat rasite mano [Github profilyje](https://github.com/ReekenX/html5-css-reset).

**Lengva naudotis**

Dažnai tenka taikytis prie kitų programavimo stiliaus, kas kartais būna nepatogu. Todėl šį `CSS reset` failą parašiau su [SASS](http://sass-lang.com/). Dabar jį galima pritaikyti prie Jūsų programavimo standarto. O rašyti papildomą kodą yra dar paprasčiau negu CSS.