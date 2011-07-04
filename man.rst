Man
===

:Matias:        Nyt on korkea aika antaa teille lusikka omaan käteen
                niinsanotusti. Unix voi olla aika vaikeaselkoinen, mutta
                onneksi ohjeita on edes yritetty koostaa. Usein ovat
                onnistuneetkin!
:Hemmo-Joachim: Vanha kunnon `man`. Kyllä minä sen tiedän.
:Ville:         Minäpä en.
:Matias:        Ohjelmilla on hyvin tyypillisesti ohjetiedostoja vino pino --
                vain huonoilla softilla puuttuu. 
                
                Nämä ohjeet sijaitsevat tietyssä hakemistossa, ja niitä
                kutsutaan luonnollisesti *manual pageiksi*. Lyhyesti --
                Unix-miehet pitävät lyhyestä -- *manpaget*.
:Ville:         Ja `man` on sitten ohjelma näiden sivujen näyttämiseksi?
:Matias:        Näin. Man ei tee paljoa, mutta se tekee osansa, koostaen 
                muista työkaluista. Se purkaa pakatut ohjetiedostot auki,
                muotoilee ne ja sitten syöttää ne jollekin *pagerille*, eli
                nykyisin `less`-ohjelmalle.
:Hemmo-Joachim: Kaikki `less`-komennot toimivat `man`:lla. Se on tykki juttu.
:Matias:        Jep. Jossain vanhoissa systeemeissä voi `less` puuttua ja
                alkukantainen `more` astuu esiin. Et halua puuhastella sen
                kanssa, usko pois!

--------

Yleiskäyttö `man`-ohjelmalle on helppoa. Saadaksesi ohjelman `xyz` ohjeet
näytölle komento kuuluu::

    $ man xyz

Unix-koodausta harjoittaville C-miehille `man` yleensä sisältää myös kaikki
C-systeemikirjastot ja niiden käytön. Silloin voit hakea funktiokuvauksia
suoraan sektiosta 3: "C Library Functions"::

    $ man 3 printf

--------

:Matias:        Ja `man` on about siinä. Katsokaa komennolla `man man`
                lisätietoja asiasta. Jos `less`:n perusteet unohtuivat
                opetella, niin olisi hyvä aika katsoa keskeiset
                näppäinkomennot sille.
:Hemmo-Joachim: Haa--yhden kikan unohdit esitellä. Voit hakea kaikista
                asennetuista ohjeista hakusanoin::

                    $ man -k hakusana

:Matias:        Ähäkutti: `-k` toki hakee hakusanoin kuvauksista, mutta tekee
                niin vain lyhyistä kuvauksista. Jos haluat oikeasti selata
                koko ohjetiedoston sisältä (hidasta!) niin seuraava komento
                voi tehdä parempaa työtä::

                    $ man -S 1 -K hakusana

                Nyt `man` hakee kaikista ohjelmaoppaista (sektio 1) ja niiden
                sisällöistä hakusanalla `hakusana`. Se kyselee jokaisen osuman
                saaneen tiedoston jälkeen, luetaanko se läpi.
:Hemmo-Joachim: Kah, aina sitä oppii.
:Matias:        No ei `man -k` huono idea ole, mutta siihen kannattaa soveltaa
                vähän greppiä, jotta saat tiiviimmän listan osumista.
:Ville:         Miten sitä greppiä nyt sovelletaan tuohon hommaan?
:Matias:        Käsittelemme sitä seuraavassa isossa luvussa.
