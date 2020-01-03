---
title: Paveiksliukai ir ikonėlės el. laiškuose
category: atviras-kodas
image: i/base64.png
description: Jeigu el. laiškuose naudojate paveiksliukus - tai juos gana nepatogu pridedinėti kaip el. laiško priedus. O ir online base64 generatoriai paveiksliukams - nepatogūs.
---

Turbūt kiekvienam web programuotojui ne kartą yra tekę siųsti paveikslėlius, nuotraukas ar ikonėles el. laiškuose. Jokia čia naujiena.Deja, pats paveiksliukų procesas vistiek yra labai problematiškas, nes yra trys būdai kaip paveiksliukai gali būti išsiųsti ir kiekvienas turi savo trūkumų.## Paveiksliukai iš internetoPats paprasčiausias ir lengviausias būdas, tai dėti el. laiškuose nuotraukas su nuorodomis į internetą:```html
{% include post_image.html image="http://example.com/nuotrauka.png" text="" %}
```Paprasčiausias būdas turi daugybę trūkumų:* Paveiksliukams būtinai turite nurodyti protokolą (HTTP arba HTTPS) ir domeno adresą.
* Paveiksliukai visada turi būti prieinami. Jeigu kažkas laišką žiūrės iš archyvų, tarkime po kelių metų, turite užtikrinti, kad tas kelias vis dar pasiekiamas.
* Gmail ir kiti pašto klientai pirmiausiai paklaus laiško skaitytojo ar rodyti nuotraukas. Šis tikrinimas daromas, nes paveiksliukuose dažnai slepiami „tracking pikseliai“ arba kitos blogybės.**Šį būdą rekomenduočiau mažiausiai.**## Paveiksliukai iš prisegtukoKitas dažnas būdas siųsti media yra prikabinant ją prie laiško, kaip prisegtuką.Toks būdas turi tokius trūkumus:* Skaitytojas laiškų sąraše mato, kad el. laiške yra prisegtų failų, kas nėra korektiška.
* Turite būti atsargūs kaip tuos failus vadinate, nes galite nepraeiti pro el. pašto filtravimo programą.
* Tai papildomas vargas jeigu susirašinėjate toliau. Kad laiško istorija būtų tvarkinga, turėsite tuos paveiksliukus persiųsti ir kitiems. Jeigu nepersiųsite, tai kažkas kam rodote laišką gali nematyti ekrano nuotraukų ar kitų svarbių dalykų kurie buvo originaliame laiške.## Paveiksliukai iš base64 reikšmėsTai labai populiarus būdas visą nuotraukos turinį užkoduoti ir prikabinti standartiniais būdais prie laiško:```html
{% include post_image.html image="data:image/png;base64,iVBORw0KGgoAAAANS...." text="" %}
```Tokiu būdu laimėsite:* Skaitytojas nematys, kad el. laiške yra prisegtukų.
* Persiunčiant laiškus jie - neišsikraipys.
* Šiuo būdu HTML elementai taip pat gali būti fonui naudojami (kaip `background-image: ...`).
* Nereikia rūpintis paveiksliukų atnaujinimu kai naršyklė ar pašto klientas juos užkešuoja.Nors internete base64 nuotraukų konvertavimų yra be galo daug, bet ar žinojote, kad viską galite padaryti standartinėmis Linux komandomis?```bash
echo "data:image/png;base64,$(base64 -w 0 ikonele.png)"
```Šis būdas taip pat veiks ir Macos.Tiesa, trūkumų taip pat yra:* Sunku suprasti koks paveiksliukas ir kurioje vietoje panaudotas (nes nėra failo vardo).
* Visokie redaktoriai gali supykti už itin ilgas eilutes, jeigu paveiksliukas sveria tikrai daug.Bet ignoruoti šias bėdas verta, nes klientai turės korektišką media.
