---
title: Kai tingisi skaityti manual puslapius
category: atviras-kodas
image: i/user_manual.jpg
description: Taupykite savo laiką ir neskaitykite man puslapių. Skaitykite jų vykdymo pavyzdžius su tldr komanda!
---

Kiekvienas programuotojas (arba informacinių technologijų fanas) tikriausiai ne kartą skaitė `man` puslapius vienai ar kitai komandai. Dažnai nutinka, kad dirbti reikia kuo greičiau, o per naujo skaityti `man` puslapius nėra laiko.Tuo labiau, kai Linux komandos dažnai nebūna vienodo formato. Pažiūrėkite į `find` komandą. Jeigu teko ją daug naudoti - žinosite, kad joje itin svarbus komandos argumentų eiliškumas.Paprastesnis būdas daryti darbus Linux terminale yra naudoti `tldr` komandą. Programos nebūtina diegti. Taigi, jeigu sėdite ant kokio Chromebook'o, ant kurio nesinori diegti paketų, galima pasinaudoti [web puslapiu](https://tldr.ostera.io/).Ką ši komanda daro? Vietoje nuobodžių tekstų ir didelio turinio pateikia pavyzdines komandos panaudojimo eilutes su trumpais komentarais:![Komandos tldr pavyzdys su dd komanda](/i/tldr_dd.png)Nežinote kokia eilės tvarka komandos argumentus parašyti, kad suarchyvuoti failus arba išarchyvuoti vieną ar kelis failus iš archyvo? Pasinaudokite [tldr](https://tldr.ostera.io/tar).Dar naudingiau šią komandą turėti terminale. Įdiegti galite labai paprastai. Instrukcijos tiesiai iš [oficialaus github puslapio](https://github.com/tldr-pages/tldr):```
npm install -g tldr
```Ir tuomet galite rašyti `tldr <jūsų komandos pavadinimas>`.Pavyzdžiui: jeigu tenka tik kartą per mėnesį naudotis `dd` komanda, bus lengva pamiršti kur ir ką rašyti. Su `tldr` bus labai paprasta (žr. nuotrauką aukščiau).Kartais bus naudinga atnaujinti komandų trumpinių duombazę su:```
tldr --update
```