Pakkaus ja purkaminen
=====================

Winzipit ja -rarit ovat kivoja ohjelmia, mutta eivät oikein toimi ilman
graafista ympäristöä. Erityisesti ongelmallista on päivitysten hakeminen
veppipalveluihinsa, jos ainut tuntemansa keino on lähetellä tiedostot
yksitellen kotikoneeltansa palvelimelle. Se on hidasta ja voi tuottaa uusia
ongelmia esimerkiksi väärien tai hankalien oikeuksien kanssa.

Unixeissa yleisin tapa koostaa useita tiedostoja yhteen tiedostoon on `tar`,
eli *terva*. Useinhan toisiinsa tervatut esineet tuppaavat pysyäkin yhdessä.
Tätä varten on ohjelma `tar`, jolla tehdään niinsanottuja tervapalloja
*tarball*. Päätteenä käytetään yleensä `.tar`-päätettä. Toisin kuin Dos- ja
Windows-maailmasta tuttu `ZIP`-formaatti, tervapallot eivät ole millään
tavalla pakattuja tiedostoja. Yksinkertaistaen `tar` lyttää kaikki saamansa
tiedostot peräkkäin pallon muotoon.

Mutta yleensä tätä pakkaamatonta tervapalloa sitten voidaan pakata, ja
pakataankin. Unix-maailmassa nykyään suosituimmat pakkausalgoritmit (tai
ainakin pakkausohjelmat) ovat `gzip` ja `bzip2`. Näistä kumpikin vastaa noin
zip-tiedostojen pakkaustehokkuutta, bzip2:n ollessa hieman tehokkaampi. Toki
se on myös vähän hitaampi sitten vastapainoksi.

Nämä tar-tiedostot sitten pakatussa muodossa saavat yleensä
(tupla)tiedostopäätteen `.tar.gz` tai `.tar.bz2`. Joskus vanhempina aikoina
nähtiin päätteitä `.tgz` ja `.tbz` vastaavasti.

Tarballin purkaminen
--------------------

Kun tämmöinen pallo sitten jostain ilmoille lentää, se yleensä halutaan purkaa
pois. Ensin on viisasta tutkia, mitä se on syönyt. Puhutaan oikein
tar-pommista, jossa viattoman näköinen pieni tarball sisältää sopivannimisiä
nollamittaisia tiedostoja paljon, ja joka voi tuhota systeemin pahaa
aavistamattoman käsissä. Tähän auttaa kun ensin katsotaan, minkänimisiä
tiedostoja sieltä löytyy::

    $ tar -tf TARBALL

antaa ilmoille listan tiedostoista pallon sisältä. Pitkää listaa varten
kannattanee tuloste putkittaa `less`:ille. Voit halutessasi saada enemmän
tietoja selville tiedostoista antamalla `-v`-läpän tarrille::

    $ tar -vtf TARBALL | less

Huomiollepantavaa on, että asetuksien viivaa ei ole pakko kirjoittaa, jos
annat niitä heti komentorimpsun alussa. Toinen tärkeä huomio on, että `-f` on
**ensiarvoisen ehdoton** lähes kaikissa tapauksissa, joissa tarria yleensä
käytetään. Aina tulee määritellä tiedosto erikseen. Moni menee ainakin
luontivaiheessa vähän sekaisin asetuksien antojärjestyksestä. Sääntö on selvä:
`-f`-flagia tulee aina seurata tarballin tiedostonimi.

Nyt, miten varsinaisesti puramme tarballin? Kunhan sen sisältö on turvallisen
näköistä, voimme purkaa sen `-x` -flagin avulla. Jos (ja kun) kyseessä on
pakattu tervapallo, meidän pitää antaa joko asetus `-z` (gzip) tai `-j`
(bzip2) tarrille, jotta purkaminenkin onnistuu samalla kertaa.

**Oletuksena** tiedostot puretaan työhakemistoon, eli sinne, missä annat
komennon. Kannattaa siirtyä kohdehakemistoon, tai luoda tyhjä
väliaikaishakemisto, ettei tule sotkua. Ja purkamisesta esimerkit::

    $ tar tf /tmp/testi.tar.bz2
    ./foo
    ./bar
    $ ls
    fez
    $ tar xjf /tmp/testi.tar.bz2
    $ ls
    fez
    foo
    bar
    $ tar tf /tmp/testi2.tar.gz
    ./FOO/auto
    $ tar xzf /tmp/testi2.tar.gz
    $ ls FOO
    auto

Siinäpä. Jos tarballin sisällä on alihakemistoja (kuten jälkimmäisessä
esimerkissä), niin ne luodaan kuten kuuluukin.

Voit toki halutessasi määritellä kohdehakemiston, minne `tar` purkaa
tiedostot, mikäli nykyinen työhakemisto ei kelpaa. Tämä on `-C` -flagin
heiniä::

    $ tar xjf testi.tar.gz -C autot
    
Jos tiedostojen alkuperäiset oikeudet ovat tärkeät, käytetään `-p` -asetusta
(preserve permissions). Tämä voi joissain web-sovelluksissa olla tärkeä.

Tarballista voit myös purkaa vain osan tiedostoista. Tämä on aika työlästä
ihmisen kirjoiteltavaksi, mutta jos tiedät tarkan tiedostonimen (helpoiten
kopioitavissa `tf`-tulosteesta), niin voit antaa sen komennon loppuun. Tar
tulee purkamaan vain sen tiedoston. Myös erilaiset jokerimerkit onnistuvat
tietyissä puitteissa, tutustu tarin manpageihin.

Jos saamasi paketti loppuu päätteeseen `.tar`, voi olla, että sitä ei ole
pakattu millään. Voit ensin koettaa `file`-ohjelman avulla tutkia
pakkaamattomuutta. Tai sitten voit kokeilla ensin `-z`-flagin kanssa purkaa.
Gzip on kuitenkin se yleisempi tapa pakata. Tar kyllä ilmoittaa kovaäänisesti,
jos valitsemasi purkumenetelmä ei tepsi.


Pakkaaminen, eli tarballien luominen
------------------------------------

Käytämme purkuflagin sijaan `-c` (create) -flagia. Edelleen flagi `-f` on
oltava! Lista tiedostoista annetaan lopussa rimpsuna. Voit antaa yksittäisiä
tiedostonimiä tai sitten hakemistoja, tai useita hakemistoja. Tai erilaisia
kokonaisuuksia. Esimerkki valaisee parhaiten::

    # työntää koko hakemiston autot pakettiin
    $ tar cjf paketti.tar.bz2 autot/
    # luennot-paketti sisältää maanantain ja tiistain materiaalit.
    $ tar czf luento.tar.gz luennot/ma.pdf luennot/ti.pdf

Edelleen `-p` toimii, jos tiedostojen oikeudet ovat merkitykselliset. Kuten
huomaat, voit valita pakkaustavan samoilla asetuksilla kuin purettaessa. Ja
tiedostonimi on määrättävä. Jos se tuntuu luontevammalta, voi toki paketin
nimen antaa vasta viimeisenä näin::

    $ tar cj pe.pdf la.pdf -f pitkäviikonloppu.tar.bz2

Entä zipit?
-----------

Vaikka `tar` onkin Unix-puolen *de facto* -pakkausmuoto, on joskus avattava
niitä zippejäkin. Useimmissa Unix-systeemeissä on ohjelma `zip` pakkaamaan ja
`unzip` purkamaan zip-tiedostoja.

Kuten odottaa saattaa, samanlaiset toiminnot löytyvät täältäkin kuten tarrin
ympäriltä. Nämä esimerkit nyt valaiskoot tarpeeksi.

:Listaus:                `unzip -l autot.zip`
:Pura tänne:             `unzip autot.zip`
:Pura muualle:           `unzip autot.zip -d Autot`
:Pakkaus:                `zip autot.zip Mersu.png Bmw.jpeg`
