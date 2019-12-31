---
title: Vienas CSS ir JS failas visame projekte
permalink: /django/vienas-css-ir-js-failas-visame-projekte
category: django
image: i/django/vienas-css-ir-js-failas-visame-projekte.png
description: Vienas CSS ir JS visame projekte (tinklapyje). Kaip tai padaryta plačiau šiame straipsnyje.
---

Esu matęs ne vieną projektą (ir tiesą pasakius ne vieną tokį daręs) kuriame CSS ir JS (JavaScript) failų yra kartais net per daug. Arba jie užima per daug.

Jau baigėsi tie laikai, kada IT tinklaraščiai mirgėte mirgėdavo visokiomis temomis kaip kad: "vienas puslapis su HTML, CSS ir JS failais turėtų užimti iki 30 KB" ir pan. Tinklapiai jau pasiekė tokius laikus, kad parodyti vien paprastą HTML puslapį su geru turiniu kartais neužtenka. To pasekoje kartais nukenčia vartotojai ir svetainės savininkas.

Savininkas nukenčia nereikalingu serverio apkrovimu. Kuo mažiau klientai padaro request'ų, tuo didesnį lankytojų srautą svetainė galėtų atlaikyti, tad reklamos kompanijos mažiau pakenktų atėjusiems klientams, kai dėl serverio apkrovimo svetainės tampa nepasiekiamos. Visi tikriausiai žinome bent kelis tokius projektus kurie reklamos dėka negalėjo "aptarnauti" atėjusių lankytojų. Štai du pavyzdžiai:

-   [Abiturientus pravirkdė apkrovos neatlaikę LAMA BPO serveriai](http://www.balsas.lt/naujiena/495011/abiturientus-pravirkde-apkrovos-neatlaike-lama-bpo-serveriai)
-   [Visuotinis gyventojų surašymas stringa nuo pirmos dienos](http://ikrauk.15min.lt/aktualu/28684)

Rašydamas straipsnį "užmečiau" akį į [esurasymas2011.stat.gov.lt](http://esurasymas2011.stat.gov.lt) svetainę (jeigu skaitėte nuorodas aukščiau, tai ši svetainė yra viena iš aprašytų) kurios HTML kode panaudoti resursai truputį nustebino:

-   9 CSS failai.
-   16 JS failų.

Daugokai. Laimei, naršyklės vartotojus "saugo" ir dažniausiai nesiunčia šių failų kiekvieno puslapio atidarymo metu.

![LR 2011 metų visuotinis gyventojų ir būstų elektroninis surašymas](/i/visuotinis_gyventoju_surasymas_logo.png)

Tačiau faktas, kad svetainė būtų atlaikiusi truputį daugiau jeigu 25 failus būtų pakeitusi 2 failais. Tačiau žinoma, ne visada tai supranta tiek programuotojai, tiek patys klientai, kurie pirko prekę (web projektą). Ir aišku nei vieni, nei kiti, tikriausiai apie tai net nepagalvojo.

Tad šiame straipsnyje papasakosiu apie Django paketą pavadinimu django-compress. Jo pagalba savo Django svetainėse galima naudoti tik vieną JS ir CSS failą ir taip taupyti tiek naršytojų laiką tiek savo hostingo kainą.

Paketas gali būti parsisiunčiamas per buildout'ą į eggs įrašius:

    eggs = django-compress

Tie, kurie nenaudoja buildout'o (tikrai verta, pamėginkit) galima jį parsisiųsti į pypi.python.org svetainės:

    pip install django-compress

Įsirašykite compress į savo projekto settings.py failą:

    INSTALLED_APPS += ('compress',)

Ir paketas sėkmingai veiks Jūsų projekte. Dabar tik reikia nurodyti CSS ir JS grupes, suspaudimo lygį savo nuostatymuose (tame pačiame projekto settings.py faile):

    COMPRESS = True
    COMPRESS_VERSION = True
    COMPRESS_CSS = &#123;
        'grupė': &#123;
            'source_filenames': ('css/style.css', 'css/pagination.css',
                                 'css/calendar.css', 'css/forum.css',
                                 'css/gallery.css', ),
            'output_filename': 'c/main.css',
        &#125;,
    &#125;

Daugiau apie konfigūracines reikšmes galite paskaityti šioje nuorodoje. Lygiai tokiu pačiu principu pasidarome ir JavaScript failų grupes. Savo šablonuose, kuriuose anksčiau rašėte tiesioginius adresus į CSS ir JS failus pakeiskite šiomis šablono žymėmis (template tags):

    &#123;% compressed_css 'grupė' %&#125;
    &#123;% compressed_js 'grupė' %&#125;

Ar jau spėjote pasinaudoti django-compress paketu? Gal radote geresnę alternatyvą (galbūt net ne Django framework'ui)? Pasidalinkite :)
