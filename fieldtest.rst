-----------
Kenttätesti
-----------

Havaitsemme helpohkosti, että field list ei ole järkevä työkalu, vaikka
näyttäisi ihan hyvältä.  Tai sitten *se on hyvä*. Hitto soikoon. 

HTML-filtteri näyttää myös vähän sekoilevan, mutta ei liian pahasti. Jospa tämä
tästä asettaa sen ruotuun.

:Ville:     Hei
:Kalle:     Hou
:Ville:     Hei
:Ville:     Hei
:Ville:     Hei
:Ville:     Hei. Ajattelin tässä kertoa vähän pidemmän kaavan mukaan
            suunnitelmistani. Esimerkiksi tuosta kesämökkiprojektistani, tai
            vaikkapa siitä, miten eräänä sunnuntaipäivänä kirjoitin tätä
            tekstiä toisen nimissä.

            Miten tämä pelaa, kun emme ole ``<p>``-tagien ympäröimänä?
:Ville:     Aha. Ei se mitään, vaikka puhun itselleni.
:Ville:     Hei
:Ville:     `Oletusasetus`
:Ville:     Hei
:Kalle:     Hou
:Kalle:     Tässä kohtaa ajattelin, että voisimme koklata tuota ajoittaista
            hyppyä ulos dialogista. Sen pitäisi näyttää hyvältä, eikä aiheuttaa koodiin
            isoja ongelmia.
:Kalle:     Hyvä idea.

------

Tässä kohtaa kertoisin vaikkapa ``ls``-ohjelman omituisista piirteistä
suhteessa shell-expansioon::

    ls -al *nonexisting*

Tuottaa luultavasti virheilmoituksen, mutta virheilmoituksen tekijä ei ole
``ls``, vaan shell. 

------

:Kalle:     Hou. Tästä eteenpäin olemme mekin kappaleiden sisällä.
:Kalle:     Hou
:Kalle:     Hou
:Kalle:     Hou
:Kalle:     Ok, Ville. Entäs useampikappaleiset tarinat, joissa on vaikka
            vähän `koodirivejä` seassa?

            Haluaisin tehdä niitäkin, ja nyt on hyvä aika huomata, ettei
            se edes onnistuisikaan.
:Ville:     Mutta se näyttäisi onnistuvan. Vaikka LaTeX-tulkkimme ei teekään
            sellaisia rivejä, kuin mitä haluaisimme.

            Otetaanpa ihan oikea tasalevyinen koodikomento tähän::

                ls -foobar farbarborous

            Ja tutkitaan sitä.
:Ville:     Hei
:Ville:     Hei
:Ville:     Hei
:Ville:     Hei
:Ville:     Hei
:Ville:     No, kaikki näyttäisi olevan jo parempaan päin. Meidän pitää
            katsella tuota LaTeXin filtteriä vähän uudella silmällä. Tasalevyisiä
            koodirivejä pitäisi mielellään saada aikaan myös inlinenä. Jospa
            ``tuplalainaus`` auttaa? 
:Ville:     Näyttää toimivan.
:Ville:     Hei |for| tässä. Mites siellä.
:Ville:     Vim-syntaksiväri ainakin sekosi justiin. Pitää kaivella
            sivulta/githubista joku parempi, ehkä?
:Ville:     Hah, se olikin vain nbsp siellä välissä. Se perkele pitäisi hävittää 
            jollain ilveellä.

.. |for| replace:: for-looppi
.. default-role:: literal

