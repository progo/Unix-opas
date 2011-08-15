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
ilman, että sitä vertailee muiden kanssa!

`cat` on idioottivarma muuntaja, joka ei tee mitään. Lähettää vain takaisin
kaiken saamansa. Se on vesiputkien termistössä tavallinen putki ilman
muuntimia. Ei siis varsinaisesti mikään muunninkaan.

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
Voimme siis päätellä, että lopullinen "allas" on aina joko jokin tiedosto tai
terminaali itse.

Uusia muuntimia
---------------

Vaikka `grep`, `sort` ja kumppanit tekevät paljon puolestamme, on vielä paljon
käsittelemättä siitä, mitä muuntimilla voidaan tehdä. Esimerkiksi voimme tehdä
korvaustöitä: tekstit muuntaa toiseen muotoon. Oikein etevä pystyy
suorittamaan esimerkiksi laskutoimituksiakin tiettyjen palstojen kanssa.
Näistä muodostuu Unix-filosofia ja palikoiden kasattavuus.

Näistä emme käy mitään syvällisiä katsauksia läpi, koska nämä ovat valtavan
monipuolisia ja pikkujuttuja täynnä olevia sovelmia. Mainituista ohjelmista
ainakin `sed` ja `awk` ovat ansainneet omia opuksiaan, joissa sivuja on
sadoittain. Esittelen muutaman tyypillisen käyttökohteen kullekin näistä
kolmesta ohjelmasta. Loput saat itse miettiä internetin ja manpagejen avulla.

tr
..

Pieni ja sievä ohjelma `tr` (transformer) muuntaa kirjainjoukkoja yhdestä
joukosta toiseen. Manuaalisivulla on lyhyt, mutta sitäkin selvempi kuvaus
kaikesta, mitä tämä tunnistaa oletuksena. Muunnin ottaa vastaan
kirjainjoukkoja, ja muuntaa ne vastaaviksi kirjaimiksi toisesta joukosta.
Esimerkki valaiskoon::

    $ echo "Hei maailma" | tr 'a-z' 'A-Z'
    HEI MAAILMA

Muunnamme `tr`:n avulla kaikki kirjaimet joukosta `a-z` joukkoon `A-Z`, eli
toisin sanoen isoiksi kirjaimiksi. `tr` tunnistaa joitain useinkäytettyjä
joukkoja entuudestaan, joten niitä kannattaa käyttää selvyyden vuoksi aina kun
mahdollista::

    $ echo "tililläni on 12,29 euroa" | tr '[:digit:]' 'x'
    tililläni on xx,xx euroa

sed
...

Ensimmäinen isompi editorimme on armas `sed`, eli *stream editor*. "Stream" on
tässä yhteydessä nyt tietovirtaa, kuten olemme puhuneet kappaleessa. Hauska
ohjelma, jolla on julmetusti käyttöä mitä mielenkiintoisimmissa kohteissa.
Tavallisesti `sed`:iä käytetään simppeleihin *search-replace*-operaatioihin::

    $ echo "tililläni on 12,29 euroa" | sed -e "s/on/ei ole/g"
    tililläni ei ole 12,29 euroa

Ideana on siis, että kullekin syötevirran riville sovelletaan joukkoa
erilaisia tekstinkäsittelykomentoja. Nämä komennot ovat peräisin vanhasta
editorista `ed`, mutta niitä on vähän paranneltu tähän käyttöön sopivaksi!
Näitä komentoja ovat klassinen `s`, eli *substitute*. Sille annetaan ensin
haettavat merkkijonot, ja sitten sille annetaan korvaava teksti. Erotinmerkit
tulee muistaa laittaa mukaan! Viimeinen `g`-kirjain ilmaisee, että haluamme
hakea rivin kaikki ilmentymät sanasta "on": ilman geetä vain ensimmäinen
on-sana korvataan.

`sed` noin yleisesti ottaen osaa tehdä kaiken saman, mitä `tr` :kin::

    $ echo "tililläni on 12,29 euroa" | sed -e "s/[[:digit:]]/x/g"   
    tililläni on xx,xx euroa

Koska `sed` käyttää monipuolisempia säännöllisiä lausekkeita, on merkkiryhmien
käyttäminen hieman erilaista kuin `tr`-esimerkissämme.

`sed` osaa myös jäljitellä `grep`:in toimintaa. Ja myös käänteisen grepin.
Esimerkiksi voimme jättää Shempin jaksot pois Stooges-listauksestamme::

    $ sed -e "/Shemp/d" Stooges.txt
    Vuosi   Jakso                   Kuka?
    --------------------------------------------
    1940    From Nurse To Worse     Curly
    1958    Quiz Whiz               Joe
    1935    Uncivil Warriors        Curly
    1946    Monkey Businessmen      Curly
    1942    Three Smart Saps        Curly

Sama efekti siis kuin `grep -v`:n kanssa.

Kun emme ole tekemässä search-replacea (eli substituutiota), niin olemme
käyttämässä yllä esiteltyä muotoa `/pattern/komento`. Tässä tapauksessa
komento on `d`, eli *delete*. Peruskäyttöä ajatellen `sed` on parasta jättää
tähän substituointiin. Sopivia käyttökohteita toki löytyy vaikka millä
mitalla, mutta erikoisaiheet sopinee luettavaksi omista kirjoistaan. 

awk
...

Hyvin hyödyllinen ohjelma on `awk`, kun käsittelemme taulukkomuotoista dataa.
Tämä `awk` kun ottaa syötteensä riveinä, ja jakaa ne soluiksi. Näillä soluilla
voidaan tehdä sitten hyvin paljon erilaisia operaatioita: Awk on hyvin
monipuolinen kieli, joka on käytännössä kevennetty Perl, hyvin C-sukuinen
kieli.

Käyttämämme esimerkkitiedosto `Stooges.txt` on toisaalta `awk`:lle hankalaa
syötettä, koska jaksojen nimet menevät sekaisin helposti. Mutta jos haluamme
kaivaa vaikkapa vuosilukujen listauksen, niin `awk` on kätevä::

    $ awk '{print $1}' Stooges.txt  |tail -n 4
    1950
    1948
    1947
    1942

`awk`:ssa kenttiin viitataan `$numero` -merkinnällä. "Nollas" kenttä on koko
rivi sellaisenaan. Viimeinen kenttä rivillään on `$NF`. Voisimme katsoa siten
Stoogesien vaihtelevat nimet tällä tavalla::

    $ tail -n +3 Stooges.txt|awk '{print $NF}'
    Shemp
    Curly
    Joe
    Curly
    Curly
    Shemp
    Shemp
    Shemp
    Curly

Tärkein `awk`-komento on luonnollisesti `print`. Helppoa on myös yhdistellä
kenttiä ja muotoilla tulostusta kuten haluaa::

    $ tail -n +3 Stooges.txt|awk '{print $1 ", " $NF}'
    1950, Shemp
    1940, Curly
    1958, Joe
    1935, Curly
    1946, Curly
    1950, Shemp
    1948, Shemp
    1947, Shemp
    1942, Curly

Awk on peto kaikenlaisen CSV-muotoillun datan kanssa. Se osaa myös laskea
asioita yhteen, joten se on hyvin sulava työkalu mihin tahansa, missä on
selkeästi määriteltyä taulukko- tai listatavaraa. Oletetaan seuraavanlaista
yksinkertaista CSV-dataa::

    $ cat data.csv
    2008, 45, -120
    2009, 80, -25
    2010, 100, -10
    2011, 120, -15

Awk oletuksena halkoo rivit tyhjien merkkien (välit ja tabit) perusteella,
mutta voimme asettaa kenttäerottimen `-F` -optiolla. Ensin vähän lämmitellään
kaivamalla pelkät vuosiluvut esille tiedostosta::

    $ awk -F, '{print $1}' data.csv
    2008
    2009
    2010
    2011

Huomaa pilku option perässä. Se on se erottimemme! Awk osaa laskea lukuja
yhteen::

    $ awk -F, '{print $1 $2 $3 " = " ($2+$3)}' data.csv
    2008 45 -120 = -75
    2009 80 -25 = 55
    2010 100 -10 = 90
    2011 120 -15 = 105

Nyt tulostetaan kentät 1, 2 ja 3. Sitten tulostetaan vähän tekstiä ja tehdään
laskusuoritus, jonka tulos myös tulostetaan. On se automaattinen
tietojenkäsittely hienoa.

Awk:n alla on vahva koneisto, joka voi kerätä tietoa ja koostaa siitä loppuun
vaikkapa summan::

    $ awk -F, '{saldo += ($2+$3)} END{print saldo}' data.csv
    175

Taikasanan END alle voi kääriä tehtäviä, jotka awk suorittaa aivan lopuksi.
Nyt laskemme kustakin rivistä kentät 2 ja 3 yhteen, ja lisäämme ne muuttujaan
`saldo`. Lopussa tulostamme tämän muuttujan sisällön näkyville. Käyttötapoja
on rajattomasti. Awk tukee myös samanlaista BEGIN-lohkoa.

Awkin kanssa kirjoitellessa kannattaa muistaa selkeyskin. Pidemmät ohjelmat
voi kirjoittaa omaan tiedostoonsa, ja ne voi syöttää awkille option `-f`
kanssa. Awk osaa niin paljon, ja se on niin helppokäyttöinenkin. Tästä
aiheesta voisi pauhata vaikka kuinka pitkään. Mutta musiikki on lopuillaan ja
yöksi kääntymään päin. Jatkamme uusilla aiheilla tuotapikaa.
