---
title: Duomenų šifravimas su ssh viešu raktu
permalink: /atviras-kodas/duomenu-sifravimas-su-ssh-viesu-raktu
category: atviras-kodas
image: i/sifravimas.jpeg
description: Privačių duomenų šifravimas su ssh viešu raktu. Naudinga, kada nenori per daug rūpintis GPG šifravimo reikalais.
---

Nesu GnuPG (dar žinomo kaip GPG) mylėtojas, todėl šiame straipsnyje greitai parodysiu kaip užšifruoti kažkokius duomenis turint (gavus) žmogaus viešą raktą.

Viešasis ssh raktas, toks kaip manasis, kurį galite parsisiųsti [iš Launchpad](https://launchpad.net/~reekenx/+sshkeys) yra netinkamas  `openssl` programai, todėl teks susgeneruoti atitinkamo formato raktą-sertifikatą.

Tai galima padaryti su `openssl` komanda:

```
    openssl rsa -in ~/.ssh/id_rsa -out /tmp/viesas_raktas.pub -outform PEM -pubout
```

Būsite paprašytas įvesti savo privataus rakto slaptažodį jeigu tokį turite. Mano sugeneruoto rakto turinys:

```
    -----BEGIN PUBLIC KEY-----
    MIICIDANBgkqhkiG9w0BAQEFAAOCAg0AMIICCAKCAgEAyul8GjRteUYK7fSqKYEI
    q1yQasYROEfqBe13gPmYiXscmduK/VqlMfyj39F+3r7MvMHsnA9TA03oJi521cjX
    bi8KeFYLmyzJr0zZrb/pUo1txzeEDP6nPG7pDen4lDX7Sgcn9t6aqfxG8XvZ58Ge
    /eAQw0Gxunz3Dw1/JrOXE4B0R2bKODBV4QFPZXUA+BZF5X5Lmc9JILHef25hvBQR
    rgpyKz6p5nvGyiBFX+KvWe8DFKtX9JkMG1toKYjHv/CycCCY7SJMDIigPZ5+EaRT
    HKyHl2i43uRdu89/2UD06+6dcLOAlThVnqghVKH+Empm3Ot349V9vhCiyAHFohHi
    OXmxLpsO2q5mY0ciiMEMTChSf3EnkFGi9OyhGf8by4EelSpg9S9X+wKdfe/Mq/jD
    FTCxl8I13O9u0zwxJtpsKAMnrxP8UT3zuIU83+YPPvTJqGxIqybgb8/aCnViaMi3
    xXhnikiJ0U3V2GuJPHCv1BOSfx+Paa6V5tgk7bVkrwIA1fgTGweExDRudgCN/Vzp
    OiMYipvWu815tRc1x3ahZhLjBvMq/0z3iM5GBwRBE4j6GgBxxK+Ojf6+bXwdRF1K
    VS+FO5yyZG9SNfKkNHlZztQG+g3h6Uvxgl30U5eZrHAcgYncOYaMXG4PWLehLQBR
    XM8hX01gV+tv8SChFxIfmNMCASM=
    -----END PUBLIC KEY-----
```

O dabar, imkimės šifravimo darbų!

Pradžiai turėkime ką užkoduoti. Tam galime panaudoti kokį nors jau seniai
turimą failą. Kaip pavyzdį tokį galime lengvai susikurti:

```
    echo 'Mano slapta žinutė čia.' > /tmp/failas.txt
```

Ir užkoduokime žinutę:

```
    openssl rsautl -encrypt -inkey /tmp/viesas_raktas.pub -pubin -in /tmp/failas.txt -out /tmp/uzkoduotas_failas
```

Programa `openssl` sukurs užkoduotą failą /tmp/uzkoduotas_failas kurį galima bus atsikoduoti tik turint privatų raktą (tokį, kurį turite tik Jūs). Tą galima pasidaryti taip:

```
    openssl rsautl -decrypt -inkey ~/.ssh/id_rsa -in /tmp/uzkoduotas_failas -out /tmp/atkoduotas_failas
```

Dešifravimui būsite paprašytas įvesti savo privataus rakto slaptažodį jeigu tokį turite.

Atspausdinkime atkoduoto failo turinį:

```
    cat /tmp/atkoduotas_failas
```

Ir gausime:

```
    Mano slapta žinutė čia.
```

Tikrai paprasta, greita ir sakyčiau patogu!
