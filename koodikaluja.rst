Kehittyneitä työkaluja
======================

Tiedostojen kanssa on niin helppoa työskennellä, koska ne ovat aina
samanlaista ihmislukuista massaa. Eräs ohjelmointialan sanonta sopii tähänkin
kontekstiin: 

    On parempi luoda 100 työkalua yhteen tietorakenteeseen kuin tehdä 10
    työkalua kymmeneen eri tietorakenteeseen.

Tässä tietorakenteena voidaan ajatella olevan puhtaan tekstin. Käsitelläänpä
nyt paria työkalua, jotka liittyvät asiaan jotenkin.

`diff`
------

Kahden tiedoston välisiä eroja on joskus tarve ihmetellä. Erityisesti
kun `diff` (*difference*) pystyy näpsäkästi tekemään monenlaisia vertailuja ja
ilmaisuasuakin voi muuttaa.

Tuttavallisesti puhekielessä vain *diffi* on näppärä tapa esittää tekemiään
muutoksia tiedostoihin, kun esitysasusta näkee siististi päällepäin kaiken,
mitä on lisätty tai poistettu. Vaikka diffejä ei tarvitsekaan useasti
ohjelmointihommien ulkopuolella, on hyvä tuntea näiden tekemien tulosteiden
erot ja se, miten diff-filettä luetaan.

Oletusasetuksissa `diff` antaa tunnustetusti huonon koosteen. Oletetaan
seuraavat kaksi testitiedostoa kokeilujamme varten::

    $ cat a
    a
    Lammas, vuohi ja susi.
    Ei näin? Ei koiran voittanutta?
    Onkohan nyt tarpeeksi sisältöä.
    $ cat b
    b
    Lammas, vuohi ja susi.
    Ei koiran voittanutta.
    Onkohan nyt tarpeeksi sisältöä.
    Ei varmaan, mutta ainahan
     sitä voi toivoa.

Vertailu on yleensä järkevää vain, kun valtaosa vertailtavien tiedostojen
sisällöistä on samaa. Näissä on muutamia yhteisiä rivejä, ja oletetaan
vaikkapa tiedostoa `a` muutetun hieman `b`:n suuntaan.

Nyt näiden kahden vertailu oletusasetuksin antaa tiiviin ja epäselvän
syötteen::

    $ diff a b
    1c1
    < a
    ---
    > b
    3c3
    < Ei näin? Ei koiran voittanutta?
    ---
    > Ei koiran voittanutta.
    4a5,6
    > Ei varmaan, mutta ainahan
    >  sitä voi toivoa.

Tulosteessa käytetään hakasia ilmaisemaan lisäystä vasemman- tai
oikeanpuoleisen tiedoston suhteen. Se, että kumpi on vasen ja kumpi oikea,
määräytyy komentoriviargumenttien antojärjestyksestä. Diff antaa lisäksi
kryptisiä ohjaussyötteitä tietokonetta varten. Tämä ei ole pelkästään
ihmiselle hankalaa luettavaa, vaan myös tietokoneella on hankaluuksia soveltaa
tätä tekstiä ilman kontekstia (kts. seuraava kappale). Kokeillaan vähän
parempaa tulostusmuotoa, annetaan diffin kertoa kontekstia, eli muutoksia
edeltäviä ja seuraavia rivejä helpottamaan::

    $ diff -U 3 a b
    --- a   2011-11-21 19:59:19.636191339 +0200
    +++ b   2011-11-21 19:59:38.229524808 +0200
    @@ -1,4 +1,6 @@
    -a
    +b
     Lammas, vuohi ja susi.
    -Ei näin? Ei koiran voittanutta?
    +Ei koiran voittanutta.
     Onkohan nyt tarpeeksi sisältöä.
    +Ei varmaan, mutta ainahan
    + sitä voi toivoa.

Tässä syötteessä annetaan ensin selite, eli annettujen tiedostojen strategiset
mitat, ja samalla symboloidaan ensimmäinen tiedosto miinuksella ja
jälkimmäinen tiedosto plussaksi. Kahden at-merkin ympäröimä kontekstirivi
kertoo sen, että missä mennään: `-1,4` tarkoittaa, että nyt katselemme
tiedoston `a` rivejä 1-4. Vastaavasti `+1,6` tarkoittaa tiedoston `b` rivejä
1-6. Niitä on enemmän merkattu kontekstiin, ja ne näkyvät sitten alla.
Yhteiset rivit ovat ilman miinus- tai plusmerkkiä.

Nyt on jo paljon paremmat eväät nähdä, mitä on *poistettu* ja *lisätty*
versioiden välillä, kun alkuperäisessä puhutaan vain puhtaista eroista
tiedostojen välillä. Flagi `-U` eli *unified* antaa yhtenäisille riveille
sijaa. Se on pitkälti samanlainen kuin `-C` eli *context*. Pieniä
näkemyseroja. Lukuarvona annetaan rivien lukumäärä. Samaa asiaa mutta joskus
kannattaa valita selkeämpi versio. Etenkin kun tietokone lukee kontekstin
avulla diff-filejä paljon paremmin. Siitä seuraavaksi!

`patch`
-------

Diffin käänteistyökalu on `patch` eli jos meillä on alkuperäinen tiedosto ja
sitten jokin difffile olemassa, niin voimme suorittaa käänteisen operaation
tiedostoille. Voisimme luoda edellisen esimerkin tiedostosta `a` tiedoston
`b`, kun tiedämme diffin sisällön. Näitä kutsutaankin sitten patch-fileiksi,
jos tiedostot on erityisesti luotu pätsäystä varten.

Edellisestä esimerkistä suoraan::

    $ diff -U 3 a b > b.patch
    $ patch < b.patch
    $ diff a b
    $

Eli `patch` muutti diff-fileen mukaan tiedoston `a` nyt täsmälleen samaksi
kuin tiedosto `b`. Siksi kolmas diff-komento antoi tyhjää vastaukseksi:
tiedostot ovat samat.

Tämä ohjelma, kun se 80-luvulla kehitettiin, mullisti avointen ohjelmien
levityksen kokonaan. Enää ei tarvinnut uutta versiota varten toimittaa koko
ohjelmaa alusta alkaen, vaan selvittiin parilla kilotavulla. Lisäksi tiedostoa
`a` voi tietyssä määrin muokata tuossa välissä, ja pätsäys voi silti onnistua
sulavasti. Siihen vaikuttaa kontekstirivien määrä. Esimerkissämme olisi
selvitty diffin oletustulosteillakin, mutta `patch` epäonnistuu herkästi jos
olisin muokannut a:ta välissä hieman. Esimerkiksi siten, että rivinumerot
eivät enää pitäisikään paikkansa. Kontekstin tarjoaminen auttaa merkittävästi.

`make`
------

Simppelisti nimetty `make` (tee) tekee tehtäviä reseptien mukaan. Monissa
hommissa, kuten kakunpaistossa, on kullekin tehtävänosalle omia
esivaatimuksia, joiden on täytyttävä ensin. Koska tietokoneiden maailmassa
tehtävät voivat paisua mielivaltaisen suuriksi, on parasta jättää kaikenlainen
tehtävänjako ja esivaatimuksien selvittely tietokoneen puuhaksi. Esittelen
vain ohjelman perusidean, koska teknisempi esittely on aika spesifiseksi
menevää.

Make lukee `Makefile`-nimistä tiedostoa, jossa sijaitsevat kaikki reseptit.
Nämä reseptit eli osatehtävät on kirjoitettu seuraavaan muotoon::

    kohde: esivaatimukset
        tehtävä

Esimerkiksi taloa rakennettaessa voisi olla seuraavanlaisia askareita
määriteltynä::

    sementti:
        sekoita sementtiä

    pohja: sementti
        vala perustus

    porras: pohja sementti
        vala vain

    seinät: pohja
        pystytä seinät

    katto: seinät
        rakenna sekin

    talo: porras katto
        valmista on

Make selvittelee kaikki eri askareet ja hoitaa rekursiivisesti kaikki
esivaatimukset kuntoon ennen kuin ryhdytään tekemään haluttua vaihetta. Jos
käyttäjä komentaisi `make porras` eikä pohjaa olisi vielä valettu, niin Make
tekisi pohjan ensin. Ja tarpeen mukaan sotkisi lisää sementtiä käytettäväksi.
Viimeinen vaihe voi usein olla pelkkä listaus esivaatimuksia eikä mitään
varsinaista työtä tarvitse tehdä. Silloin vain varmistetaan, että Make on
tehnyt kaiken tarvittavan alle.

Make on alunperin kirjoitettu ohjelmoijien työvälineeksi, mutta tätä voi aivan
hyvin käyttää kaikenlaiseen puuhasteluun. Make vahtii sitäkin, että jos jokin
esivaatimuksista on muuttunut (ei kovin yleistä talonrakennuksessa, mutta
tietokoneiden parissa voi esimerkiksi tiedostoa muokata, jolloin se
muuttuukin) niin siitä riippuvat komponentit tehdään uudestaan.

Esimerkiksi tämä opas käyttää Makefileä apunaan tekemään HTML- ja
LaTeX-versiot lähdekielisistä teksteistä. Editorissani ei tarvitse kuin
komentaa `make` ja uusi versio tulla tupsahtaa maailmaan. Maken avulla voisi
myös omista piirusteluprojekteista ottaa nopeasti backupeja tai siistiä
hakemistoa. Makefileeseen voi myös kirjoitella lyhyitä skriptinpätkiäkin ilman
esivaatimuksia, jos ei halua turhaan sotkea hakemistojaan pienillä
koodinpalasilla.
