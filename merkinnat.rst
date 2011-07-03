Merkinnöistä
============

Ennen kuin voimme kunnolla alkaa matkaamme kohti Unix-herruutta, pitää meidän
tietää, mistä puhutaan. Ja millä keinoin.  Tässä oppaassa käytämme luultavasti
melko epäyhtenäistä merkintätapaa erilaisille asioille, mutta käydään
esimerkkejä tässä parhaamme mukaan.


Näppäinyhdistelmät
------------------

Unix-maailma on täynnä näppäinyhdistelmiä: hyvin harva komentoriviohjelma edes
tietää hiirestä. Monet ohjelmista ovat alkujaan kauan ennen kuin ohjainrasiat
yleistyivät. Ja toisaalta tekstin kanssa peuhatessa on muutenkin hiirelle
vähän käyttöä.

Kun esittelemme näppäinkomentoja ja -yhdistelmiä, on käytössä useampi
erilainen merkintätapa. Syyksi valitsen tähän sen, että eri ohjelmistot ovat
luoneet omia, vakiintuneita ilmaisutapoja merkitsemään näppäinyhdistelmiä.
Koska ne eivät ole mitenkään vaikeita omaksua, niin käytän itse niitä
sopivissa tilanteissa eri tavoin. Näistä merkinnöistä voi sen verran sanoa,
että kulmasulkeisiin asetettava on Vi(m)-käyttäjien keskuudessa suosittu tapa, ja
Emacs-puoli sitten suosii sulkeitta esitettävää muotoa.

Ctrl
    Tämä ohjausnäppäin kirjoitetaan tässä oppaassa jollain näistä tavoista::

        <C-h>
        C-h

    Esimerkissä ilmaistiin siis näppäinkomennon `Ctrl-h` painaminen.
Alt (tai Meta)
    Vanhoissa tietokoneissa ei välttämättä ollut Alt-nimistä painiketta, vaan
    puhuttiin *jostain* metasta, joka oli välillä konekohtainen. Tämä
    metanäppäin liittyy Esciin erityisellä tavalla::

        <M-h>
        M-h
        <Esc> h
        ESC h

    Ovat kaikki samaa tarkoittavaa. Ja erityisesti jos käytät jotain
    ssh-ohjelmaa, jonka kanssa Alt-yhdistelmät eivät tunnu menevän perille,
    niin kokeile painaa ensin Esciä, sitten vapautat sen ja painat lopuksi
    muuta yhdistelmää.
Muut erikoisnäppäimet
    Muissa tapauksissa pyrin käyttämään Vim-dokumentaatiossa suosittua tapaa
    esittää kaikki erikoiset merkinnät kulmasulkeissa, siis esimerkiksi
    seuraavanlaisia merkintöjä::

        <CR>
        <Tab>
        <F1>
        <Up>

    `CR` on Enter, eli *Carriage Return*. Siitä en tingi. Muut esimerkeistä
    ovat toivottavasti tuttuja.


Ohjelmien argumentit
--------------------

Komentoriviltä käynnistetään ohjelmat tyypillisesti kirjoittamalla ohjelman
nimi kehotteeseen ja painetaan enteriä. Ohjelmille on hyvin tavallista ottaa
vastaan niinsanottuja argumentteja eli parametrejä. Parametrejä on karkeasti
luokiteltaessa kahdenlaista sorttia:

optiot
    Optiot ovat asetuksia, joilla ohjelman toimintaa säädetään yhden
    suorituskerran ajaksi. Ne annetaan tyypillisesti ensimmäisenä ohjelmanimen
    jälkeen, ja voivat olla joko yhden viivan ja yhden merkin mittaisia (ns.
    *short option*: esimerkki `-a`) tai kahden viivan kanssa olevia pidempiä
    sanoja (*long option*: esimerkki `--add`).
tiedostonimet
    Useimmat ohjelmat ottavat vastaan tiedostoja, joita ne käsittelevät. On
    tavallista antaa tiedostonimet lopuksi. Useimmat ohjelmista ottavat
    enemmän kuin yhden nimen kerrallaan.

Otetaan ensin esimerkki::
    
    $ ls -l hak

Ensimmäisenä on merkintäkäytäntönä käyttää dollarimerkkiä, koska `sh`-sukuiset
shellit, siis valtaosa, käyttävät sitä kehotteessaan. Sitä ei kirjoiteta itse
näkyville, ja se indikoi käyttäjän itse kirjoittamaa tekstiä. Tätä seuraa
sitten yleensä ohjelman antamaa tulostetta. Komentoriviltä käytettäessä näet
itse vastaavanlaista, joten tämän ei pitäisi olla vaikeaselkoista.

Esimerkkimme komennossa on siten kolme osaa, esimerkillisesti yksi kutakin:
ohjelman nimi `ls`, ja ohjelmalle on annettu kaksi argumenttia: optio `-l` ja
tiedostonimi (hakemistotkin ovat tiedostoja) `hak`.

Yleisempi esimerkki, joka valottaa kahta muuta merkintätapaa::

    $ ohjelma [-a|-b] [-c] [FILE]...

Hakasulkeet `[]` ilmaisevat, että jokin asetus ei ole pakollinen. Sen voi siis
jättää kokonaan pois. Putkimerkki `|` ilmaisee, että annetuista asetuksista
vain toisen saa kerralla antaa. Kolme pistettä FILE-argumentin jälkeen
tarkoittaa, että voit halutessasi antaa enemmänkin tiedostonimiä. Koska
`FILE` on hakasulkeissa, ei ole pakko antaa yhtäkään tiedostonimeä. Tämän
esimerkin ohjelmalle ei ole kokonaisuudessaan pakko antaa yhtään mitään, koska
kaikki on hakasulkeissa. Kertauksen vuoksi:

`ohjelma FILE`
    ottaa tasan yhden tiedoston
`ohjelma [FILE]`
    ottaa vastaan 0-1 tiedostoa
`ohjelma FILE...`
    ottaa yhden tai useamman tiedoston
`ohjelma [FILE]...`
    ottaa mielivaltaisen määrän tiedostoja

Vielä yksi huomio: useamman lyhyen asetuksen voi halutessaan yhdistää yhden
viivan taakse. Seuraavat kaksi komentoa  tekevät saman asian::

    $ ls -l -a -h
    $ ls -lah

Saatamme palata argumenttien semantiikkaan myöhemmin oppaassa, mutta tässäkin
taisi olla jo tuhti annos ah niin vaikeata kielioppia.
