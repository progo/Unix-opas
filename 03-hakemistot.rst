Tiedostot, ja hakemistoissa seikkailu
=====================================

:Matias:        Ei kai minun tarvitse opettaa teille hakemistorakenteiden
                käsitettä uudestaan? Unixeissa on samanlainen hakemistorakenne
                kuin Dosissa ja Windowseissa:
                
                Hakemistot sisältävät

                - tiedostoja
                - tai muita hakemistoja.
                  
                Tämä oli lyhyt, ja toivottavasti täydellinen, (samalla
                elegantin rekursiivinen) määritelmä aiheeseen.
:Ville:         Joo, samanlainen pitäisi olla, mutta missä on `C:` ja muut
                asemat?
:Matias:        Sellaisia ei ole. Kaikki on yhdessä *tiedostojärjestelmässä*,
                ja näin on hyvä.
:Hemmo-Joachim: Ei ole Ceetä tai Äffää, on vain "päähakemisto" ja usb-tikku.
:Matias:        Onhan Windowseissakin pyritty siirtymään enemmän "Omat
                tiedostot" -ajatteluun. Pyörimme samalla tavalla pienissä
                kuvioissa, joten tällä ei ole merkitystä.
:Ville:         No katsellaan sitten se käytäntö.

Kuten Windowsissa
-----------------

:Matias:        Tärkein komento, mistä voimme alkaa, on `pwd`: "print working
                directory".
:Ville:         Englannin seiskani sanoo, että se tulostaisi nykyisen
                hakemiston...?
:Hemmo-Joachim: Aivan oikein.
:Matias:        Ja sen käyttö on niin helppoa kuin voi olla:

                ::

                   $ pwd
                   /home/matias

:Hemmo-Joachim: Mulla näkyy muuten toi aina tossa promptissa, ei tarvi tätä
                komentoa käytellä.
:Matias:        Tämä onkin enemmän koneita kuin ihmisiä varten. Onpa tällä
                käyttönsä tietyissä tilanteissa.
:Ville:         Siis tarvinko minä tätä vai en?
:Matias:        Onpa tyhmä kysymys. Jos et muuten näe mistään, missä olet,
                niin sitten tarvitset.

----------

:Matias:        Seuraavaksi jotain mielekkäämpää. Oletetaan, että meillä on
                seuraavanlainen hakemistorakenne::

                    /home/matias
                            |-- autot
                            |   |-- bmw
                            |   `-- fiat
                            `-- kissat

                Kaipa tuosta tekstistä saa selvää.
:Ville:         No ei tämä kai ollutkaan mikään taidekurssi...
:Matias:        No niin. Jos leikimme, että olemme tuossa hakemistossa `.`
                ylimmäisenä. Siirrymme muihin hakemistoihin komennolla `cd`::

                    $ pwd
                    /home/matias
                    $ cd autot
                    $ pwd
                    /home/matias/autot

:Hemmo-Joachim: Vanhaa juttua kyllä.
:Ville:         Harvinaisen selvä juttu.
:Matias:        Mutta olikos selvillä, miten palataan ylöspäin hakemistoissa?
                Se on tämä erikoishakemisto, kaksipisteinen `..`::

                    $ cd ..
                    $ pwd
                    /home/matias

                Jos nyt oletimme, että pysymme kokoajan siinä, mihin
                edellisessä kokeessa jäätiin.

                Samalla tavalla voimme ketjuttaa useita hakemistoja samaan
                kutsuun. Jos haluan mennä tutkimaan Fiat-fileitä, niin tämä
                oneliner hoitaisi homman::

                    $ cd autot/fiat
                
                Ja voi palata ylös samalla tavalla ketjuttamalla::

                    $ cd ../..
                    $ pwd
                    /home/matias

:Ville:         Eli toi `..` on vähän kuin paluulinkki takaisin?
:Matias:        No se riippuu siitä, mistä tulet. Se on tarkalleen ottaen
                ylöspäin (tai vasemmalle, jos polku on kirjoitettu auki
                muodossa `/hake/hake/hake/`.
:Ville:         Onkos sitten erikseen joku paluujuttu niinku selaimissa on?
:Matias:        On olemassa kiva lisä, joka tekee mainitsemasi asian:

                ::

                    $ cd autot/fiat
                    $ cd ../bmw
                    $ cd -
                    $ pwd
                    /home/matias/autot/fiat

:Ville:         No johan on!
:Hemmo-Joachim: No johan oikeasti!
:Matias:        Ja jos teillä on huonosti nimetty hakemisto, siis nimeltänsä
                `-`, niin sinne voi siirtyä antamalla hakemistopolun hieman
                kikkailemalla::

                    $ cd ./-

:Hemmo-Joachim: No niin.


`ls`
....


:Matias:        Eiköhän siirrytä nyt jo noihin tiedostoihin. Siihen on vain
                yksi keskeinen ohjelma: `ls`::

                    $ ls autot/bmw
                    penkit    ratti

:Hemmo-Joachim: On myös mahdollista käyttää dossin `dir`-komentoa täällä!
:Matias:        No se on enemmän tätä `ls`-komentoa vastaava  kuin
                alkuperäistä `dir`:iä.
:Ville:         List -- `ls`?
:Matias:        Niin, tällä siis katsellaan hakemiston sisältöä. Jos olette
                onnekkaita, niin `ls` antaa teille oikein värien kanssa
                tiiviin listauksen hakemiston sisällöstä.
:Ville:         Tämä selvä.
:Matias:        `ls` ei tarvitse hakemistoa. Jos jätätte sen pois, kuten
                tavallisimmin tehdään, niin se listaa tämänhetkisen hakemiston
                sisällön. Sitä käytetään eniten::

                    $ cd autot/bmw
                    $ ls
                    penkit    ratti

:Matias:        Ja `ls` tekee paljon muutakin... käydään vain vähän pintaa
                raapaisemassa tässä vaiheessa. Oletetaan, että meillä on
                tämmöinen hakemisto, jossa on tiedostoja::

                    $ ls
                    burgeri.txt  kalastaja  karvinen  siamilainen

                Voisimme halutessamme katsoa `ls`:n avulla vähän syventävämpiä
                tietoja näistä tiedostoista. Sitä varten on optio `-l`, eli
                *long*::
                    
                    $ ls -l
                    total 16
                    -rw-r--r-- 1 matias matias  412 Jul 15 17:07 burgeri.txt
                    -rw-r--r-- 1 matias matias  542 Jul 15 17:03 kalastaja
                    -rw-r--r-- 1 matias matias 2354 Jul 15 17:18 karvinen
                    -rw-r--r-- 1 matias matias  423 Jul 15 17:03 siamilainen

:Hemmo-Joachim: Tossa on aika paljon tietoja.
:Ville:         Niin, mitä kaikkea tuossa sanotaan?
:Matias:        Tätähän voi vähän muutella, mutta tässä listauksessa on
                järjestyksessä seuraavat tiedot:

                #. `-rw-r--r--`: oikeudet (tutkimme niitä vähän myöhemmin)
                #. 1: kovien linkkien lukumäärä (ehkä maininta myöhemmin)
                #. Ensimmäinen `matias`: käyttäjä, kenen tämä tiedosto on
                #. Toinen `matias`: ryhmä, jolle tämä tiedosto kuuluu
                #. `412`: koko tavuina
                #. `Jul 15 17:07`: päiväys ja kellonaika, jolloin on viimeksi
                   muutettu
                #. `burgeri.txt`: tiedoston nimi

                Tässä voi olla itse asiassa enemmän tai vähemmän tietoja,
                riippuen vähän, minkälaisesta tiedostosta on kyse. 
:Ville:         Aika omituiset tiedot. Koko on aika huonosti luettavissa
                tavuista.
:Matias:        Eniten käytetty optio `-l`:n lisäksi on `-h`, eli *human
                readable*. Se muuntaa tiedostojen koot aina sopivaksi
                yksiköksi::

                    $ ls -lh
                    total 16K
                    -rw-r--r-- 1 matias matias  412 Jul 15 17:07 burgeri.txt
                    -rw-r--r-- 1 matias matias  542 Jul 15 17:03 kalastaja
                    -rw-r--r-- 1 matias matias 2,3K Jul 15 17:18 karvinen
                    -rw-r--r-- 1 matias matias  423 Jul 15 17:03 siamilainen

:Ville:         No nyt alkaa näyttää hyvältä.
:Matias:        Pikkukikkailua voi `ls`:llä tehdä loputtomiin. Flagin `-t`
                avulla tiedostot lajitellaan muutosajan perusteella. Oletushan
                on aakkosjärjestys. `ls -t` antaisi esimerkissämme tiedoston
                `karvinen` ensimmäisenä, koska sitä on muutettu viimeisimpänä.
:Hemmo-Joachim: Jotain uuttakin oppii!
:Matias:        `ls` ottaa vastaan argumentteinaan sekä tiedostoja että
                hakemistoja (tyhjän lisäksi). Se listaa silloin vain ne
                tiedostot, jotka käyttäjä on sille antanut. Kuulostaa vähän
                hupsulta? 
:Ville:         Kyllä se joo. Jos käyttäjä tietää jo niitä nimiä, niin mitä
                siitä kostuu. No tietysti jos haluaa kokoja katsella...
:Matias:        Erityisesti jos annamme shellin auttaa vähän. Shell osaa hakea
                tiedostonimiä ns. *wildcardien* tai suomalaisittain
                jokerimerkkien avulla. Idea on toivottavasti
                selvä Dos-ajoilta.  Ja jos olettaisimme, että tiedostoja on
                tuhatkaupalla. Kaikkea ei pysty käsittämään pieni ihminen
                kerralla.

                Annanpas ihan käyttötapauksia esimerkkeinä, jospa ymmärrätte
                tai muistatte paremmin, mistä on kyse. Tämmöinen oli meidän
                hakemistomme sisältö::

                    $ ls
                    burgeri.txt  kalastaja  karvinen  siamilainen

                Kaikki tekstitiedostot, tai ainakin kaikki tiedostot, jotka on
                nimetty `.txt`-päätteisiksi::

                    $ ls *.txt
                    burgeri.txt

                Pienellä kirjaimella `k` alkavat tiedostonimet::

                    $ ls k*
                    kalastaja  karvinen

                Nenniläiset::

                    $ ls *nen
                    karvinen  siamilainen

                Ja yhdistelmänä tiedostot, jotka alkavat pienellä koolla ja
                päättyvät `nen`-päätteeseen::

                    $ ls k*nen
                    karvinen

:Ville:         Dos-ajoilta muistan, että tähti (eli asteriski, eli `*`)
                vastaa yhtä tai useampaa merkkiä, ja kysymysmerkki `?` yhtä
                merkkiä.
:Matias:        Kyllä ne vähän samaa ovat, mutta on pieni ero. Tähti vastaa
                myös nollaa merkkiä, mikä voi kuulostaa ihmeelliseltä::

                    $ ls karvinen*
                    karvinen

Summariikkina:

+--------------+------------------------+
| Jokerimerkki | Vastaa                 |
+==============+========================+
| `*`          | 0 tai enemmän merkkejä |
+--------------+------------------------+
| `?`          | 1 merkkiä              |
+--------------+------------------------+

.. Olisikohan tässä tarpeeksi aineksia tiedostoihin ja hakemistoihin.

Kotihakemisto
-------------

:Matias:        Sitten vähän lisää hakemistoista, nimittäin kotihakemiston
                käsite. Nykyisin on tämä helpompaa selittää, kun koti-Windowsit
                ovat päässeet samalle tasolle. Samalla tavalla kuin teillä on
                Windowseissa `C:\\Users\\` -polun takana omat tavaranne,
                joihin muut eivät pääse käsiksi, niin Unixeissa on vastaava
                hakemisto `/home/`.
:Ville:         En nyt käsitä...
:Hemmo-Joachim: Jokaisella on se oma *"Omat tiedostot"* -hakemisto, johon ei
                yleensä pääse katselemaan muut kuin sen hakemiston omistaja
                itse.
:Ville:         Niin.
:Matias:        Ja nyt Unixeissa on myös jokaisella oma kotisoppi, yleensä
                sijaitsee hakemistossa `/home/<käyttäjä>/`.

                Esimerkiksi minulla on systeemeissäni `/home/matias/`. Se on
                kokonaan minun aluettani, johon säilötään omat asetustiedostot
                ja datat.
:Ville:         Mistä sen tietää, jos on semmoinen hakemisto?
:Matias:        Sen osaa aavistaa. Jos ei ole, niin yleensä mikään ei toimi
                kunnolla.
:Matias:        Ja nyt shellissä pyöriessäsi kotihakemisto on syystäkin varsin
                merkityksellinen paikka. Isoissa koneissa et yksinkertaisesti
                pääse tekemään muualla mitään kuin omassa hakemistossasi.

                Siksi sille on annettu näppärä lyhenne kaikissa shelleissä:
                `~`, eli *tilde* tai matomerkki.
:Ville:         Miten sitä lyhennettä pääsee käyttämään?
:Hemmo-Joachim: No kaikkialla, missä voi antaa hakemistopolkua, voi käyttää
                tätä tildeä merkkaamaan omaa kotihakemistoa::

                    $ pwd
                    /home/hemmo/aybabtu
                    $ cd ~
                    $ pwd
                    /home/hemmo

:Matias:        Näin voi tehdä. Huomautettakoon, että pelkkä `cd` tekee saman
                mitä `cd ~`. Tilden käyttö on hyvin oleellinen osa kotona
                luoviessaan. Tämmöinen käytös on hyvin yleistä, kun haluan
                vaihtaa nopeasti eri hakemistoista toisiin::

                    $ pwd
                    /home/matias/autot/fiat
                    $ cd ~/kissat
                    $ pwd
                    /home/matias/kissat

                Se vain on nopeaa ja selkeätä käyttää tildeä ikään kuin
                päähakemistona, josta koti alkaa.

Oikeuksista
-----------

Ja pari sanaa oikeuksista. Kotihakemistosta keskusteltaessamme mainitsimme,
että muut eivät välttämättä pääse katselemaan saati kirjoittamaan omia
tiedostojamme uusiksi.  Unixin tiedosto-oikeusjärjestelmä on vanha ja hyvin
simppeli, mikä tekee siitä ainakin helposti opittavan, jos ei kovinkaan
nykyaikaisen.

Tämä malli on kuitenkin äärimmäisen helppo ymmärtää:

- Kukin käyttäjä voi kuulua eri ryhmiin.
- Tiedostolla tai hakemistolla on aina yksi omistaja ja yksi ryhmä, johon se
  kuuluu.
- Tiedostolla tai hakemistolla on kolme erilaista asetusta kullekin
  käyttäjäkunnalle: omistaja, ryhmä (tiedoston ryhmä), muut (kuin omistaja tai
  kyseinen ryhmä).

.. TODO tämä ehkä pitäisi siirtää jonnekin muualle pelottamasta perusjuttuja

Tarkastellaan aiemmin nähtyä esimerkkiä. Tässä on `ls -l` -syötettä
tiedostosta `karvinen`::

    -rw-r--r-- 1 matias matias 2354 Jul 15 17:18 karvinen
      3.           1.     2.

Numeroidut kohdat:

1. Tiedoston omistaja, `matias`.
2. Tiedoston ryhmä, myös nimetty `matias`. Sattumalta tässä systeemissä kukin
   käyttäjä saa myös oman nimikkoryhmänsä käyttäjäluonnin yhteydessä. Yleinen
   vaihtoehto on myös `users`, tai muuta.
3. Tässä näkyvät tiedoston oikeudet. Tämä kymmenmerkkinen rimpsu on helposti
   luettavassa muodossa oleva katsaus oikeuksiin. Jos oikeutta ei ole, niin
   annetaan viiva. Muuten siinä näkyy lyhenne. Käydään nämä läpi:

   #. Ei oikeastaan oikeusmerkki, vaan ilmaisee, onko kyseessä tiedosto (`-`)
      vai hakemisto (`d`). Voi olla joitain muitakin merkkejä, jos kyseessä on
      vielä erikoisempi tiedosto.
   #. Omistajan lukuoikeus (`r`: read)
   #. Omistajan kirjoitusoikeus (`w`: write)
   #. Omistajan suoritusoikeus (`x`: execute).
   #. Ryhmän lukuoikeus
   #. Ryhmän kirjoitusoikeus
   #. Ryhmän suoritusoikeus 
   #. Muiden lukuoikeus
   #. Muiden kirjoitusoikeus
   #. Muiden suoritusoikeus 

Lukuoikeus on oltava, jotta tiedoston sisällön näkee. Kirjoitusoikeus on aika
ilmeinen. Suoritusoikeus tarkoittaa sitä, että tiedoston voi ajaa kuin
ohjelman. Hakemiston tapauksessa tarkoittaa, että sisään voi mennä.

Tuota kymmenen merkin sarjaa on helppoa lukea kolmen palasissa, ja unohtaa
ensimmäinen merkki. Jos tiedoston ryhmäoikeuksiin on merkitty `rw-`, niin
kaikki ne käyttäjät, jotka kuuluvat samaan ryhmään kuin tiedosto, voivat
kirjoittaa ja lukea näitä tiedostoja.

Linkit
------

:Matias:        Lyhyt maininta linkeistä, joita on Unixeissa kahdenlaista. On
                kovia ja pehmeitä linkkejä. Pehmeät linkit, tai symboliset
                linkit, ovat kuin Windowsissa pikakuvakkeet. Mutta vähän
                monipuolisempia.
:Ville:         Ai että voi työpöydälle laittaa linkin niin siihen voi mennä
                suoraan?
:Matias:        Eh. Nämä linkit käyttäytyvät kuin muut tiedostot, ja niitä voi
                tehdä minne tahansa. Hyvin näppärä tapa saada samat tiedostot
                näkymään eri paikoissa vaikkapa erinimisinä. Ja saman voi
                tehdä myös hakemistoille!
:Ville:         Kuulostaa hyödylliseltä.

Ohjelman nimi on `ln`, ja se tekee oletuksena kovia linkkejä, jotka ovat vähän
erilaisia kuin symboliset linkit. Keskitymme tässä nyt näihin jälkimmäisiin,
eli pehmeisiin ja symbolisiin linkkeihin.

::

    $ ln -s lähde kohde

:Matias:        Esimerkiksi näin

                ::

                    $ ls
                    kissat
                    $ ls kissat
                    burgeri.txt  kalastaja  karvinen  siamilainen
                    $ ln -s kissat katit
                    $ ls katit
                    burgeri.txt  kalastaja  karvinen  siamilainen
:Ville:         Ja nytkö samat tiedostot on kahdessa paikassa ilman että niitä
                kopioitiin?
:Matias:        Ei! Sekä hakemisto `kissat` ja `katit` osoittavat samaan
                hakemistoon, nimittäin `kissat`-hakemistoon. Kuitenkin saat
                käsitellä kumpaakin hakemistoa omalla nimellään -- `katit`
                näkyy systeemissä aivan omana hakemistonaan, ainakin mitä
                nimeen tulee.

Symbolisia linkkejä on helppoa tarkastella `ls -l` -listauksessa::

    $ ls -l
    lrwxrwxrwx 1 matias matias   6 Jul 16 17:23 katit -> kissat
    drwxr-xr-x 2 matias matias  73 Jul 15 17:03 kissat

Näemme, että `katit` on symbolinen linkki, joka osoittaa oikein nuolen kanssa
kohti hakemistoa `kissat`.
