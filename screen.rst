Screen
======

Aiemmin esitettyyn työnohjaukseen (`jobs`, `fg`, `bg`) verrattuna nyt
esiteltävä *GNU Screen* -ohjelma on kultaa kaikilla tasoilla. Ohjelman
alkuperäinen idea on tarjota pysyviä prosesseja, jotka pyörisivät taustalla
vaikka käyttäjä kirjautuisi ulos välissä.  Palatessaan etätyöhönsä käyttäjä
voi sitten palauttaa aiemman istunnon näkösälle ja kaikki ohjelmat ovat siellä
koskemattomina.

Vastaavanlainen ohjelma on `tmux`, johon on lisätty paljon modernimpia
lähestymistapoja. Sitä en käsittele tässä oppaassa kuitenkaan --- ehkäpä joku
vieraileva luennoitsija voisi raapustaa aiheesta?

Screenin käyttö on helppoa:

* Ensin käynnistetään istunto (*sessio*) screenin sisälle esimerkiksi
  komentamalla pelkästään `screen`.
* Olemme nyt screenin sisällä, ja sinne on avautunut uusi shell-istunto.
  Voimme kirjoitella ja tehdä kuten tavallisessa shellissäkin nyt.
* Kun meille riittää, voidaan shell ja ohjelmat jättää auki screenin sisään.
  Irtaudumme screen-istunnosta näppäinyhdistelmällä `C-a d`. Jos et tähän
  hätään muista, mitä tuo tarkoittaa, niin teemme näppäinpainallukset
  peräkkäin. Ensin Ctrl-aata ja sitten deetä.
* Nyt olemme palautuneet alkuperäiseen shelliin, josta voimme kirjautua ulos
  tai tehdä mitä hyvänsä.
* Pääsemme takaisin samaan screen-istuntoon *"kytkeytymällä"* siihen.
  Komennetaan `screen -rd`.
* Ja olemme taas screenin sisällä. Kaikki on siinä tilassa kuten jätimme ennen
  edellistä irtautumista.

Ja tätä voidaan toistaa päivästä toiseen. Näin shell-käyttäjät hyödyntävät
screenin ominaisuuksia irssin kanssa, jotta heidän irc-sessionsa eivät
katkeile heidän logattua untenmaille.

Screen-istunto lopetetaan simppelisti lopettamalla kaikki sovellukset sen
sisältä.

Tässä oli perusmalli siitä, mitä useimmat ovat tulleet hakemaan screeniltä.

Screen moniajaa
---------------

Yhdessä screen-istunnossa ei tarvitse tyytyä yhteen ruutuun kuten paljaaltaan
ajettaessa. Istunto voi sisältää vaikka miten paljon prosesseja, joista
jokainen saa oman *ikkunansa*.  Näistä ikkunoista et kyllä oletuksena näe kuin
yhden kerrallaan (kunnes seuraavassa luvussa).

Oletetaan, että olemme avanneet puhtaan screen-istunnon::

    $ screen
    $           # <-- tämä on screenin sisällä avattu sessio

Voimme asettaa tänne ajamaan jotain ohjelmia ihan tavalliseen malliin. Nyt
screenin ansiosta meidän ei tarvitse keskeyttää mitään ohjelmia `C-z`:lla vaan
voimme luoda rinnakkaisen shell-session.  Tähän on komento `C-a c`. Kun
painat kyseisen kombinaation sisään, ruudulle lävähtää tuorean näköinen
shell-istunto. Vanha ei ole kadonnut mihinkään, vaan se on toisessa ikkunassa.
Nämä ikkunat eivät tarkoita mitään graafisia ruutuja, kuten tavallisesti, vaan
sillä tarkoitetaan vain yhtä näkymää yhteen prosessiin.

Tässä uudessa ruudussa voit nyt ajella jotain *toista* ohjelmaa. Ikkunoiden
välillä on helppoa hyppiä:

:`C-a <Space>`: seuraava ikkuna
:`C-a n`:     seuraava ikkuna
:`C-a p`:     edellinen ikkuna

Ikkunat luonnollisesti pyörivät silmukassa, eli kun ikkunoita on vähän, `C-a
<Space>` on luonnollinen tapa kelata oikea akkuna eteensä. Kokeilehan
ihmeessä! Luo parit sessiot ja kirjoita kuhunkin jotain tunnistettavaa
tekstiä.

Ikkunan saat suljettua taas sulkemalla siitä kaikki sovellukset. Eli monesti
se shell yksinään.

Screen ikkunoitsijana
---------------------

Oikeasti mielenkiintoinen osuus  alkaa siitä kysymyksestä, että miten voimme
valjastaa screenin jakamaan se meille annettu yksi terminaali-ikkuna useaan
osaruutuun, joissa voi pyöriä samanaikaisesti eri sovellukset.  Screen kun
nimittäin osaa tehdä sellaistakin.
 
Käytetään esiteltyjä screen-ikkunoita apunamme. Kun kussakin ikkunassa on omat
sovelluksensa ajamassa, niitä voidaan laittaa näytille *jakamalla*
screen-ruutu kahteen tai useampaan palaseen. Kussakin palasessa näkyy tasan
yksi ikkuna (tai ei ikkunaa; silloin se on tyhjää täynnä).

Jakaminen tapahtuu komennolla `C-a S` (*split*). Uudet ruudut ovat oletuksena
tyhjiä. Niihin voit joko vaihtaa jonkun olemassaolevan ikkunan tai sitten
luoda uuden ikkunan edelläesitellyin komennoin.

Ruutujen välillä tulee kyetä vaihtelemaan. Siihen on komento `C-a Tab`. Pientä
hupia saa aikaan jakamalla ruutua palasiin ja asettamalla palasiin sama ikkuna
näkyville. Tekstisi näyttää monistuvan useaan ruutuun, vaikka kyseessä onkin
sama ikkuna.

Ruutuja ei voi luoda vieretysten, vain päälletysten. Tutki `tmux`-ohjelmaa,
jos vierekkäinen näkyvyys on tärkeätä.

Ruutujen kokoa voi muuttaa `C-a +` ja `C-a -` -näppäimin.  Ruutu suljetaan
näppäinkomennolla `C-a X`. Myös screenistä irtautuminen sulkee ylimääräiset
ruudut. Ikkunat toki säilyvät, mutta joudut jakamaan ruutua aina kun screenin
panet taustalle.


Muuta kivaa screenissä
----------------------

Ja hauska ei ole vielä läheskään lopussa! Screen sisältää aivan valtavat
määrät apukeinoja kaikenlaiseen. Voit jopa havaita, että ilman screeniä ei
terminaalityöskentelystä tulisi mitään. Ainakin silloin, jos olet oikeasti
konsoliympäristössä, eli ei graafista ympäristöä ympärilläsi.

Screen-istunnon voit lukita siten, että kukaan ei pääse sitä tirkistelemään.
Joudut antamaan salasanasi jotta pääset takaisin istuntoon käsiksi. Tämä
komento on `C-a x`.

Voit myös selata ruudun tekstejä samalla tavalla kuin jos käytettävissäsi
olisi vierityspalkki. Screen käyttää sellaisia konsteja ruudun piirtämiseksi,
että luultavasti graafisen terminaaliohjelmasi omat vierityspalkit eivät toimi
kivasti! Pelko pois, sillä screenin tarjoama ikkunanselaus on erinomaista
luokkaa. Siihen pääset komentamalla `C-a <Esc>`. Nyt voit nuolinäppäimin
selailla ylöspäin kaikkea näkynyttä. (Se ei tietenkään toimi
kokoruutusovelluksien, kuten irssin tai vimin kanssa hyvin. Se ei ole iso
ongelma, koska valtaosa kokoruutusovelluksista toteuttaa omat keinot selata
backlogia.)

Mikä hienointa, tämä selausmoodi toteuttaa luultavasti *kaikki*
`less`-ohjelman työkalut. Voit jopa hakea hakusanoilla. Tätä ei totisesti
pelkällä vierityspalkilla voi toteuttaa. Vilkaisepa `less`_ -kappaleesta vähän
kertausta kaikkiin mahdollisuuksiisi. Tämän lisäksi tämä selausmoodi toteuttaa
useita `vi`-komentojakin kaupanpäälle. Pääset pois selausmoodista painamalla
Esciä. Nyt voit jatkaa ikkunan käyttöä tavalliseen malliin.

Jotta mahdollisuudet todella pääsevät oikeuksiinsa, screenissä voit myös
suorittaa kopiointia ja liittämistä kaikesta ruudullanäkyvästä.
Hiirivetoisissa systeemeissä ehkä selviää nopeammin hiiren avulla, mutta
joskus ei kursoria ole käytettävissä. Tämä malli on myös nopeampi osaavissa
käsissä.

Kopiointia voit tehdä siirtymällä mainittuun selausmoodiin ja navigoimalla
haluttuun alkamiskohtaan. Painat välilyöntiä aloittaaksei maalauksen. Nyt voit
liikkua nuolinäppäimillä tai vaikkapa `vi`-näppäimin miten haluat. Valittu
maalaus kopioidaan painamalla väliä uudestaan.

Nyt tämän kopion voi liittää mihin tahansa screen-ikkunaan sessiosi sisällä.
Näppäinkomento on `C-a ]`. Tietenkään et voi liittää minne tahansa. Kun liität
screenin kautta ohjelmaan, se näkyy ohjelmalle kuin olisit itse kirjoittanut
tekstin siinä muodossa kun se liitetään. Tämä on valtava apu esimerkiksi kun
yrität setvitellä, missä meni vikaan ja graafinen systeemi on
käyttämättömissä.

Yhteenveto
----------

No niin. Screen on iso ja monipuolinen sovellus, josta olemme vain raapaisseet
perusteet ja vain vähän pintaa syvemmältä. Parhaiten näet, mitä kaikkea tämä
ohjelma sisältää on tutkia sen manpageja (`man screen`) ja selailemalla
rauhassa listoja. 

Tehdään tänne pieni yhteenvetotaulukko esitellyistä komennoista, ja näillä
pääset alkuun.

+----------------+-------------------------------------------+
| Näppäin        | Komento                                   |
+================+===========================================+
| `C-a d`        | Irtaudu istunnosta (jätä taustalle)       |
+----------------+-------------------------------------------+
| `C-a c`        | Uusi ikkuna                               |
+----------------+-------------------------------------------+
| `C-a SPC`      | Seuraava ikkuna                           |
+----------------+-------------------------------------------+
| `C-a n`        | Seuraava ikkuna                           |
+----------------+-------------------------------------------+
| `C-a p`        | Edellinen ikkuna                          |
+----------------+-------------------------------------------+
| `C-a S`        | Jaa ruutu kahteen                         |
+----------------+-------------------------------------------+
| `C-a <Tab>`    | Vaihda palasten välillä                   |
+----------------+-------------------------------------------+
| `C-a +`        | Kasvata ruutua                            |
+----------------+-------------------------------------------+
| `C-a -`        | Kutista ruutua                            |
+----------------+-------------------------------------------+
| `C-a X`        | Sulje ruudunpalanen                       |
+----------------+-------------------------------------------+
| `C-a x`        | Lukitse screen-istuntosi                  |
+----------------+-------------------------------------------+
| `C-a <Esc>`    | Selaa ikkunan sisältöä                    |
+----------------+-------------------------------------------+
| `<Space>`      | Aloita/lopeta kopiointi (selaustilassa)   |
+----------------+-------------------------------------------+
| `<Esc>`        | Lopeta selaustila (selaustilassa)         |
+----------------+-------------------------------------------+
| `C-a ]`        | Liitä kopiointi ikkunaan                  |
+----------------+-------------------------------------------+
| `C-a ?`        | Screenin oma näppäinlistaus               |
+----------------+-------------------------------------------+
