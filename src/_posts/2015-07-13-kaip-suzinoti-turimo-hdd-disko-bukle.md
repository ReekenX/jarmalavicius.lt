---
title: Kaip sužinoti turimo HDD disko būklę
category: atviras-kodas
image: i/placeholder.jpg
description: HDD disko buklės patikrinimas gsmartcontrol pagalba. Kaip įdiegti, kaip patikrinti ir ką galima iš to surasti.
---

Natūralu, kad nuolat dirbant kompiuteriu jo dalys po truputį dėvisi. Dauguma (jei ne visi) kompiuterio komponentai turi savo gyvenimo trukmę.Neseniai susidūriau su per stipriai suletėjusio disko bėda. Gal ir nieko keisto, nešiojami kompiuteriai, dažniausiai, turi žymiai lėtesnį kietajį diską nei stacionarūs. Kalbu apie pasenusius HDD, ne greituosius SSD.Linux duoda keletą įrankių pasitikrinti savo HDD būklę. Galima įdiegti `gsmartcontrol` GUI programą ir greitai ir lengvai pasitikrinti diską. Nepatyrusiems šiuose dalykuose rekomenduočiau ją įsidiegti, nes jos išvestyje galėsite pamatyti ką reiškia kai kurie būsenų statusai.![GSmartControl programa](/i/gsmartcontrol.png)Ją įdiegti Debian sistemose galima šia komanda:```
    apt-get install gsmartcontrol
```O neturint galimybių arba nenorint diegti GUI programos, užteks pasinaudoti `smartctl` komanda. Pavyzdžiui raskime pažeistus sektorius:```
    smartctl -a /dev/sda    smartctl 6.2 2013-07-26 r3841 [x86_64-linux-3.13.0-54-generic] (local build)
    Copyright (C) 2002-13, Bruce Allen, Christian Franke, www.smartmontools.org    [..]    SMART Attributes Data Structure revision number: 16
    Vendor Specific SMART Attributes with Thresholds:
    ID# ATTRIBUTE_NAME          FLAG      TYPE      UPDATED  WHEN_FAILED RAW_VALUE
      1 Raw_Read_Error_Rate     0x002f    Pre-fail  Always       -       1
      3 Spin_Up_Time            0x0027    Pre-fail  Always       -       1958
      4 Start_Stop_Count        0x0032    Old_age   Always       -       22190
      5 Reallocated_Sector_Ct   0x0033    Pre-fail  Always       -       8
      7 Seek_Error_Rate         0x002e    Old_age   Always       -       0
      9 Power_On_Hours          0x0032    Old_age   Always       -       19639
     10 Spin_Retry_Count        0x0032    Old_age   Always       -       0
     11 Calibration_Retry_Count 0x0032    Old_age   Always       -       0
     12 Power_Cycle_Count       0x0032    Old_age   Always       -       4934
    191 G-Sense_Error_Rate      0x0032    Old_age   Always       -       12765
    192 Power-Off_Retract_Count 0x0032    Old_age   Always       -       559
    193 Load_Cycle_Count        0x0032    Old_age   Always       -       1486756
    194 Temperature_Celsius     0x0022    Old_age   Always       -       38
    196 Reallocated_Event_Count 0x0032    Old_age   Always       -       2
    197 Current_Pending_Sector  0x0032    Old_age   Always       -       0
    198 Offline_Uncorrectable   0x0030    Old_age   Offline      -       0
    199 UDMA_CRC_Error_Count    0x0032    Old_age   Always       -       0
    200 Multi_Zone_Error_Rate   0x0008    Old_age   Offline      -       0
    240 Head_Flying_Hours       0x0032    Old_age   Always       -       18501
    241 Total_LBAs_Written      0x0032    Old_age   Always       -       45449537240
    242 Total_LBAs_Read         0x0032    Old_age   Always       -       57731698047
    254 Free_Fall_Sensor        0x0032    Old_age   Always       -       0    [..]    If Selective self-test is pending on power-up, resume after 0 minute delay.
```Išvestis gana didelė ir teks pasikonsultuoti su `man smartctl` arba tiesiog `gsmartcontrol` GUI programoje (joje ši informacija pateikta prie kiekvienos eilutės).Vienas svarbiausių punktų yra `Reallocated_Sector_Ct` kuris nusako kiek perskirstytų sektorių yra Jūsų diske. Kada diskas geros kokybės, šis skaičius turėtų būtų 0 (jokių pažeistų sektorių). Kai skaičius didesnis - blogai. Šis skaičius nereiškia, kad tai sugadinti fiziškai sektoriai, tačiau puikus požymis, kad kažkas gali būti blogai. Apie tai kaip surasti kaltininkus teks pasikonsultuoti su `man smartctl` arba laukti kitų straipsnių.Ši programa duoda ir daugiau galimybių, kaip pavyzdžiui HDD disko testavimą. Tačiau apie tai - kituose straipsniuose.
