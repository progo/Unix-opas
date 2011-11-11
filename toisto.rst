Toistorakenteista
=================

Tässä luvussa puhelemme joitain alkeita toistuvista operaatioista, joilla
sujuvoitat työtä useiden samankaltaisten tiedostojen parissa.

Kertaus jokereista
------------------

Kuten varmasti tiedämmekin jo, useimmat ohjelmat pystyvät käsittelemään useita
tiedostoja samalta komentamalta. Esimerkiksi seuraavat kaksi sarjaa ovat
samat::

    $ rm toisto.txt bmw.jpeg

::

    $ rm toisto.txt
    $ rm bmw.jpeg

Mutta mitä on tarkalleen ottaen komentaa `rm *.txt`? Ehkä muistanemme, että
`rm` tai mikään muukaan ohjelma varsinaisesti ei itse tee asteriskin
aukipurkamista. Sen tekee shell::

    $ ls
    a
    b
    c

    $ echo kaikuu...
    kaikuu...

    $ echo *
    a b c

Jos komentaisimme tässä hakemistossa `rm *`, niin shell tekee asteriskin
purkamisen ensin pois, ja sitten vasta kutsuu käskytettäviä ohjelmia.
Edellisessä esimerkissä kaiutettiin `echo`-ohjelman avulla kaikki annetut
argumentit sellaisenaan takaisin. Näemme, että `bash` on tehnyt tehtävänsä
purkaessaan auki tähden.

Asteriski eli tähtihän tarkoitti mitä tahansa lukumäärää merkkejä (eli
nolla merkkiä tai enemmän). Kysymysmerkki korvaa mielivaltaisen yhden merkin.
Miksikö asteriski korvaa myös nolla merkkiä? Vaikka dosissa asia oli toisin,
unixeissa on usein tiedostoja ilman päätteitä, ja on kiva käyttää asteriskia
niiden, sekä päätteellisten että päätteettömien, hakemiseen::

    $ ls
    foobar.txt
    teksti.txt
    teksti.txt.bak
    kauppa.doc
    $ ls teksti.txt*
    teksti.txt
    teksti.txt.bak

Hyvän Unix-käytännön mukaan kirjoitetut ohjelmat hyväksyvät aina useampia
tiedostoja samaan komentoon, jos se vain on järkevää ohjelman luonteen
kannalta. Silloin jokerimerkkejä voidaan käyttää sujuvasti shellin kautta
nopeuttamaan askareita.

Jos kuitenkin ohjelma ei syystä tai toisesta tue kuin yksittäisten tiedostojen
antamista kerrallaan, joudutaan turvautumaan toistosilmukoihin.

Toistoa
-------

Huonosti käyttäytyvien ohjelmien lisäksi on ihan hyvinkäyttäytyviäkin
ohjelmia, joissa ei sinällään ole järkeä käsitellä useita tiedostoja kerralla.
Shelleissä käytettävä `for`-rakenne on hyvin tehokas tapa yhdistää
jokerimerkkejä ja useita tiedostoja sellaisiin ohjelmiin, jotka käsittelevät
yhden tiedoston kerrallaan.

For-silmukka on moniosainen, ja kirjoitetaan usein monelle riville. Perusmalli
on seuraava::

    for nimi in a b c ...
    do
        # komentoja tähän, joissa käytetään nimeä $nimi
    done

Tämähän alkaa muistuttaa vähän sitä ohjelmointia, mutta ei hätää. Tässä on
kyllä monta liikkuvaa osaa, joiden kanssa pitää olla vähän tarkkana. Rakenteen
toinen sana, eli *nimi*, on vapaavalintainen muuttujanimi. Siihen muuttujaan
vaihdetaan vuorollaan uusi alkio listasta `a b c ...`. Lista voi olla
mielivaltaisen pitkä, ja alkiot erotellaan yksinkertaisesti välilyönnein.

Sen jälkeen `do`- ja `done`-komentojen väliin kirjoitellaan komentoja, jotka
mielellään hyödyntävät tätä muuttujaa. Siihen viitataan asettamalla
dollarimerkki nimen eteen.

Esimerkki toivottavasti valottaa paremmin::

    $ for kuukausi in tammi helmi maalis
    do 
    echo "$kuukausi"kuu
    done

    tammikuu
    helmikuu
    maaliskuu

Silmukan suoritus alkaa heti kun `done` lyödään sisään. Esitystä voi tiivistää
hieman::

    $ for kuukausi in tammi helmi maalis
    do echo "$kuukausi"kuu ; done

Ajaa saman asian, mutta vain kahdella rivillä. Ketjuttaa toki saisi myös nämä
kaksi riviä asettamalla yhden puolipisteen lisää ennen `do`-lausetta.

No nyt sitten niihin jokerimerkkeihin: silmukassa voit antaa shellin muodostaa
sinulle listan, jota käytetään muuttujassa. Tavalliset jokerimerkit
riittävät::

    $ ls
    a
    b
    c
    $ for tiedosto in *
     do echo "$tiedosto"
    done

    a
    b
    c

Kas näin. Nyt suosittelen aina ympäröimään muuttujaviittaukset lainausmerkein,
koska muuten eräs merkki sotkee suoritusta aika pahasti: välilyönnit
tiedostonimissä.  Asiasta ei tarvitse erikseen tehdä mitään sääntöjä, kunhan
käyttää lainausmerkkejä aina kun käyttää jokerimerkkejä.

Otetaan käytännön esimerkki, jossa `for`-silmukoihin on turvauduttava.
Olemme ottaneet digikamerasta liudan valokuvia, ja ne kaikki pitäisi pienentää
nettijakelua varten. Tätä varten oletamme erinomaisen Imagemagick-paketin
olemassaoloa systeemissä.

Imagemagick-paketin käytetyin työkalu lienee nyt haluttu `convert`, joka
käsittelee kuvatiedostoa eritavoin. Huomioitavinta on se, että `convert`
käsittelee yhden tiedoston kerrallaan. Emme voi siis kehitellä mitään `convert
*` -sarjaa itsellemme, vaan käytämme `for`-silmukkaa apunamme. Ensin on hyvä
tutkia, miten pienentäisimme yhden yksittäisen kuvan. Kaavaa emme opettele
täyteläisesti, koska tämä ei ole kuvankäsittelyopas, mutta yleissääntönä
pienennös tehtäisiin näin (loput `man convert`)::

    $ convert kuva.jpg -resize 50% pienennetty.jpg

Ensin lähdetiedosto, sitten muutostoimet, ja lopuksi kohdetiedosto. Voimme
syöttää silmukassa nyt lähdetiedoston paikalle muuttujanimen ja
kohdetiedostoja varten luomme uuden hakemiston, ettei mene mikään sekaisin.

::

    $ ls
    IMG2304.JPG
    IMG2305.JPG
    ...
    IMG2393.JPG
    $ mkdir pienennetyt
    $ for kuva in *.JPG
    do  convert "$kuva" -resize 50% pienennetyt/"$kuva"
    done

Ja Unix-filosofia on jälleen osoittanut kyntensä.  Tekemällä ohjelman,
joka tekee yhden asian hyvin, päästään pitkälle. Ei tarvita erikseen ohjelmaa
tekemään peräkkäissuoritusta (kuten kaupallisten kuvankäsittelyohjelmien
*batch processing* -toimintoja) kun shell osaa homman. `convert`:in ei
tarvitse tietää mitään sadoista kuvista!

`seq`
.....

Esitellään sivumainintana apuri `seq`, joka tekee jonoja (*sequence*).
Tavallisesti se olisi kovin tylsä ohjelma::

    $ seq 1 5           # luvut 1-5
    1
    2
    3
    4
    5
    $ seq 2 2 10        # parilliset luvut 2-10
    2
    4
    6
    8
    10

Mutta ehkäpä arvannemme jo. Silmukoissa sillä voi olla käyttöä enemmän.
Nimittäin ohjelmien tulosteita voi käyttää `for`-silmukan listan tekemiseen::

    $ for i in `seq 1 10`
    do echo $i ; done
    1
    2
    3
    4
    5

Listan generoiva ohjelma kääritään takapilkkuihin (*backtick*) ja se kelpaa
`for`:lle sellaisenaan. Itse asiassa mikä tahansa muukin ohjelma kelpaa
samalla tavalla syötteentekijäksi `for`:lle. Riittää, että se ohjelma tuottaa
tyhjällä (väli, tabi tai rivinvaihto) eroteltua tekstiä. Sitä voidaan jopa
filtteröidä tavalliseen tapaan::

    $ for i in `seq 100 | grep ^2` ; do echo $i ; done
    2
    20
    21
    22
    23
    24
    25
    26
    27
    28
    29

Eli kaikki kakkosella alkavat luvut päätyvät `for`:lle asti `grep`:in ansiosta.
