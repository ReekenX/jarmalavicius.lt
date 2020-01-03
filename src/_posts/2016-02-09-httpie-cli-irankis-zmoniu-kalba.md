---
title: HTTPie - CLI įrankis žmonių kalba
category: atviras-kodas
image: i/httpie_logo.png
description: Straipsnis apie HTTPIe įrankį lengvai atlikti sudėtingas CURL komandas.
---

Programuojant ne kartą teks imti duomenis iš kokios nors API arba tiesiog atlikinėti kokias nors HTTP užklausas. Aišku, į galvą šaus pati populiariausia programinė įranga - `curl`. Nors su ja galima padaryti stebuklus, bet dažnam naudojimui ji yra ganėtinai nepatogi.

Iš pradžių kliūva `curl` komandos argumentų dydis paprastiems dalykams (jis dažniausiai labai ilgas kai tenka paduoti ne vieną duomenį, argumentą ar siųsti kokias nors antraštes), bet dar ir sunku prisiminti kai kuriuos komandinės eilutės argumentų aprašus.

Jeigu šiuo reikalu dirbate dažnai, čia labai stipriai pagelbės [HTTPie](https://github.com/jkbrzt/httpie).

Įdiegti ją labai paprasta (Debian operacinių šeimose):

```
apt-get install httpie
```

Arba bet kurioje kitoje sistemoje galima atsisiųsti tiesiai iš pypi repozitorijos:

```
pip install httpie
```

Tiesa, pastarasis variantas gali būti geresnis, nes didesnė tikimybė gauti naujesnę versiją.

Paprastam turiniui ir antraštėms gauti užteks tik adreso:

```
$ http www.jarmalavicius.lt
HTTP/1.1 301 Moved Permanently
Content-Encoding: gzip
Content-Length: 196
[..]
<html>
[..]
```

Testuojant API (pvz. man ne kartą pravertė testuojant [Trello](https://trello.com/) API) galima paduoti HTTP metodo tipą ir argumentus:

```
http PUT example.org key=value
```

Arba praverčia testuojant formas:

```
http POST example.org username=example
```

Ypatingai patiko debug režimo palaikymas:

```
$ http -v POST example.org key=value | head
POST / HTTP/1.1
Content-Length: 16
Accept-Encoding: gzip, deflate
Accept: application/json
User-Agent: HTTPie/0.8.0
Host: example.org
Content-Type: application/json; charset=utf-8

&#123;"key": "value"&#125;

<html>
[..]
```

Žinoma, ir failų įkėlimas į internetą veikia:

```
http example.org < failas.txt
```

Bei failų parsisiuntimas:

```
http example.org/norimas/failas > failas.txt
```

Na, o „killer“ funkcionalumas - galimybė išlaikyti sesijas tarp užklausų. Tiesiog sesijoms vardus duodant. Ypatingai pravers, tokiose svetainėse, kur kartą per dieną būtina užeiti, kad kažką gauti ;)

Kaip [HTTPie](https://github.com/jkbrzt/httpie) veikia, galima patestuoti su atviro kodo interneto paslauga:

```
$ http --session=sesija -a username:password httpbin.org/get API-Key:123
$ http --session=sesija httpbin.org/headers
```

Trumpai tariant [HTTPie](https://github.com/jkbrzt/httpie) puikus, paprastas, lengvai naudojamas HTTP užklausų valdiklis galintis pagelbėti tikrai ne vienam programuotojui tiek testuojant programinę įrangą, tiek ją programuojant. Man sunku būtų įsivaizduoti PHP ar Python interneto projektų ar API testavimą su `curl`. Aišku, tas įrankis ne visai skirtas tokiems dalykams. Bet problemų diagnozavimui `curl` ar [HTTPie](https://github.com/jkbrzt/httpie) yra nepakeičiamas įrankis.
