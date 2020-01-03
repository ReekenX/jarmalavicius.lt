---
title: Kompiuterių administravimas su Ansible
category: mano-projektai
image: i/ansible.png
description: Kaip automatizuoti savo kompiuterių ir serverių priežiūrą nesunkiai su Ansible. Su daugybe Ansible panaudojimo pavyzdžių.
---

Būdamas tinklapių programuotojas (pagrinde) jau porą metų neturiu savo kompiuteriuose LAMP stack'o (taip vadinamas derinys su programine įranga: apache + php + mysql). Ne dėl to, kad PHP programuoju retai, bet tiesiog naujosios technologijos pakeitė požiūrį į kaip turi būti konfigūruojama darbo aplinka.

Iš esmės LAMP'ą pakeitė Docker. Tinklaraštyje galima rasti straipsnių [kaip pasikeisti LAMP'ą į Docker](/docker/kas-yra-docker) arba kaip kai kuriuos elementus pakeisti su juo, pavyzdžiui rašiau apie [Mysql paleidimą su Docker](/docker/praktinis-docker-panaudojimas-su-mysql).

Tačiau anksčiau ar vėliau kiekvienas IT žmogus susidurs su ta pačia problema kurią reikės išspręsti - naujas kompiuteris ar serveris.

Man, turinčiam 4 kompiuterius ir 3 serverius diegimas ir konfigūravimas rankiniu būdu užimtų per daug laiko.

Todėl jau labai seniai sistemų automatizavimą atlieku su Ansible. Kaip visada tokias konfigūracijas būtinai paviešinu savo [Github profilyje](https://github.com/ReekenX/). Taip ir [Ansible konfigūracijas galima rasti Github](https://github.com/ReekenX/ansible-playbooks) platformoje.

Iš esmės turint viename kompiuteryje Ansible paketus aš galiu pilnai sutvarkyti kitas mašinas.

## Ansible diegimas

Ansible įdiegti galima iš paketų valdiklio. Atitinkamai viena iš šių komandų:

```bash
    sudo apt-get install ansible   # Ubuntu
    sudo aptitude install ansible  # Debian
    sudo yum install ansible       # Centos
    sudo dnf install ansible       # Fedora
    sudo brew install ansible      # Jeigu esi turtingas
```

## Ko gali reikėti naujuose serveriuose / kompiuteriuose

Sąrašas būtų begalinis, todėl pademonstruosiu kaip atrodo realus diegimas / konfigūravimas.

Jeigu dirbčiau su diagiakalbyste reikalaujančiais projektais, tai norėčiau visų kalbų sistemoje palaikymo. Jas įdiegčiau taip:

```bash
    ansible-playbook -i 12.34.54.78, locales.yml
```

Kur `12.34.54.78` yra IP adresas. Kablelis reikalingas atskirti „inventorių“ nuo mašinos adreso. Apie tai čia nerašysiu - reikėtų atskiro straipsnio. Komandos gale paduodu konfigūracinį failą kurį esu išdirbęs ir kuriame yra instrukcijos surašytos lokalių diegimui, priklausomai nuo to kokią OS turite.

Priminsiu, kad šį ir kitus failus galite rasti [mano Ansible Github repozitorijoje](https://github.com/ReekenX/ansible-playbooks).

## Praktiniai pavyzdžiai

Noriu, kad nauja mašina turėtų mano [namų katalogo konfigūracijas](https://github.com/ReekenX/dotfiles/):

```bash
    ansible-playbook -i $IP, dotfiles.yml
```

Reikia įdiegti `docker` ir `docker-compose`? Paskaitykite abiejų diegimo instrukcijas - belekiek darbo. O čia, tik viena komanda:

```bash
    ansible-playbook -i $IP, docker.yml
    ansible-playbook -i $IP, docker-compose.yml
```

Tingite tvarkyti Python `Pillow` palaikymą visiem failų formatams? Ranka darant sutvarkyti be StackOverflow - neįmanomas darbas. Bet su viena Ansible komanda:

```bash
    ansible-playbook -i $IP, pil.yml
```

Reikia įrankių programavimui? Priklausomai nuo to kokia kalba dirbate:

```
    ansible-playbook -i $IP, ruby_dev.yml
    ansible-playbook -i $IP, python_dev.yml
    ansible-playbook -i $IP, php_dev.yml
    ansible-playbook -i $IP, javascript_dev.yml
```

Šis ir daugiau konfigūracijų yra mano [Ansible konfigūracijų Github repozitorijoje](https://github.com/ReekenX/ansible-playbooks). Išmėginkite, pasitobulinkite pagal savo poreikius ir liaukitės švaistyti laiką neautomatizuotoms problemoms spręsti.

## Serverių atnaujinimas (video)

Kai Nagios'as praneša, kad vienas ar kitas serveris turi programinės įrangos atnaujinimų, kuriuose ištaisytos saugumo problemos, atnaujinu juos su Ansible:

{% include post_image.html image="/i/ansible_serveriu_atnaujinimui.gif" text="Serverių atnaujinimas su Ansible" %}

Jeigu svarstote automatizuoti savo kompiuterių ir serverių priežiūrą - Ansible tikrai rekomenduoju.
