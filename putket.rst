Virtojen ohjailua ja putket
===========================

Nyt meillä on riittävästi aineksia päästä käsiksi komentorivin todelliseen
taikaan. Tätä ennen olemme pelailleet yksittäisillä ohjelmilla, käsitellen
yksittäisiä tiedostoja. Tämä on yhtä tehokasta, ellei tehokkaampaakin tehdä
graafisin sovelluksin. Seuraava vaihe on oppia Unixin vahvan moniajon eräs
ilmenemä: putket ja syötevirtojen ohjailu. Tämän jälkeen graafiset ohjelmat
jäävät kauas taakse kasattavuudessa.

Unix-ohjelmat ovat, kuten muistanette, kuin legopalikoita. Yksi ohjelma tekee
yhden tehtävän mahdollisimman hyvin. Ja näitä voi kasata, kytkeä peräkkäin,
tekemään monimutkaisempia hommia. Perusohjelmia on kolmea päätyyppiä:

- *Lähteitä* (sources), jotka luovat tietovirtaa tyhjästä.
- *Muuntimia* (transformers), jotka muuttelevat annettua tietovirtaa ja
  lähettävät sen eteenpäin.
- *Altaita* (sinks), jotka laskevat virtaa johonkin päätepisteeseen,
  esimerkiksi tiedostoksi.

Sääntönä on, että kaikki tietovirta, jota ei allastyyppinen ohjelma nappaa,
tulostetaan näkyville näytölle. Tähän sivuoireeseen perustuu ihmisten
suosiossa toimiva lähdetyyppinen `cat`.

Jos tietovirtaus ajatellaan vetenä, niin putkittelun käsite selkeää
toivottavasti. Lähteestä voidaan vetää putki muuntimeen, josta voidaan vetää
uusi putki uuteen muuntimeen, ja lopulta vedetään putki altaaseen. Jos
putkitus ei pääty altaaseen, niin tietovirta päätyy näytölle. Yksittäisen
ohjelman tulopäätä kutsutaan *standard in* -virraksi, tai yleisemmin
`stdin`:ksi. Tulopäätä kutsutaan *standard outiksi* tai `stdout`:iksi.

Valtaosa ohjelmista voi toimia useassa eri moodissa, riippuen siitä, miten
sitä on käytetty. Käsittelemme vanhoja ohjelmia kappaleesta `Tärkeimmät
palikat`_, mutta voimme ehkä käsitellä uusiakin samalla, jos on tarvetta.

Lähteet
-------

Vaikka molemmat `cat` ja `ls` ovat huonoja esimerkkejä lähdeohjelmista
oikeassa käytössä, niin ne ovat lähdeohjelmia, eli ne keräävät jotain annettua
tietoa tiedostosta tai muualta, ja tulostaa tietovirtaan. `cat` voi myös
toimia muuntimena, joka ei tosin tee mitään. `ls` sen sijaan toimii toki
jonkinmoisena lähteenä, joka tietää tiedostonimiä. Kuitenkin tiedostonimiä
varten on paljon parempiakin työkaluja, kuten shellien omat jokerimerkit,
jotka toimivat monessa paikassa.

Hyvä esimerkki lähdeohjelmasta on esimerkiksi `df`, joka raportoi tietokoneen
kovalevyjen tilankäytöstä. Joku vastaava voisi olla esimerkiksi jonkun
kirjoittama skripti, joka raportoi lukemattomien sähköpostien lukumäärän.

Myös vähemmän käytetty lähdevaihtoehto on `less -f`, joka lukee tiedostosta
reaaliaikaisesti kaikki uudet rivit. Vaikka se jääkin pyörimään ikilooppiin,
eikä useimpina hetkinä ole uutta syötettä luettavaksi, ei putki katkea. Tämä
mahdollistaa hienoja kikkoja reaaliaikaisen seurannan suodattamiseksi.

Lähteille tyypillistä onkin, että ne tekevät omia taikojaan, ja tulostavat
vastaavasti jotain jäsenneltyä ulos. Ne voivat kerätä tietoja joko
tiedostoista, tai muualta järjestelmästä. Mitä vain voikaan ohjelma käyttää
hyväkseen...

Muuntimet
---------

Muuntimet ovat tärkein osa putkittelua. Muunnin ottaa tietovirtaa (`stdin`) ja
tekee sille sananmukaisesti jotain muunnoksia. Lopuksi se tulostaa muunnetun
datan ulos `stdout`-virtaan.

Joskus muuntimia kutsutaan suodattimiksi, joka sopii paremmin
vesijohtotermistöön. Suodatintermin puolesta puhuu myös varmasti kaikkein
yleisin muunnin kaikista: `grep`. On aika ottaa putkituksesta ensimmäinen
esimerkki::

    $ cat Stooges.txt 
    Vuosi   Jakso                   Kuka?
    --------------------------------------------
    1950    Studio Stoops           Shemp
    1940    From Nurse To Worse     Curly
    1958    Quiz Whiz               Joe
    1935    Uncivil Warriors        Curly
    1946    Monkey Businessmen      Curly
    1950    Punchy Cowpunchers      Shemp
    1948    Hot Scots               Shemp
    1947    All Gummed Up           Shemp
    1942    Three Smart Saps        Curly
    $ cat Stooges.txt | grep Curly
    1940    From Nurse To Worse     Curly
    1935    Uncivil Warriors        Curly
    1946    Monkey Businessmen      Curly
    1942    Three Smart Saps        Curly

Haimme tiedostosta `Stooges.txt` kaikki Curlyn episodit. Nyt esimerkki on
tarkoituksella samanlainen kuin aiemmin kohdassa `grep`_ esitelty. Syystäkin:
`cat`:in käyttäminen tällä tavalla on täysin turhaa, vaikka siitä ei ole
kamalaa haittaa. Toisin sanoen, `grep` toimii sekä muuntimena että lähteenä.
Muunninkäytössä `grep` on enemmän kuin kotonaan.

Palikkakappaleessa `Tärkeimmät palikat`_ esitellyt ohjelmat kaikki voivat
toimia vastaavalla tavalla sekä muuntimina että lähteinä.  Jos jätät
tiedostonimen pois, niin  ohjelma toimii muuntimena, ottaen tietovirtaa
vastaan. Tätä voit kokeilla ihan komentoriviltäkin. Esimerkiksi lajittelua
voit tehdä ilman tiedostoa. Kirjoitat suoraan `sort`-ohjelman stdin-virtaan
haluamasi asiat. Lopuksi painat `<C-d>`, joka on Unixissa feedin lopetustavu::

    $ sort
    juna
    bussi
    lentsikka
    auto
    <C-d>
    auto
    bussi
    juna
    lentsikka
    $

Vasta kun olet lopettanut kirjailemisen ja ilmoittanut `sort`:lle, että nyt
loppui teksti, niin `sort` lajittelee saamansa syötteen. Todellisuudessa
muuntimet pyrkivät tekemään muunnostöitä riveittäin, mutta `sort` tietenkin
joutuu odottamaan kaiken tiedon. Eihän sitä voi lajitella yhtä riviä
kerrallaan!

`cat` on idioottivarma muuntaja, joka ei tee mitään. Lähettää vain takaisin
kaiken saamansa. Se on vesiputkien termistössä tavallinen putki ilman
muuntimia. Ei siis mikään muunninkaan.

Muuntimia voit yhdistellä mielinmäärin::

    $ grep Shemp Stooges.txt | sort | tail -n 1
    1950    Studio Stoops           Shemp

Tässä `grep` toimii lähteenä ja suodattaa `Stooges.txt`-tiedostosta kaikki
Shempin jaksot. Sitten ne lajitellaan (emme siis lajittele koko tiedostoa,
vaan sen, mitä `grep` antaa) ja lajitelluista jaksoista otamme viimeisen.

Matemaattisessa mielessä muuntimien putkittelu vastaa funktioiden
yhdistämistä. Tätä on lukionkin pitkässä matikassa käyty!

Altaat
------

Altaat tekevät lopun yhdelle putkelle, tarjoavat päätöksen. Yleisimpiä altaita
mahtaa olla `less`, jolla voi lukea muunneltua tai muuten vain pitkää syötettä
mukavasti ohjaten syötettä. Ja `less`:n perään ei voi enää järkevästi laittaa
uusia muuntimia!

Allas voi toki tulostaa jotain tietoja annetusta syötteestä, esimerkkinä `wc`.
Tätä syötettähän voi halutessaan käyttää uutena lähteenä, ja jatkaa
putkittelua. Altaiden määritteleminen on siis hyvin epäselvää.

Eniten käytetty toiminto on varmasti syötevirran ohjaaminen tiedostoon.
Oletuksenahan syötevirta ohjautuu näytölle: tästä shelli pitää huolta. Shellit
tarjoavat kaksi tapaa tallentaa syötevirta tiedostoon: `>` ja  `>>`.  Näillä
on selkeä ero, jota ei kannata unohtaa!

Yksi väkänen, `>` ohjaa tiedostoon ja tyhjentää sen ensin puhtaaksi. Siis mikä
tahansa tiedosto, mihin ohjataan, tulee tyhjenemään täysin.

Kaksi väkästä, `>>`, ohjaa samalla tavalla tiedostoon, mutta lisää tiedoston
loppuun. Eli tämä versio säästää tiedoston vanhat sisällöt. Kummassakin
tapauksessa luodaan uusi, tyhjä tiedosto jos nimellä ei ennestään löytynyt
mitään.

Esimerkkiä::

    $ grep Shemp Stooges.txt | sort | tail -n 1 > katsomista/päivän_stooges.txt
    $ cat katsomista/päivän_stooges.txt
    1950    Studio Stoops           Shemp
    $ grep Curly Stooges.txt | sort | tail -n 1 >> katsomista/päivän_stooges.txt
    $ cat katsomista/päivän_stooges.txt
    1950    Studio Stoops           Shemp
    1946    Monkey Businessmen      Curly

Nyt yksi väkänen varmistaa sen, että `päivän_stooges.txt` on tyhjä. Kuitenkin
kakkosgrepin aikana haluamme *lisätä* katsomislistalle toisen jakson, joten
käytämme tuplaväkäsiä.

Kun tietovirtaa on näin ohjattu tiedostoon, ei se tulosta näytölle mitään.

Uusia muuntimia
---------------

Vaikka `grep`, `sort` ja kumppanit tekevät paljon puolestamme, on vielä paljon
käsittelemättä siitä, mitä muuntimilla voidaan tehdä. Esimerkiksi voimme tehdä
korvaustöitä: tekstit muuntaa toiseen muotoon. Oikein etevä pystyy
suorittamaan esimerkiksi laskutoimituksiakin tiettyjen palstojen kanssa.
Näistä muodostuu Unix-filosofia ja palikoiden kasattavuus.

tr
..

sed
...

awk
...
