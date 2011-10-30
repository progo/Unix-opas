Työnohjaus komentorivillä
=========================

Vaikka komentorivi onkin aika peräkkäismuotoinen ratkaisu, ollaan kaukana
DOS-ajoista, ja eri ohjelmia voidaan jättää taustalle ajamaan, tai vaihdella
ohjelmien välillä kuin ikkunoissa konsanaan.

Ikkunoiduissa maailmoissa voimme pienentää ikkunan taustalle, jos pitää
keskittyä toiseen ikkunaan. Jos ohjelma tekee jotain aikaaviepää, se voi tehdä
sitä taustalla aivan rauhassa. Samanlaiset ohjausmenetelmät löytyvät
komentoriviltäkin hieman alkeellisemmassa muodossa. Seuraavassa luvussa
`Screen`_ sitten käsittelemme hieman monipuolisemman tavan suorittaa moniajoa.

Suspensio
---------

Kun olet tekemässä jotain komentorivillä -- vaikkapa editoimassa tiedostoa --
ja sinulle tuleekin tarve hypätä komentoriville vaikkapa katsomaan, onko
sinulle tullut uutta sähköpostia, voit toki sulkea editorisi ja avata
sähköpostisi.  Tai voit *keskeyttää* editorisi, panna se nukkumaan. Miten sitä
nyt kuvailisi. Joka tapauksessa: oli se ohjelmasi sitten jokin kokoruudun
sovellus tai jokin pienempi ohjelma, sen voi panna nukkumaan komentamalla
`<C-z>`. Mitä seuraavaksi tapahtuukaan: päädyt takaisin komentoriville ja
ohjelmasi on nyt nukkumatilassa.

Nyt voit puuhastella sähköpostisi tai minkä tahansa tehtävän parissa.  Tässä
tilassa (*suspended*) se ohjelma ei tee mitään, eli ei varsinaisesti suorita
mitään. Jos sille jäi homma kesken, niin se homma on pysähdyksissä.

Kun olet valmis palaamaan ohjelmasi pariin, voit komentaa `fg`, eli
(*foreground*) tuodaksesi ohjelman takaisin etualalle. Onkos sinulla
vaihtoehtoja? Kyllä on -- jos ohjelmasi on jokin sellainen, joka ei kaipaa
käyttäjän huomiota, voit laittaa sen suorittumaan taka-alallekin. Tällöin
komento on luonnollisesti `bg` (*background*).

Tausta-ajoon suunnattuja ohjelmia on aika paljonkin, esimerkiksi kaikki
graafiset ohjelmat ovat sen terminaalin kannalta aika tausta-ajoisia. Voit
laittaa sovelluksen suorittumaan *välittömästi* taka-alalle heittämällä
`&`-merkin komentorivin loppuun::

    $ xcalc &

panisi esimerkiksi graafisen laskinohjelman taustalle pyörimään. Tässä
tapauksessa se kuitenkin olisi etualalla, koska ikkunointi pelaa. 

Jobs
----

Sinulla voi olla useita ohjelmia samanaikaisesti nukkumassa. Voit käyttää vain
yhtä kerrallaan, koska terminaalissa ei tunneta usean ikkunan käsitettä. Loput
(tai kaikki) ovat unitilassa. Listauksen ohjelmista näet komentamalla `jobs`::

    # Tämä on zsh:ssä näkyvä listaus
    $ jobs
    [1]  - suspended  vi fo.vim
    [2]  + suspended  sc matikat.sc

    # tässä on bashin antama listaus
    $ jobs
    [1]-  Stopped                 vi fo.vim
    [2]+  Stopped                 sc matikat.sc

Työt ovat numeroituja, joten jos haluat palata `sc`-ohjelman
(taulukkolaskenta) pariin, komento olisi `fg %2`. Sille annetaan
prosenttimerkki työtunnuksen mukaisesti. Kiltti shelli (kuten kustomoitu
`zsh`) voi palauttaa töitä nimenkin mukaan::

    # ainakin zsh osaa, bashista en tiedä
    $ fg %vi
    ... palauttaa vi-alkuisen prosessin

Vastaavalla tavalla voit heittää jotain tausta-ajoon. Ja aina voit palata
komentoriville pysäyttämällä suorituksen jälleen `<C-z>`:llä. Hieman kankeata
ehkä, mutta systeemillä on rajansa.

`ps`
----

Toisenlainen näkemys on Unixien perintökalu `ps` (*processes*) ja se toimittaa
windowsien Task Managerin virkaa, mutta vain raportointimuodossa. Jos annat
pelkän komennon `ps`, se listaa sinulle kyseisestä komentorivistä käynnistetyt
prosessit ja joitain tietoja niistä::

    $ ps
      PID TTY          TIME CMD
    23620 pts/6    00:00:00 zsh
    30823 pts/6    00:00:00 ps

Tässä listauksessa näemme vain shellin yksinään, sekä tämän `ps`-ohjelman,
jonka on luonnollisesti oltava ajossa, jotta se voisi tehdä mitään.

Tämä ohjelma pystyy tekemään varsin kattaviakin listauksia, mutta tämän oppaan
kannalta pelkkä `ps` ja kenties komento `ps u` ovat mielekkäimmät. Listataan
erilaisia listauksia niistä prosesseista, jotka ovat sinun ajossasi. Graafisia
ohjelmia ja demoneita sinun nimiisi käynnistettynä lisää `x` mausteeksi. Jos
systeemin oikeudet riittävät, `ps aux` antaa kokonaisen listan kaikesta, mitä
tietokone jauhaa. Näisä tiedoista tarvitsemme oikeastaan vain ensimmäistä, eli
PID-numeroa (*process id*) seuraavaa kappaletta varten. Ehkäpä pieni `ps fu`
valaisee myös prosessien omistussuhteita::

    $ ps fu
    USER       PID %CPU %MEM  TTY   TIME COMMAND
    progo    23620  0.0  0.0  pts/6 0:00 zsh
    progo    31204  0.0  0.0  pts/6 0:00  \_ ps uf
    progo    23607  0.0  0.1  pts/5 0:01 zsh
    progo    29547  0.1  1.0  pts/5 0:03  \_ vim fieldtest.rst
    progo    15667  0.0  0.0  pts/7 0:00 zsh
    progo     4425  0.0  0.7  pts/4 4:23 irssi
    progo     3581  0.0  0.0  pts/3 0:00 zsh
    progo     5606  0.0  0.0  pts/3 0:00  \_ tail -n 100 -f /var/log/messages
    progo     5607  0.0  0.1  pts/3 0:18  \_ /usr/bin/csi -script koodi/messages
    progo     3565  0.0  0.1  pts/2 0:05 zsh
    progo     3536  0.0  0.0  pts/0 0:00 zsh
    progo      319  0.0  0.0  pts/0 0:00  \_ screen -rd i

Katsoin parhaaksi hieman tiivistää esitystä, jotta se mahtuisi nätisti tähän.
Pientä visuaalisuutta antava flagi `f` piirtää puumuotoon sen, mitä on
mistäkin ohjelmasta käynnistetty. Ja kun jotain avaa shellin kautta, shelli on
sen prosessin eräänlainen äiti. Flagin `u` avulla saamme jonkinlaisen listan
komentoriviltä käynnistettyjä ohjelmia. Graafiset ohjelmat eivät näy tässä
listassa; sitä varten pitää heittää vielä `x`-flagi mukaan.

Etätyöskentelyssä tuskin näet näin montaa `zsh`-istuntoa auki, mutta
työpöydällä ikkunoita on herkästi liikaakin auki, ja jokaisessa on oltava
shell-istunto päällä.

Kill
----

Joskus prosessi voi kenkkuilla, ja sitten se on lopetettava. Unixeissa
puhutaan tappamisesta, mutta kyseessä ei ole väkivaltainen termi.
Englannissahan puhutaan valojenkin tappamisesta, vaikka halutaan vain
sammuttaa ne.

Perinteiseen malliin ohjelma `kill` vaatii tietääkseen prosessin tunnuksen,
eli PID-numeron. Prosessin tulee olla omasi, tämä ei ole mikään Windows 98.
Edelläolevasta listauksesta voisin poimia vaikkapa irssin PID-numeron 4425.
Sen sulkeminen etänä kävisi näin::

    $ kill 4425

Ja sinne meni. Numeroiden muistaminen on aika hankalaa, joten moderneissa
systeemeissä on usein ohjelma `pkill`, joka on oikeastaan pieni sekoitelma
`ps`:ää, `grep`:iä ja `sed`:iä. Niiden avulla voit antaa hakusanan, jolla
etsitään sopivia prosesseja tapettavaksi::

    $ pkill irssi

Toinen vaihtoehto `pkill`:lle on `killall`, joka tekee suunnilleen saman. Kill
ei oikeastaan tapa mitään itse, vaan lähettää signaalin eteenpäin, ja kerneli
tekee likaisen työn. Tämä signaali voi olla jotain aivan muuta kuin
lopettamista, mutta erikoisemmat käytöt jätetään itseopiskeluksi (`man kill`).
