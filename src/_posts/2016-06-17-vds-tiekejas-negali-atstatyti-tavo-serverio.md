---
title: VDS tiekėjas negali atstatyti tavo serverio?
permalink: /atviras-kodas/vds-tiekjas-negali-atstatyti-tavo-serverio
category: atviras-kodas
image: i/atviras-kodas/vds-tiekjas-negali-atstatyti-tavo-serverio.png
description: Kaip serveriai.lt / dedikuoti.lt nededa pastangų užtikrinti savo klientų VDS'ų paslaugų. Kaip „deda pastangą“ iškomunikuoti ir sureaguoti į kritines problemas.
---

Istorijos apie tai, kad kartais, Virtualių Dedikuotų Serverių (toliau - „VDS“) tiekėjai susimauna, ir neturi galimybės atstatyti serverio ir/arba atsarginių kopijų, yra gana retos. Tačiau akivaizdu - vis dar pasitaiko.

Taip nutiko ir man, deja, su vienu populiariausiu Lietuvoje tokių paslaugų tiekėju Interneto Vizija (labiau žinomas adresais [serveriai.lt](https://serveriai.lt) ar [dedikuoti.lt](https://www.dedikuoti.lt)).

<p class="text-center">
<img src="/i/serveriai.lt-irgi-susimauna.png"/>
</p>
<p class="text-center text-muted small">Serveriai.lt hostingo logotipas</p>

Tai ši istorija apie tai, kaip reaguoti į tokias situacijas, kaip tvarkytis su jomis ir jų problemų sprendimo būdus.

## Viskas prasideda nuo monitorinimo

Kiekvienas, be išimties, serveris ar paslauga privalo turėti monitorinimą. Nesvarbu ar Jūsų paslaugų tiekėjas tokį turi - privalote turėti ir Jūs. Nes kitaip, apie problemas - sužinosite paskutinis.

Taip, tokį monitorinimą pats turiu - [Nagios3](https://www.nagios.org/). Jis tikrina kelis serverius, daugybę projektų jose, el. paštą, kai kurių svetainių SEO ir kitas tarnybas.

<p class="text-center">
<img src="/i/nagios3.png"/>
</p>
<p class="text-center text-muted small">Nagios logotipas</p>

Taigi, 05:45 vienas iš serverių nustoja veikti. Gaunu daug el. laiškų apie neveikiančias paslaugas. 49 interneto projektai neveikia, el. paštas ir kai kurios kitos smulkios paslaugos. Pirma mintis kurį šauna į galvą, po to, kai nepavyksta prisijungti prie ssh tarnybos - perkrauti serverį. Aiškintis kodėl taip atsitiko - vėliau.

Jungiamės prie [klientams.iv.lt](https://klientams.iv.lt) ir perkrauname serverį per jų sistemą. Žinutė, kad tokia operacija bus įvykdyta per 5-10 minučių - nuramina, todėl galima eiti ramiai miegoti.

## 07:00 Nagios vis dar nepatenkintas

Kadangi Nagios nepraneša apie sėkmingai veikiantį projektą, tikrinam [klientams.iv.lt](https://klientams.iv.lt) statusą ir gauname maždaug tokią žinutę:

<p class="text-center">
<img src="/i/serveriai.lt-klaida.png" />
</p>
<p class="text-center text-muted small">Sisteminė klientams.iv.lt klaida - serveris perkrautas?</p>

Taigi, kadangi jų vidinė sistema neveikia ir problemos sutvarkyti negalima, belieka kreiptis pas paslaugų tiekėją tiesiogiai - rašyti el. laišką.

Laiškas išsiųstas su prašymu paleisti serverį. Kadangi jų darbo laikas prasideda 08:30, **profesionaliausias#### daly ką galima šiuo atveju padaryti - įspėti visus klientus kurių projektai/paslaugos yra nepasiekiamos. Juos reikėtų informuoti apie tai, kas vyksta, kodėl įvyko, kada greičiausiai viskas startuos ir, aišku, atsarginį planą, kad esant rimtai bėdai - projektai po pietų veiks iš atsarginio serverio.

## 08:50 Vis dar nieko iš Interneto Vizijos

Siunčiam dar vieną laišką. Kaip ir pirmame, pažymim - kad skubu.

## 09:00 Vis dar jokio atsako iš Interneto Vizijos

Tikriausiai vieno sakinio laišką parašyti jiems, kad bėda tvarkoma, buvo per sunku.

Nesulaukus jokios paslaugų tiekėjo reakcijos - skambinam. Patikina, kad problema kaip tik sprendžiama.

**Profesionaliausias#### dalykas ką galima padaryti šioje situacijoje - informuoklientus, kad bėda tikrai sprendžiama arba bent jau bus sprendžiama po kažkurio laiko tarpo. Tą padariau visiems klientams kuriuos ši bėda taip pat palietė.

## 10:00 „Priežasties dar neradome“ - dedikuoti.lt

Pirmoji reakcija, vieno sakinio, iš jų pusės.

Kaip pirmas informavimas po 1.5 valandos - gana prastai. Ne tik neaišku kas buvo daroma, kiek tai laiko truko, bet tuo labiau kas toliau bus daroma ir kiek tai truks.

Žinoma, sitaucija bloga. [Komunikacija iš paslaugų tiekėjo siaubinga](https://www.dedikuoti.lt).

Dar kartą informuojame klientus apie tai kas vyksta ir apibrėžiam viską laiko rėžiais. Tai yra, jeigu iki pietų Interneto Vizija taip graudžiai spręs problemas, tai kursime naują serverį, ir kelsime atsarginę versiją. Rankomis, žinoma.

Atsarginių kopijų turiu kiekvieno serverio kiekvienos metų dienos (archyvą retokai trinu). Visgi, ankstesnės dienos projekto versija yra ne taip blogai kaip visiškai neveikiantis projektas, tiesa?

## 11:00 Vis dar jokios reakcijos

Rašome laišką su prašymu patikslinti kas vyksta.

Tuo metu, pasiruošiame atsargines kopijas (failų ir duomenų bazių) dėl viso pikto. Visgi, praėjo jau 2.5 valandos nuo jų darbo pradžios, o komunikacija iš jų pusės visiškai nevyksta.

## 11:50 Serverio atkurti nepavyks

Ir gauname pagaliau laišką iš paslaugų tiekėjo:

<pre>
<b>deja, tačiau serverio paleisti nėra įmanoma</b>. Šiuo atveju branduolio (angl. kernel)
atnaujinimo metu buvo perkrauti visi mūsų klientų serveriai, tačiau po perkrovimo
Jūsų serveris visiškai neatsako į paleidimo komandą. Administratoriams peržiūrėjus
situaciją nustatėme, kad serveris po perkrovimo nepasileidžia dėl nekorektiškai
įdiegtų paketų su "force-confdef" parametru:

Start-Date: 2016-06-17  09:45:52
Commandline: /usr/bin/apt-get -y -o Dpkg::Options::=--force-confdef -o Dpkg::Options::=--force-confold install libapache2-mod-php5
Upgrade: [..]
End-Date: 2016-06-17  09:46:03

Start-Date: 2016-06-17  09:49:26
Commandline: /usr/bin/apt-get -q -y -o Dpkg::Options::=--force-confdef -o Dpkg::Options::=--force-confold remove samba-libs
Remove: [..]
End-Date: 2016-06-17  09:49:27

Šiuo atveju galėtume Jums pasiūlyti <b>perrašyti serverio operacinę sistemą</b>
ir <b>atstatyti serverio duomenų kopiją į serveryje esančią direktoriją</b>.
</pre>

Kad serverio paleisti nepavyks - viskas aišku. **Kritinė situacija**. Dabar ją reikia spręsti.

Kaip Kernelio paketai susiję su *prieš 2 mėnesius* įdiegtais PHP paketais nelabai aišku. Dėl to galima ginčytis iki nukritimo, ypač kai visa programinė įranga yra diegta iš Debian oficialių šaltinių. Bet ginčas - problemos neišspręs.

Interneto Vizijos pasiūlytas sprendimas - perrašyti serverio operacinę sistemą, o atsarginę kopiją visų failų sumesti į kažkokį atskirą katalogą. Iškart akyse pasirodė kiek darbo gali užtrukti programinės įrangos diegimas. 49 projektai, Ruby / Python / PHP projektai, duomenų bazės, el. paštas ir kitos tarnybos. Viską teks įdiegti ranka.

Turbūt pats **neprofesionaliausias sprendimo būdas** šioje situacijoje, **kurį padarė Interneto Vizija**, nusimesti visą atsakomybę ir problemos sprendimo būdus nuo savęs - parašyti laišką apie problemą, pasiūlyti vieną iš sprendimo būdų ir... Pamiršti apie problemą.

## 11:55 Skubiai atrašau, kad - NE!

Skubiai atrašau, kad toks sprendimo būdas nepriimtinas. Kad jie nepateikė nei galimų alternatyvų, nei kokios to pasėkmės gali būti - patyliu.

Laiške pasiūlau savo sprendimo būdą, kuris jau yra blogas - atstatykite vakar dienos atsarginę kopiją. Su padariniais pats tvarkysiuosi.

## 12:20 IV - pietauja?

Negaudamas jokio pranešimo iš Interneto Vizijos skambinu jiems jau trečią kartą ir prašau nukreipti pas žmogų, kuris pasiūlė viską pradėti iš naujo. Deja, bet šiuo metu su juo pakalbėti nepavyks.

Paklausus kada galima pasikalbėti - neaišku ir atsakyti negali. **O siaube**!

Taip, visi mes žmonės ir galim turėti asmeninių reikalų. Taigi, valandai laiko problema nebus sprendžiama.

Siunčiu laišką, kad man patys paskambintų, nes toks sprendimo būdas jų pasiūlytas - visiškai netinka.

## 13:00 IV skambutis

Pagaliau man paskambina ir pradeda pasakoti situaciją. Yra kažkokios Open VZ bėdos (technologija kurią jie naudoja).

Pasiūlau atstatyti atsarginę kopiją - sakė, kad bandė, bet paleisti ir jos nepavyko. Jeigu būčiau apie tai jau žinojęs anksčiau - greičiausiai per jų pietų pertrauką būčiau startavęs su kitu serveriu ir projektais. Dabar, dėl tokios komunikacijos - sugaišta valanda per kurią niekas nebuvo daroma.

**Taigi, reziume - jokio serverio ir jokių atsarginių versijų**. Jokios ir komunikacijos.

Pats blogiausias variantas, kurį tenka priimti buvo jų siūlytas - perrašyti serverį ir kažkur kataloge patalpinti seno serverio failus. Paklausus, kiek tai užtruks, išgirdau, kad apie pusvalandį.

Nieko nepadarysi - tenka rinktis blogiausią variantą.

Taigi, informuojame savo klientus, kas vyksta ir, kad po kelių valandų projektai vėl veiks.

## 13:50 „Ilgesnis pusvalandis“

Gaunu laišką, kad serveris buvo perrašytas ir failai kopijuojami. Mažiau nei pusė failų jau perkopijuota :(

## 15:00 ?

Jokios informacijos, kad failai jau baigti kopijuoti negavau. Įprasta, iš Interneto Vizijos, tikriausiai. Diena parodė, kad komunikacija vienkryptė - tau reikia - tu ir skambink.

Panikuoti nereikia, kaip yra taip. Sprendžiam problemą - reikia kuo skubiau paleisti visus projektus.

Profesionalus sprendimo būdas šioje situacijoje - automatizuotas programinės įrangos įdiegimas. Parsisiunčiame „paruoštuką“ programinei įrangai diegti [su ansible](https://github.com/ReekenX/ansible-playbooks) arba [saltstack](https://github.com/ReekenX/salt-configs) ir per mažiau nei 10 minučių sudiegiame visą programinę įrangą
į serverį.

Atsargines kopijas pats turiu. Jeigu skaitėte mano ankstesnius straipsnius, tai yra ne vienas būdas kaip jas daryti. Šioje vietoje „paėmiau“ tai, ką IV sukrovė į `/mnt/` katalogą. Pereiname per `/etc`, `/var`, `/usr`, `/home` katalogus ir sukilnojame failus/konfigūracijas.

Pasitikriname su `apache2ctl -t` arba `nginx -t` konfigūracijas ir jeigu viskas gerai - perkrauname servisus.

## 15:40 Projektai ir vėl „online“

Profesionalus veiksmas šioje situacijoje - greitai informuojame klientus, kad projektai gyvi; kad imsimės priemonių, kad kitą kartą taip nenutiktų; paaiškiname situaciją ir primename, kad gali būti laikini sutrikimai. Juk negalima pasitikėti automatiniais įrankiais - viską **būtina#### pasitikrin

Aišku, visko tikrinimas - trunka labai ilgai.

## 10 valandų „downtime“

Prisipažinsiu, kad tiek „downtime“ laiko per pastaruosius 5 serverių administravimo metus - neturėjau. Apmaudu, kad taip nutiko. Bet dar apmaudžiau, kad [Interneto Vizija](https://www.iv.lt/), tokia žinoma kompanija, visiškai pro pirštus žiūri į kritiškas situacijas. Ir dar apmaudžiau, kad taip **nuvilia#### paslaugų tiekėjakurio paslaugomis naudojuosi kokius 7 metus.

Pabaigai - viską vainikuoja Interneto Vizijos mandagus atsiprašymo laiškas. Kurį galėjau susikurti savo vaizduotėje.

Aš, kad ir kaip vertinti situaciją - *atsiprašiau klientų*.

## Laikas keisti paslaugų tiekėją?

Žinoma, kad ne. Nusivyliau labai komunikacija ir tuom, kad problema buvo sprendžiama kaip kokioj „praktikantų“ firmoje.

Kažkurioje savo skaitytų knygų perskaičiau tokią frazę: "protingas žmogus išspręs problemą jai *jau susidarius*, išmintigas pasiruoš problemai, kad *ji - nesusidarytų*“.

Svarbu ne tai, kaip pasiruošę kiti - o kaip pats pasiruošęs.

## Pamokos

Nors pats tokiam duomenų dingimui buvau visai neblogai pasiruošęs (neskaitant to fakto, kad paslaugų tiekėjas sugaišo brangias 6 valandas, o man pačiam viską atstatyti truko 40 minučių) priminsiu kaip pasiruošit tokioms katastrofoms.

Visada **turėkite atargines kopijas**. Ne mėnesio ar savaitės senumo. Jau dienos - yra blogai. Turėkite bent 2 kartų dienoje kopijas.

Nesaugokite kopijų tik viename archyve. Įprastai, aš turiu 3 vietas saugoti duomenis.

Pasitikrinkite savo atsargines kopijas karts nuo karto. Ar jos nėra tuščios (0 baitų), ar jas galima išarchyvuoti. Pasitikrinkite ką Jūs saugojate.

Nearchyvuokite savo kopijų tokiu suglaudinimo lygiu, kad po to išarchyvuoti truktų labai ilgai. Naudokite greičiausią/mažiausią archyvavimo lygį - taip jas galėsite atstatyti greičiausiai.

Būtinai turėkite įrankį, su kuriuo **įrašytumėte programinę įrangą per kelias minutes**. SaltStack, Ansible ir daug kitų sistemų lengvai tą padės padaryti. Tuo labiau, nebūtina viską daryti patiems - pasinaudokite atviro kodo privalumais. Pasiimkite kieno nors konfigūracijas ir pritaikykite pagal save.

**Visada komunikuokite**. Būtinai informuokite apie situacijas, net jeigu ir rašyti/skambinti nemalonu. Nepamirškite, kad gera komunikacija tokiose situacijose susideda iš: paaiškinimo, galimų sprendimo būdų, laiko apimties. Kaip **Interneto Vizija komunikavo šioje situacijoje - puikus pavyzdys ko nedaryti**.

Būtinai turėkite **monitorinimo sistemą**. Ne Interneto Vizija mane pakėlė anksti ryte - bet mano paties monitorinimo serveris. Monitorinkite viską ką tik galite.

Tvardykitės. Rėkti į ragelį gali visi. Piktai rašyti laiškus - gali visi. Turite būti **ne aiškintojais**, o **problemų sprendėjais**.
