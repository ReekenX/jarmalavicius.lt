---
title: Docker konteinerių monitorinimas su CAdvisor
category: docker
image: i/cadvisor.png
description: Kaip monitorinti Docker konteinerius su docker stats ir CAdvisor. Kokią informaciją galime gauti iš šių?
---

Kaip Linux'ai turi populiariuosius `top` arba `htop`, taip ir Docker turi ne vieną monitorinimo galimybę.

Dockeryje integruota komanda `docker stats` kuri gali parodyti tokią informaciją:

    CONTAINER           CPU %               MEM USAGE / LIMIT     MEM %
    cfde60835a60        0.19%               19.79MiB / 7.796GiB   0.25%
    072b20df4039        0.00%               47.99MiB / 7.796GiB   0.60%
    f0f8472aa16d        0.00%               74.02MiB / 7.796GiB   0.93%
    b102eb4871da        0.00%               146.9MiB / 7.796GiB   1.84%
    f9d27274be54        0.00%               57.61MiB / 7.796GiB   0.72%
    a3a0150fc364        0.01%               84.37MiB / 7.796GiB   1.06%
    2d618fc570a7        0.01%               101MiB / 7.796GiB     1.26%
    2d9ce919a48f        0.00%               6.93MiB / 7.796GiB    0.09%
    c33f4ea47585        0.01%               26.95MiB / 7.796GiB   0.34%
    d567dc6d669f        0.11%               6.297MiB / 7.796GiB   0.08%
    49c51b26cc8c        0.01%               95.32MiB / 7.796GiB   1.19%
    ad360d4dea78        0.00%               656KiB / 7.796GiB     0.01%
    26f63800f241        0.06%               273.3MiB / 7.796GiB   3.42%
    42ee0daf4603        0.47%               43.13MiB / 7.796GiB   0.54%
    ebf21865eaf1        0.02%               94.73MiB / 7.796GiB   1.19%
    43e0db76df21        0.01%               888KiB / 7.796GiB     0.01%

Tai labai patogu norint nustatyti ar kuris nors konteineris „nevalgo“ per daug Jūsų sistemos resursų: atminties, CPU laiko, disko naudojimo.

## O jeigu šiai informacijai būtų grafinė aplinka?

Mėgstantiems statistikas stebėti grafinėje aplinkoje (GUI), galima įsidiegti [CAdvisor](https://github.com/google/cadvisor).

Ją išbandyti galima labai greitai ir vos viena komanda:

    sudo docker run \
      --volume=/:/rootfs:ro \
      --volume=/var/run:/var/run:rw \
      --volume=/sys:/sys:ro \
      --volume=/var/lib/docker/:/var/lib/docker:ro \
      --volume=/dev/disk/:/dev/disk:ro \
      --publish=8080:8080 \
      --detach=true \
      --name=cadvisor \
      google/cadvisor:latest

Naršyklėje įrašome `http://domenas-arba-ip:8080` ir pamatysite visą CAdvisor aplinką.

Svarbiausia, kad viskas realiu laiku, todėl naršyklės lango nereikės nuolat naujinti.

Informacijos bus pateikta daug. Pastebėsite, kad daug jos gausite iš standartinės `docker stats` komandos išvesties.

Dar matysite ir grafikus ir kaip naudojami Jūsų sistemos resursai:

{% include post_image.html image="/i/cadvisor_grafikai.png" text="CAdvisor grafinė aplinka" %}

## Kaip išbandyti?

Jeigu tik pradedate naudoti docker ir trūksta idėjų ką su juo daryti, tai patarčiau išmėginti [mano programavimo platformą](https://github.com/ReekenX/docker-for-webdevs) kuri padaryta su Docker. Platformoje rasite apache2, php, mysql, memcached, redis, elasticsearch, postgres. Paketas su populiariausia programine įranga WEB programavimui.

Nebūtina šią platformą naudoti, bet galima panaudoti CAdvisor išmėginimui.
