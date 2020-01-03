---
title: Atnaujiname NodeJs versiją
category: atviras-kodas
image: i/nodejs.png
description: Node atnaujinimas neturi būti skausmingas. Kaip atsinaujinti vos keliomis komandomis.
---

Net ir 2018 metais įdiegus `NodeJs` versiją iš `Ubuntu`/`Debian` atviro kodo repozitorijų gausite versiją kuri nors ir stabili, bet yra gerokai pasenusi, kad be problemų galėtumėte dirbti su naujausiais framework'ais.

Pavyzdžiui `Ubuntu 17.04` oficialiose repozitorijose turi versiją 4.7.*. Atnaujinti sisteminę versiją galima iš tiesioginių `NodeJs` saugyklų.

Išvalykime sisteminį kešą (kad kitų komandų diegimo metu negautume senų paketų):

```
sudo npm cache clean -f
```

Įdiekime naujausią `nodejs` versijų valdytoją:

```
sudo npm install -g n
```

Įdiekime naujausią `nodejs` versiją:

```
sudo n stable
```

Nurodykime sistemai vietoje senojo `nodejs` ir `node` naudoti naujajį:

```
KELIAS=/usr/local/n/versions/node;
sudo ln -sf $KELIAS/<VERSIJA>/bin/node /usr/bin/nodejs;
sudo ln -sf $KELIAS/<VERSIJA>/bin/node /usr/bin/node;
```

Versiją po įdiegimo galite pasitikrinti komanda:

```
$ node -v
v9.2.1
```