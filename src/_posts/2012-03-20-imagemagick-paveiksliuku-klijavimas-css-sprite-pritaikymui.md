---
title: ImageMagick - paveiksliukų klijavimas (CSS Sprite)
permalink: /atviras-kodas/imagemagick-paveiksliuku-klijavimas-css-sprite-pritaikymui
category: atviras-kodas
image: i/placeholder.jpg
description: Kaip su ImageMagick suklijuoti paveiksliukus, kad juos galima būtų pritaikyti CSS sprite atvaizdavimui.
---

Tikrai ne vieną kartą teko „klijuoti“ kelis paveiksliukus į vieną tam, kad sumažinti iš svetainės siunčiamų resursų kiekį. Vieni tai daro pasinaudoję kokiu nors paveiksliukų redaktoriumi (čia pirmiausiai į galvą šauna mokama programinė įranga Photoshop), kiti tą daro pasinaudoję kokiais nors į kompiuterį įrašytais įrankiais arba internete esančiomis paslaugomis.

Tačiau atidarinėti didžiulę programą paveiksliukų redagavimui arba ieškoti serviso dažnai kainuoja laiko. Juk darbas toks paprastas: tiesiog sujungti kelis paveiksliukus į vieną. Taigi šiandien parodysiu kaip tai galima padaryti ImageMagick įrankio pagalba tiesiog komandinėje eilutėje.

Pirmiausiai pasitikrinkite ar Jūsų kompiuteryje tokia programinė įranga apskritai egzistuoja. Jeigu ne, įsidiekite ją:

    apt-get install imagemagick  # Debian šeimos OS

Atidarykite katalogą kuriame yra Jūsų paveiksliukai kuriuos norite sujungti ir paleiskite sekančią komandą:

    montage -background transparent -geometry +0+0 *.png rezultatas.png

Argumentų paaiškinimai:

    -background transparent # peršviečiamas fonas tarp paveiksliukų
    -geometry +0+0          # kokius tarpus padaryti tarp paveiksliukų

Dažnai pasitaiko, kad kataloge būna šimtai paveiksliukų ir jų visų sujungti į vieną dažniausiai nenorėsite. Todėl atsirinkite juos pavadinimą pakeisdami į tokį, kuris rastų Jūsų jungiamus paveiksliukus kataloge. Pavyzdžiui `slider_*.png` nurodo, kad jungsime tik tuos paveiksliukus, kurie turi pavadinimo pradžią `slider` ir baigiasi formatu PNG. Taip pat, kad nekiltų problemų, stenkitės išlaikyti vienodą visų jungiamų paveiksliukų rezoliuciją.

Faile `rezultatas.png` matysite norimą rezultatą: sujungtus paveikslėlius į vieną failą.

Trumpai priminsiu kaip naudoti CSS kode CSS sprite:

    background: url('rezultatas.png') no-repeat 32px 0;
    width: 32px;
    height: 32px;

Vietoje `32px 0` įrašykite koordinates kurį kvadratą tuo metu rodyti pagal situaciją.
