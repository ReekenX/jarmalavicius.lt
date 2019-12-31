---
title: Konqueror su Webkit varikliuku
permalink: /atviras-kodas/konqueror-su-webkit-varikliuku.html
category: atviras-kodas
description: Kaip Konqueror naršyklę priversti naudoti Webkit variklį. Webkit variklis vienas populiariausių tų dienų web vaizdavimo variklis.
---

Visada žinojau, kad tokia naršyklė kaip Konqueror yra, tačiau seniau jos
nenaudojau. Ir vieną kartą panaudojus, ji visai gerą įspūdį padarė. Joje
velniškai daug nustatymų, tad naršyklė gali elgtis taip, kaip Jūs
pasakysite.

Patiko meniu juosta, kurioje vieno mygtuko paspaudimu galima tą puslapį,
kurį matote su Konqueror pasileisti tarkime su Firefox.

Galima ne tik vieno mygtuko paspaudimu pakeisti siunčiamos naršyklės
identifikacijos informaciją, tačiau ir blokavimus svetainėje,
sausainiukus (angl. cookies), išversti puslapį į kitą kalbą, atjunkti
Java arba flash ir pan.

![Konqueror naršyklės langas](/i/images/konqueror.png)

Patiko, kad puslapį galima peržiūrėti su ne vieu varikliuku. Pvz pagal
nutylėjimą esančių KHtml. Tačiau jis, nepalaiko HTML5, o tai jau po
truputį darosi problema. Tuo labiau, kai mano puslapis taip pat ant
HTML5 yra ir vaizdas kurį pamačiau, nepatiko. Laimei, jo „nepalaikomas“
HTML5 turinys vistiek atrodo keletą kartų geriau, nei senesnėse Internet
Explorer naršyklėse. Arba, net ir naujose. Bet vistiek.

Todėl norėjosi susirasti tą variklį, kurį naudoja Chrome naršyklė. Jis
vadinasi Webkit. Jis ne tik yra labai greitas, tačiau neatsilieka nuo
naujausių technologijų. Tad šiame trumpame straipsnyje papasakosiu, kaip
Webkit variklį pasileisti ant Konqueror naršyklės.

Pirmiausiai instaliuokime webkit variklį:

    apt-get install kpart-webkit

Tuomet pakeiskime HTML failo tipo peržiūros variklį paleidę tokią
komandą:

    keditfiletype text/html

Ir atsivėrusiame lange pereikime į kitą kortelę ir pastumkime varikliuką
Webkit į viršų šone esančiais mygtukais.

![Atsivėrusios keditfiletype programos langas su Webkit variklio parinktimi](/i/images/keditfiletype.png)

Naršyklės paleisti iš naujo nebūtina. Naujai atvertus puslapius jau
matysite su daug geresniu varikliuku - Webkit.
