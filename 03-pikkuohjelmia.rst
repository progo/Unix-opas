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
    1935    Uncivil Warriors        Curly
    1940    From Nurse To Worse     Curly
    1942    Three Smart Saps        Curly
    1946    Monkey Businessmen      Curly
    1947    All Gummed Up           Shemp
    1948    Hot Scots               Shemp
    1950    Punchy Cowpunchers      Shemp
    1950    Studio Stoops           Shemp
    1958    Quiz Whiz               Joe
    $

Jos tämä olisi kokonainen listaus *Three Stooges* -elokuvia, niin tämä olisi
vähän pidempi listaus, niin haun käyttö olisi merkityksellisempää. Nyt
kuitenkin näin.

Nyt jos haluaisimme tarkastella kaikkia Shempin tekemiä jaksoja, niin
`grep`:iä käyttämällä asia on jo hoidossa::

    $ grep Shemp Stooges.txt
    1947    All Gummed Up           Shemp
    1948    Hot Scots               Shemp
    1950    Punchy Cowpunchers      Shemp
    1950    Studio Stoops           Shemp

Mitään ei ole poistettu: grep vain näyttää osuman saaneet rivit tiedostosta,
eikä muuta. Vastaavalla tavalla voimme hakea vaikka minkälaista. Hakusana ei
oletuksena rajoitu mitenkään kokonaisiksi sanoiksi, vaan jos `grep` löytää sen
keskeltä toista sanaa, niin rivi tulostetaan. Tästä on erityisesti etua, jos
vähän haittaakin::

    $ grep 195 Stooges.txt
    1950    Punchy Cowpunchers      Shemp
    1950    Studio Stoops           Shemp
    1958    Quiz Whiz               Joe

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

---------

`less`
------

Tämä on tärkeämpi 

