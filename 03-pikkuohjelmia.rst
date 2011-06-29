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

Näin helppoa se on::

     $ wc -w foo.txt bar.txt 
      5 foo.txt
      1 bar.txt
      6 total


---------

`grep`
......

Foo

---------

`less`
------

Tämä on tärkeämpi 

