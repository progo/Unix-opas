Joitain käytettyjä komentorivisovelluksia
=========================================

Kertaillaan ensin Unix-filosofian toista tärkeätä sääntöä, koska sen ansiosta
komentorivi on niin voimakas kuin se on. Sitten tarkastelemme perustyökaluja
tiedostojen tutkimiseksi.

Kaikki on legopalikoita
-----------------------

:Matias:        Okei. Oletteko valmiita sukeltamaan kunnolla sisään? Aloitan
                tämmöisestä asiasta, jotta meillä olisi jotain palikoita
                valmiiksi tulevia koitoksia varten.
:Ville:         Mitä ihmeen palikoita?
:Matias:        No ok. Minä tykkään ajatella unix-ohjelmia ikään kuin
                legopalikoina.
:Ville:         Tä, miksi?
:Matias:        Koska ne ovat niin pieniä? Jokainen ohjelma tekee pienen
                homman, ja jos mitenkään mahdollista, jättää epäoleelliset
                tehtävät muille ohjelmille.
:Hemmo-Joachim: Jaa. Mun mielest tuo *Tulikettu* on aika kaukana
                legopalikasta.
:Matias:        Nykypäivän graafiset käyttöliittymät tekevät palikoinnista
                aika vaikeata. Mutta vanhaan hyvään aikaan kaikki oli
                komentorivillä, ja Unix-filosofian säännöistä kultaisin menee
                näin (ulkomuistista!):

                    Pane ohjelmasi tekemään vain yksi tarkkaan määrätty
                    tehtävä, ja tee se hyvin! Tee ohjelmista kasattavia. Luota
                    tekstirajapintoihin, sillä se on universaali
                    viestintätapa.

:Ville:         No olipa se syvällistä.
:Hemmo-Joachim: Mikäs tuossa tekstissä niin viehättää? Eikö saa kuvia olla?
:Matias:        Kuvat taitavat tehdä poikkeuksen, mutta tekstiä on helppo
                käsitellä, ihmisenkin. Se ei kärsi teknisistä ominaisuuksista
                tavujen alapuolella: sitä on helppo lähettää verkon yli.
                Hätätapauksessa ihminenkin voi ottaa editorin kauniiseen
                käteen, ja lukea helposti tekstimuotoista syötettä.

                Eikä puhdas teksti varmasti tule vanhenemaan formaattina kuten
                joku Word-dokumentti.
:Hemmo-Joachim: Mitä tarkoitat --- että pystyn lihavoimaan ja muotoilemaan
                puhdasta tekstiä?
:Matias:        Ei Hemmo. Yritän sanoa, että kun olet valmis, niin sinun ei
                tarvitse. `<grin>`

Tärkeimmät palikat
------------------

Listataan seuraavaksi käsiteltäviä ohjelmia, ja niiden kuvaukset lyhyesti
taulukon muodossa. Nyt puhutaan näistä sovelluksista
tiedostojenkäsittelijöinä, mutta tämä käsite muuttuu nopeasti myöhemmin.
Toivottavasti pysytte kärryillä.

+-------------+-------------------------------------------------------+
| Ohjelma     | Tehtävä                                               |
+=============+=======================================================+
| `cat`       | Yhdistä/näytä tiedosto                                |
+-------------+-------------------------------------------------------+
| `grep`      | Hakee tekstiä tiedostosta                             |
+-------------+-------------------------------------------------------+
| `wc`        | Laskee merkkejä/sanoja/rivejä                         |
+-------------+-------------------------------------------------------+
| `sort`      | Lajittelee tiedostoa                                  |
+-------------+-------------------------------------------------------+
| `head`      | Näytä ensimmäiset rivit                               |
+-------------+-------------------------------------------------------+
| `tail`      | Näytä viimeiset rivit                                 |
+-------------+-------------------------------------------------------+
| `less`      | Näyttää tiedoston selattavassa muodossa               |
+-------------+-------------------------------------------------------+

:Ville:         Kissojako tämä käsittelee?
:Matias:        Arvasin, että joku puuttuu tähän. Se on lyhenne sanasta
                *concatenation*, eli yhdistäminen. Sillä pystyy sattumoisin
                myös lukemaan tiedoston sisältöä. Vaikka se ei ole tarkoitettu
                siihen.
:Hemmo-Joachim: Ja mä kun luulin, että se on just siihen hommaan. Toimii
                täydellisesti!
:Matias:        Toki se toimii hyvin siihen, jos on lyhyestä tekstistä kyse.

---------

`cat`
.....

Tiedostojen yhdistämiseen sopiva `cat` on helppokäyttöinen, eikä sisällä
ylimääräisiä ominaisuuksia. Kuten kuvaan sopiikin. Sillä voi sattumoisin
todellakin katsella tiedostojen sisältöjä::

    $ cat foo.txt
    Foo-tiedoston sisältö tulee tähän
    muokkaamattomana.
    $ cat bar.txt
    Barbarbar
    $ cat foo.txt bar.txt
    Foo-tiedoston sisältö tulee tähän
    muokkaamattomana.
    Barbarbar
    $

Formaalimmin sanottuna `cat` lukee argumentteina annettuja tiedostoa yhden tai
useamman, ja tulostaa ne annetussa järjestyksessä peräkkäin eteenpäin::

    cat [file1] [file2] [...]

:Ville:         Eli `cat tiedosto.txt` näyttää sen tuossa ruudulla. Mitenkäs
                jos tiedosto on pitkä niin se ei mahdu.
:Matias:        Sitä varten käytetään oikeata lukijaa, tai *pageria* kuten
                Unixeissa sanotaan (*pager*, sivuttaja). Käsittelemme yhden
                pagerin nimeltä `less` tässä myöhemmin.

---------

`wc`
....

:Hemmo-Joachim: Hei tarviiks käydä veskis? Höhö
:Matias:        Oikein hyvä, oikein hyvä. Mutta `wc` tulee tylsästi sanoista
                `word count`. Se laskee tiedostojen sisällöistä sanamääriä.
                Merkit, sanat, rivit. Hyödyllinen joihinkin hommiin, mutta
                aika harvoin nykypäivänä.
:Hemmo-Joachim: Niin, sanathan voi laskea OpenOfficessakin.
:Ville:         Mutta tämähän on kätsy.
:Matias:        Tällä on käyttöä erityisesti rivien laskemisessa, mutta
                tokihan puhtaista tiedostoistakin pitää jotenkin sanat saada
                lasketuksi.

Sanalaskuri `wc` käyttäytyy samalla tavalla kuin `cat`::

    $ wc foo.txt        
     2  5 56 foo.txt
    $ wc foo.txt bar.txt 
     2  5 56 foo.txt
     1  1 10 bar.txt
     3  6 66 total
    $

Annetut kolme lukua ovat järjestyksessä rivien, sanojen ja merkkien lukumäärä.
Jos tiedostoja antaa enemmän kuin yhden, `wc` laskee myös kaiken yhteen. Voit
myös laskea vain tiettyä arvoa seuraavien asetusten kanssa:

-w   laske vain sanat
-c   laske vain merkit
-l   laske vain rivit
-L   laske tiedoston pisin rivi

Näistä viimeistä on helppo käyttää tilanteissa, joissa tiedostojen täytyy olla
oikein muotoiltuja. Monesti on annettu esimerkiksi 80 merkin rivinpituusraja.
Näin helppoa se on::

     $ wc -w foo.txt bar.txt 
      5 foo.txt
      1 bar.txt
      6 total

---------

`grep`
......

:Matias:        Siirrytään jo kovempiin välineisiin. Onko koskaan ollut
                tarvetta hakea jotain tekstiä tiedostoista?
:Ville:         Kysytkin.
:Matias:        Näin on. Vanha kunnon `grep` hakee meille kaikki osumat, joita
                hakusanamme antaa. 
:Hemmo-Joachim: Käyttääks se googlea?
:Matias:        Ei. Haemme aina jostain tiedostosta. Annetun tiedoston kaikki
                ne rivit tulevat tulostetuksi, jos riviltä löytyy annettu
                hakusana. Ei ole vaikeata!
:Hemmo-Joachim: No ei pitäisi olla.
:Ville:         No, miten tätä käytetään?

Yksinkertainen kuvio on seuraava::

    grep PATTERN [FILE]...

Kolme pistettä valinnaisen argumentin perässä tarkoittakoon, että tiedostoja
saa taas olla enemmänkin kuin yksi. Kaikista haetaan järjestyksessä. Sanaa
*PATTERN* käytetään paljon Unix-maailmassa. Se tarkoittaa siis hakusanaa, joka
voi olla paljon enemmänkin kuin pelkkä sana. Palaamme näiden patternien
pimeälle puolelle myöhemmin.

Oletetaan, että meillä on seuraavanlainen tiedosto, jossa on Matiaksen
suosikkielokuvien listaukset::

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
    $

Jos tämä olisi kokonainen listaus *Three Stooges* -elokuvia, niin tämä olisi
vähän pidempi listaus, niin haun käyttö olisi merkityksellisempää. Nyt
kuitenkin näin.

Nyt jos haluaisimme tarkastella kaikkia Shempin tekemiä jaksoja, niin
`grep`:iä käyttämällä asia on jo hoidossa::

    $ grep Shemp Stooges.txt
    1950    Studio Stoops           Shemp
    1950    Punchy Cowpunchers      Shemp
    1948    Hot Scots               Shemp
    1947    All Gummed Up           Shemp

Mitään ei ole poistettu: grep vain näyttää osuman saaneet rivit tiedostosta,
eikä muuta. Vastaavalla tavalla voimme hakea vaikka minkälaista. Hakusana ei
oletuksena rajoitu mitenkään kokonaisiksi sanoiksi, vaan jos `grep` löytää sen
keskeltä toista sanaa, niin rivi tulostetaan. Tästä on erityisesti etua, jos
vähän haittaakin::

    $ grep 195 Stooges.txt
    1950    Studio Stoops           Shemp
    1958    Quiz Whiz               Joe
    1950    Punchy Cowpunchers      Shemp

Näin saimme kaikki 1950-luvulla esitetyt jaksot listatuksi, kun olimme vähän
ovelia ja tiesimme tiedoston rakenteesta etukäteen. Säännöllisten lausekkeiden
avulla voimme määrätä tarkempaan, missä ja miten hakusana saa esiintyä.

:Hemmo-Joachim: Joo `grep` on tuttu, mutta ärsyttää aina kirjoittaa hakusana
                isolla tai jotenkin. Ei osaa muuten löytää. Esimerkiksi tuo
                Stooges-tiedosto, `grep` ei löydä mitään jos haen "shemp"illä.
:Matias:        Joo, Unixeissa ollaan yleensä tarkkoja kirjainkoosta. Käytä
                grepille asetusta `-i`, jolloin se jättää koon huomioimatta.
:Ville:         Voi veljet. Miten te jaksatte katsoa noin vanhoja elokuvia?

Tarkastele kirjainkoon merkitystä ja `-i` -flagin käyttöä::

    $ grep joe Stooges.txt
    $ grep -i joe Stooges.txt
    1958    Quiz Whiz               Joe

Keskeiset työkalut tiedostojen käsittelyyn ovat esitetyt `cat` ja `grep`.
Näistä jälkimmäinen omaa suuria voimia sisäänsä, mutta emme voi vielä
käsitellä kaikkea.  Siihen palaillaan säännöllisissä lausekkeissa sitten.
Katsellaan vielä pari pikkuohjelmaa tiedostojen käsittelyyn, ja sitten yksi
isompi, jolla on paljon käyttöä isompien tiedostojen luennassa.


---------

`sort`
......


:Matias:        Lajittelu on melko tyypillinen ongelma, ja helppokin
                sellainen. Ohjelma nimeltä `sort` hanskaa tiedostojen rivien
                lajittelun.
:Hemmo-Joachim: No annahan esimerkki.
:Matias:        Käyttäkäämme Stooges.txt -tiedostoa taas apunamme. Voisimme
                esimerkiksi ajaa sen helposti järjestykseen vuosiluvun mukaan.
                Nyt siinä on toki mukana se otsikko ja viiva, ja se vähän
                sotkee asiaamme.

::

    $ sort Stooges.txt
    --------------------------------------------
    1935    Uncivil Warriors        Curly
    1940    From Nurse To Worse     Curly
    1942    Three Smart Saps        Curly
    1946    Monkey Businessmen      Curly
    1947    All Gummed Up           Shemp
    1948    Hot Scots               Shemp
    1950    Punchy Cowpunchers      Shemp
    1950    Studio Stoops           Shemp
    1958    Quiz Whiz               Joe
    Vuosi   Jakso                   Kuka?

:Ville:         ... eli sortista ei ole mihinkään käytännölliseen tuon
                ongelman takia?
:Matias:        Ei nyt ihan niinkään -- kuten näette, rivit ovat kuitenkin
                järjestyksessä. Tämän asian voi korjata "näppärästi", mutta
                siihen joudumme palaamaan vasta myöhemmin!
:Hemmo-Joachim: Eihän tuo ole paha rasti korjata itte takaisin tota.
:Matias:        Lisättäköön, että `sort` on puhtaille tiedostoille, kuten
                juuri teimme, parhaimmillaan ilman otsikoita. Siis ilman
                muotoiluja. Muotoiltua tekstiä lajiteltaessa kannattaa
                hyödyntää kehittynyttä editoria apunaan.

                Ennen kuin tämä lässähtää huonoon demoon lopullisesti, niin
                maustetaan asiaa sillä faktalla, että tämmöistä
                taulukkomuotoista tekstiä `sort` osaa lajitella myös
                sarakkeittain!
:Hemmo-Joachim: Elä?

::

    $  sort -k 2 Stooges.txt
    --------------------------------------------
    1947    All Gummed Up           Shemp
    1940    From Nurse To Worse     Curly
    1948    Hot Scots               Shemp
    Vuosi   Jakso                   Kuka?
    1946    Monkey Businessmen      Curly
    1950    Punchy Cowpunchers      Shemp
    1958    Quiz Whiz               Joe
    1950    Studio Stoops           Shemp
    1942    Three Smart Saps        Curly
    1935    Uncivil Warriors        Curly
    $

Ja mitä näettekään?  Nyt tiedosto on lajiteltu toisen sarakkeen, eli jakson
nimen mukaan. Sitä varten on tuo optio `-k`, jolle annetaan "kentän" numero.
Tässä `sort` osaa haistella asian oikein, koska meillä on simppeliä dataa.
Oletuksena kenttä erottuu välilyönnistä, jolloin esimerkiksi "All Gummed Up"
on kolme erillistä kentää sortin silmissä. Kaikki lajittuu oikein, koska muuta
ei tarvitakaan kuin lajitella toisesta sanasta, eli jakson nimestä alkaen
rivin loppuun saakka.

---------

`head` ja `tail`
................

Kuin paita ja peppu. Jos ohjelmien nimet antavat mitään irti, niin olet jo
hyvillä jäljillä.

:Matias:        Nyt on pari helppoa ohjelmaa. Jos teillä on pitkä tiedosto
                edessänne, niin siitä voi olla joskus mukava katsoa vain alku
                tai loppu. Tätä varten on `head` -- alkua varten ja `tail`
                sitten ... ?
:Hemmo-Joachim: No loppua varten.
:Matias:        Tulihan se sieltä.

Käsitellään molemmat yhdessä: `head` (ja `tail`) lukevat 10 ensimmäistä (tai
viimeistä) riviä tiedostosta, ja tulostavat ne. Lukeaksesi enemmän tai
vähemmän, voit antaa oman numeron `-n` -asetukselle::

    $ head -n 15 pitkäteksti.txt

Lukee tietenkin 15 riviä kymmenen sijaan.

:Ville:         No nämä minäkin ymmärrän ilman eri selvittelyjä. Mutta
                mihinkähän näitäkin tarvitsee... onhan tuossa tuo
                vierityspalkki vieressä.
:Matias:        Aina ei ole sitä, etkä varmaan sinäkään jaksa 10000-rivistä
                tiedostoa tulostaa kokonaan näytölle ja sitten skrollailla
                ylös, jotta näet tekstin otsikon?
:Ville:         No hyvä on. Mutta  `tail` on vielä turhempi. Jos minä tulostan
                jotain tässä komentorivillä näytölle niin ainakin ne viimeiset
                rivit jäävät aina näkyviin!
:Matias:        No näinhän se tekee, mutta `tail` sisältää yhden
                lisäerikoisuuden, joka tekee siitä erityisen hienon.

Tail-ohjelmalla voit reaaliaikaisesti seurata annetun tiedoston loppuun
kirjoitettuja rivejä. Tämä asetus on nimeltään `-f`, ja siinä moodissa `tail`
jää ikuiseen lukusilmukkaan odottamaan uuden datan ilmestymistä tiedostoon.
Kaikki uudet rivit tulostetaan sitten esille. Sitä on hankala demonstroida
oppaassa, mutta kahdessa eri konsolissa voit kokeilla asiaa näin:

Yhdessä konsolissa seuraavanlainen komento::

    $ while true ; do sleep 1 ; date >> date.txt ; done

Se jää suorittumaan hiljalleen. Avaa toinen konsoli, ja nyt voit `tail`
-ohjelman avulla seurata reaaliaikaisesti tiedoston `date.txt` kasvamista::

    $ tail -f date.txt
    Wed Jun 29 19:06:26 EEST 2011
    Wed Jun 29 19:06:27 EEST 2011
    Wed Jun 29 19:06:28 EEST 2011
    Wed Jun 29 19:06:29 EEST 2011
    ... jne ...

Tiedostoon pitäisi ilmestyä sekunnin välein yksi uusi rivi, jossa on
`date`-ohjelman tuloste kullakin kutsukerralla. Kun olet huvitellut tarpeeksi,
näppäinyhdistelmä `<C-c>` sekä tailille että toistaiseksi mystiselle
`while`-kokonaisuudelle saa ohjelmat hiljenemään.

:Matias:        Itse käyttelen tätä toimintoa omien javaohjelmien
                debuggauksessa. Ja myöspä unixien omat järjestelmälogit on
                helppo panna taustalle rullaamaan tämän seurannan avulla!
:Ville:         Aika päheetä.

---------

`less`
------

Esitetyt ohjelmat ovat tähän mennessä kaikki olleet yhtälailla ihmisen kuin
koneen käyttöä varten. Nyt esitetään tekstitiedostoja lukeva `less`, jonka
toiminnallisuus on puhtaasti ihmisen käyttöä varten. 

On nyt mainittava, että `less` ei kuulu vakiokalustoon. Jos käy huono arpa
kohdalle, lessiä ei ole asennettu Unixissasi. Joskus pagerina on käytettävä
vanhempaa ohjelmaa nimeltä `more` (DOS-käyttäjät muistanevat samannimisen),
mutta se on paljon rajoittuneempi. Sanontakin sen sanoo: *less is more*. 

:Matias:        No niin. Pitkiä tiedostoja -- vaikkapa irc-logeja -- on tylsä
                lukea `cat`:in tai `grep`:in avulla.
:Ville:         Sanoppa muuta.
:Hemmo-Joachim: Eikö se `irssi` ole just tuota varten?
:Matias:        No Hemmo, irssi säilyttää vain sen ja sen verran logia.
                Vanhoja muistellessasi pitää yleensä turvautua logeihin, jos
                niitä olet nauhoitellut.
:Hemmo-Joachim: No niinhän se on. Olen joskus kokeillut `grep`:illä hakea
                jotain juttua logista ja ei siitä ole tullut mitään.
:Matias:        `less` helpottaa siinä hakemisessa.
:Ville:         Eli tuo esittelemäsi `grep` onkin ihan turha, jos `less`:llä
                voi hakea helpommin ja paremmin?
:Matias:        Ei niinkään. Näet kyllä, että näillä tehdään erityyppisiä
                hakemisia.

Peruskäyttö::

    less [FILE]...

Ja nyt `less` avaa tiedostosi koko ruudulle.  Voit selata tiedostoa
nuolinäppäimin tai vaikka käyttää `<Page Up/Down>`:ia. Selaimesta tutulla
tavalla voit vierittää alaspäin välilyönnistä. Voit palata ylöspäin: temppu,
jota vanha `more` ei osannut. Mutta jos ajat lessiä komentoriviltä jonkin
terminaalisovelluksen läpi, niin terminaalisi vierityspalkit tuskin toimivat
kuten haluat. Less ei ole sellainen ns. *batch*-sovellus kuten puhuimme
alussa. Se on interaktiivinen kokoruudun ohjelma, jotka yleistyivät vasta
80-luvulla.

:Ville:         Hommasin jonkun tiedoston tähän ja `less` nyt tässä auki. Mitä
                tässä voi tehdä, muutakin kuin kelata ylös- ja alaspäin ja
                lukea?
:Matias:        Voit hakea tiedostostasi hakusanoilla, voit ladata uusia
                tiedostoja ja vaihdella niiden välillä; voit hyppiä
                tiedostosta komentoriville ja sitten palata takaisin. Voit
                asettaa kirjanmerkkejä kohtiin ja palata niihin yhdellä
                näppäinyhdistelmällä myöhemmin... `less` osaa kaikenlaista.

                Mutta me käymme vain pienen osan kaikesta tästä, koska sillä
                pärjää hyvin.

Seuraavassa taulukossa on listaus `less`:in paljon käytettyjä komentoja.

+--------------------+-----------------------------+
| Näppäin            | Tekee                       |
+====================+=============================+
| Ylä- ja alanuoli   | selaa tiedostoa ylös/alas   |
+--------------------+-----------------------------+
| `h`                | lessin ohjetiedosto         |
+--------------------+-----------------------------+
| `q`                | sulje ohje tai sulje `less` |
+--------------------+-----------------------------+
| `j`, `k`           | rivi alas / rivi ylös       |
+--------------------+-----------------------------+
| PgUp/Dw            | Sivu kerrallaan ylös/alas   |
+--------------------+-----------------------------+
| `<C-f>` ja `<C-b>` | Sivu alas/ylös              |
+--------------------+-----------------------------+
| `/PAT<CR>`         | Haku tiedostosta            |
+--------------------+-----------------------------+
| `n`                | Seuraava osuma              |
+--------------------+-----------------------------+
| `N`                | Edellinen osuma             |
+--------------------+-----------------------------+

:Matias:        Ja tarkennettakoon se, että `<C-f>` tarkoittaa control+f:ää.
                Mikä puolestaan tarkoittaa, että kontrol-äffällä ei tehdä
                hakua kuten Windows-maailmassa tehdään.

                Toinen tarkennus on, että `<CR>` tarkoittaa enterin
                painallusta.
:Ville:         Miksi kehittäjät eivät ole voineet tehdä samalla tavalla
                toimivaa systeemiä. On taas pitänyt taistella Microsoftia
                vastaan! :F
:Matias:        Otahan huomioon, että nämä konventiot ovat rutkasti vanhempia
                kuin Windows.
:Hemmo-Joachim: Tuossa on joitain päällekkäisyyksiä. Onko niissä eroja?
:Matias:        Ei ole. Sisällytin pari kohtaa, jotka ovat keskenään samoja.
                Pistin ne mukaan, jos joukossamme on joku `vi`-käyttäjä.
                Joskus on ihan mukava kirjoitella ja hypätä lessiin ilman,
                että pitää kättä siirtää nuolinäppäimille.
:Hemmo-Joachim: Ja mitenköhän se sitten onnistuu?
:Ville:         Justhan sä luit tuon taulukon. Siinä näkyy niitä näppäimiä.

Esimerkissämme nyt voisi olla pitkä, 170-rivinen `Stooges.txt`-tiedosto, josta
haluamme haeskella muuten vain vaikkapa hevosaiheisia jaksoja.

::

    $ less Stooges.txt
    /Horse<CR>
    n
    n
    q

Tämä olisi esimerkkitilanne, jossa haetaan hakusanalla "Horse" ja ilmeisesti
tehdäänkin löytöjä. Kahdesti on painettu `n`-näppiä, eli on haettu edelleen
uusia Horse-esiintymiä tiedostosta. Sitten on lopeteltu.

:Matias:        Enpä jaksa enempää esitellä. `less` on paljon käytetty
                ohjelma, ja se on riittävän yksinkertainen. Jos on ollut
                tarvetta millekään isommalle niin olen vaihtanut suosiolla
                editorin puolelle.
:Hemmo-Joachim: Ja hei, siihen on muuten `less`:in puolelta oma komento.
:Matias:        No katsos vain. Olet ollut tarkkana. Tiedostoa selattaessa
                näppäin `v` aktivoi kyseisen tiedoston vapaavalintaisessa
                editorissa. Mutta sen täytyy olla asetettuna tietyssä
                muodossa. Palaamme editoreihin tuotapikaa!

                Tämä on hyvä yhdistelmä, `less` ja tuo komento `v`. Nopeasti
                käynnistyvällä lessillä helposti hakee oikean tiedoston, ja
                sitten voi editoida sitä yhden näppäinpainalluksen takaa.

Jees. Meikä kuunteleekin Kraftwerkin levyn vielä loppuun ja sitten suihkuun.
