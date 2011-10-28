Haku päällä
===========

Eli miten hakea ja löytää tiedostoja tietokoneelta. Tarkastelemme kaksi
yleisintä menetelmää etsiä tiedostoja. Toinen on indeksoiva haku, eli se on
nopea tapa hakea, mutta sen pitää koostaa listaa kaikista tiedostoista jossain
siistissä muodossa. Indeksointi vie aikaa ja käytetty indeksi on yleensä
vähintäänkin tunteja vanha.

Toinen tapa on hitaampi malli, jossa käydään järjestelmällisesti kaikki läpi
ja palautetaan osumat listamuodossa. Se ei käytä indeksointia, eli on aina
ajantasalla. Lisäksi voimme tehdä erikoisempiakin vertailuja ja peräti jotain
pientä automatisointia, jolla helpotamme ylläpitotehtäviä.

`locate`
--------

Nopea `locate` sopii käytettäväksi silloin kun:

- ei tiedetä, missä päin systeemiä tiedosto mahtaa majailla
- haetaan tiedostoja vain nimen perusteella

Ohjelmaa on helppo käyttää::

    $ locate clojure
    ... iso lista tiedostoja, joiden nimessä tai 
    ... hakemistopolussa esiintyy sana 'clojure'

Tärkeätä on huomata, että kirjainkoolla on jälleen väliä! Käyttäkäämme yleistä
optiota `-i` poistamaan tämä epäkohta. Tärkeämpi ominaisuus on käyttää
säännöllisiä lausekkeita (flagi `-r`) hakemaan esimerkiksi tietynpäätteisiä
tiedostoja::

    $ locate -ir "clojure.*pdf"
    .../share/apps/RecentDocuments/Programming_Clojure.pdf.desktop
    /home/progo/kirjallisuutta/ClojureinAction.pdf
    /home/progo/kirjallisuutta/Programming_Clojure.pdf
    /home/progo/kirjallisuutta/TheJoyofClojure.pdf
    .../Viestintä/paperit/Multicore_parallelization_in_Clojure.pdf


Esimerkin hakupatterni on usein riittävä tapa rajata tuloksia vain
PDF-tiedostoihin, mutta ollaksemme täydellisiä hakuteksti pitäisi päättää
`$`-merkillä, joka merkitsee rivin loppumista::

    $ locate -ir "clojure.*pdf$"
    /home/progo/kirjallisuutta/ClojureinAction.pdf
    /home/progo/kirjallisuutta/Programming_Clojure.pdf
    /home/progo/kirjallisuutta/TheJoyofClojure.pdf
    .../Viestintä/paperit/Multicore_parallelization_in_Clojure.pdf

Tässäpä kaikki oleellinen, mitä `locate`:n kanssa voi tehdä. Säännöllisten
lausekkeiden alkeet kannattaa tuntea, jotta haun karsiminen helpottuu
oleellisesti. Yleisesti Unix-systeemeissä on kymmeniä tuhansia tiedostoja, ja
yleisillä hakusanoilla tuloksia tulee aika paljon. Siitäkin syystä seuraava
`find` on paikoin näppärämpi tapa hakea.

`find`
------

Hakeminen voi olla hidasta `find`:iä käytettäessä, mutta `find` omaa
takataskussaan paljon tehokkaita toimintoja. Tutkitaanpa vähän ohjelman
mahdollisuuksia vähän kerrassaan.

Huonoin tapa, miten `find`:iä voi käyttää, on panna se `locate`:n huonoksi
tuuraajaksi::

    $ find / -iname '*clojure*pdf'
    /home/progo/kirjallisuutta/ClojureinAction.pdf
    /home/progo/kirjallisuutta/Programming_Clojure.pdf
    /home/progo/kirjallisuutta/TheJoyofClojure.pdf
    .../Viestintä/paperit/Multicore_parallelization_in_Clojure.pdf

Erona on, että tämä haku vie oletettavasti paljon enemmän aikaa
(SSD-kovalevylliset systeemit ehkäpä onnekkaasti selviävät tästäkin nopeasti).
Kirjoittamistakin on enemmän. Hyvänä puolena ehkäpä se, ettei säännöllisiä
lausekkeita tarvitse osata kirjoittaa. Nyt riittää `bash`-shellissäkin tutut
kaksi jokerimerkkiä, eli `*` ja `?`. Ja jos hakuteksti päättyy johonkin niin
se sitten päättyy johonkin. Hakutekstin alku merkitsee tässä tapauksessa
tiedostonimen alkua, eli jos et ole varma, että hakusanasi aloittaa
tiedostonimen, laita tähti varmuuden varalta aivan alkuun.

Yleinen muoto on::

    $ find <hakemisto> -name 'hakusana'

tai::

    $ find <hakemisto> -iname 'kirjainkooton hakusana'

Jälkimmäinen, eli iin sisältävä `-iname` on taas se kirjainkoon
huomiottajättävä versio. Yleisempi näin. Huomattavaa on, että hakemisto pitää
antaa, tai jos ei anna, niin `find` olettaa työhakemiston (joka on sama kuin
`.`).

Pelkkä `find` ilman mitään argumentteja listaa kaikki tiedostot, mitä se
löytää työhakemistosta alaspäin. Jokainen argumentti on siis eräänlainen
rajoitin, filtteri (kuten `grep`) listan karsimiseksi.

Listataan erilaisia hakumääreitä, joita `find` voi käyttää listan
rajoittamiseksi:

+----------------------+----------------------------------------------------+
| Hakumääre            | mitä haetaan                                       |
+======================+====================================================+
| `-type f`            | vain tiedostot                                     |
+----------------------+----------------------------------------------------+
| `-type d`            | vain hakemistot                                    |
+----------------------+----------------------------------------------------+
| `-type l`            | vain symboliset linkit                             |
+----------------------+----------------------------------------------------+
| `-name n`            | tiedostonimellä *n* (kirjainkoko!)                 |
+----------------------+----------------------------------------------------+
| `-iname n`           | tiedostonimellä *n* (ei kirjainkokoa)              |
+----------------------+----------------------------------------------------+
| `-regex r`           | tiedostonimellä *r* (säännöllinen lauseke)         |
+----------------------+----------------------------------------------------+
| `-size n`            | kooltaan *n* olevat tiedostot                      |
+----------------------+----------------------------------------------------+
| `-empty`             | vain tyhjät tiedostot/hakemistot                   |
+----------------------+----------------------------------------------------+
| `-writable`          | kirjoitettavat tiedostot                           |
+----------------------+----------------------------------------------------+
| `-readable`          | luettavat tiedostot                                |
+----------------------+----------------------------------------------------+
| `-executable`        | suoritettavat tiedostot                            |
+----------------------+----------------------------------------------------+
| `-group grp`         | tiedostot, jotka kuuluvat ryhmään *grp*            |
+----------------------+----------------------------------------------------+
| `-owner own`         | tiedostoja, jotka kuuluvat käyttäjälle *own*       |
+----------------------+----------------------------------------------------+
| `-atime n`           | tiedostot, joita on käytetty *n* päivää            |
|                      | sitten*                                            |
+----------------------+----------------------------------------------------+
| `-ctime n`           | tiedostot, jotka on luotu *n* päivää sitten*       |
+----------------------+----------------------------------------------------+

Tässä eivät edes olleet kaikki mahdolliset hakumääreet. Kokoa haettaessa
pätevät säännöt::

    $ find -size +10k     # kaikki yli 10-kilotavuiset tiedostot
    $ find -size -1M      # kaikki alle megaiset
    $ find -size 123c     # kaikki tasan 123-tavuiset

Päivämääriä tarkasteltaessa `+0` tarkoittaa kaikkia yli vuorokausi sitten
tehtyjä muutoksia ja `+1` on vastaavasti yli kaksi vuorokautta sitten.

Näitä edelläolevia voi matemaattisen logiikan rajoissa yhdistellä, tarkat
tiedot: `man find`::

    $ find \( -iname 'foo' -size 100k \) -o -name 'bar'

Hakee joko *foo*-nimiset tiedostot, joiden koko on tasan 100 kilotavua ja
lisäksi *bar*-nimiset. Suluilla voit vaikuttaa järjestykseen.

Näiden ehtojen lisäksi `find` voidaan laittaa tekemään löydetyille
tiedostoille jotain erikoistoimia (manuaalista alaosio *ACTIONS*). Muutamia
yleisesti käytettyjä::

    $ find . -name '*temp*'     -delete     # poista 
    $ find /tmp -iname '*demo*' -ls         # listaa tarkemmat tiedot
    $ find . -iname '*todo*' -exec 'mv {} ~/TEE/ ;' # siirrä hakemistoon ~/TEE

Erityisesti viimeinen, eli vapaamuotoisen komennon suorittava `-exec` on
tehokas pirulainen. Sille voi antaa minkä tahansa tavallisen komennon, jossa
operoitavan tiedostonimen tilanne kirjoitetaan aaltosulut `{}`. Find täydentää
siihen kohtaan löytyneiden tiedostojen nimet, ja suorittaa komennon. Tästä
löytyy vastaava versio `-ok`, joka on kuten `-exec`, mutta kysyy käyttäjältä
varmistuksen *jokaisen* löytyneen tiedoston kohdalla. Sopiva joihinkin
poistotilanteisiin. Käytettäessä `-exec` -komentoa täytyy se päättää
puolipisteeseen, jotta `find` voi varmistua komennon täydellisyydestä. Ja
muutenkin yleensä koko komento on viisainta kääriä yksittäisiin hipsuihin
`''`, jotta suorittava shell ei tee omia muutoksiaan erikoismerkkeihin.  Siitä
syystä esimerkiksi tähtiä sisältävät hakutekstit on käärittävä
lainausmerkkeihin, ettei `bash` pääse itse täydentämään nimiä auki.

Find-ohjelman manuaalisivut ovat esimerkilliset esimerkkien ja selkeyden
suhteen, joten sieltä kannattaa jatkaa lukemistaan. Tämä ohjelma se totisesti
osaa tehdä yhtä sun toista.
