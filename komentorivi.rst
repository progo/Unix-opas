Komentorivi
===========

Komentorivin hallintaan kuuluu myös taitaa sen näppäinoikotiet. Oletuksena
`bash` ja muut modernit rivit käyttävät suositusta editorista, Emacsista,
lainattuja näppäinyhdistelmiä. Niitä on hyvä osata tehokasta käyttöä varten.

Erityisesti olet ehkä jo huomannut, että ylä- ja alanuolilla voit hakea
shellin historiasta vanhoja suorittamiasi komentoja. Ei siis tarvitse
kirjoitella `make`-komentoja montaa kertaa peräkkäin, vaan voit hakea
edellisen suoritetun komennon `<Up>`-näppäimen avulla. Vaihtoehtoisesti voit
kelailla rivejä `<C-n>` (next) ja `<C-p>` (previous) -näppäimien avulla.

Itse rivilläkin voit tehdä kaikenlaista. Nopeasti rivin alkuun hyppääminen on
monesti tarpeen, koska komentoja pitää vaihdella (esimerkiksi `cd ..foobar..`
-komennon sijaan pitäisikin listata kyseisen hakemiston tiedostot). Se toki
onnistuu Windows-tapaan `<Home>`-nappulalla, mutta komentorivit tukevat
Emacsista tuttua `<C-a>` (alkuun) ja `<C-e>` (loppuun) -näppäinyhdistelmiä.
Niiden avulla on vähintäänkin kätevä loikkia.

Jos näppäimistössäsi ei olisi nuolinäppäimiä, voisit silti liikkua eteen- ja
taaksepäin (edelleen) Emacsista  lainatuilla `<C-b>`- ja `<C-f>`-näppäimillä.
Bee niin kuin *backwards* ja äf kuten *forwards*.  Voit hyppiä sanojenkin
välillä (vastaa Windowsien `C-left`/`C-right` -yhdistelmiä) vaihtamalla
kontrollin sijalle altin, eli `<M-b>` ja `<M-f>`.  Näillä liikutaan yleensä
sanojen välillä, mutta pysähdytään kaikenlaisiin erikoismerkkeihinkin. Kuten
pisteisiin tai sulkuihin. 

Rivin voit myös keskeyttää, eli jos et haluakaan suorittaa mitään ohjelmaa.
Sitä ei tarvitse backspacella pyyhkiä pois, vaan voit painaa tuttua
keskeytysnappia `<C-c>`, jolloin saat uuden kehotteen tilalle.

Ruudun voit tyhjentää joko `clear` -komennolla (vastaa Dossin `cls`-komentoa)
mutta valmis näppäin löytyy: `<C-l>`.

Erittäin ovela kikka on myös suoraan automaattisesti liittää edellisen
suoritetun komennon *viimeinen* sana osaksi nykyistä komentoa
näppäinyhdistelmällä `<M-.>`. Paina useita kertoja kierrättääksesi eri
komentojen viimeisiä argumentteja::

    $ ls auto
    ...
    $ ls foo/bar
    ...
    $ cd <M-.>   =   cd foo/bar
    $ cd <M-.>   =   cd auto

Tällä tavalla saat säästettyä paljon näppäilysormiasi!

Automaattitäydennys
-------------------

Tiedostojen ja hakemistojen nimiä ei sinun tulisi juuri koskaan kirjoittaa
käsin kokonaan. Pitkästä nimestä riittää kirjoittaa vain vähän alkua ylös ja
painamalla `<Tab>`-näppäintä shell tekee puolestasi paljon. Käytä tätä aina
kun mahdollista! Huomaat samalla, jos olet etsimässä tiedostoa väärästä
paikasta -- mikä ei löydy tabitäydennyksellä, ei yleensä olekaan olemassa. Tai
se ei ainakaan näy bashille. Se voi siis huomauttaa jo etukäteen sinua, että
nyt on typotettu jossain.

Sekä bash että zsh tukevat myös paljon muita täydennettäviä juttuja.
Esimerkiksi yleisimpien ohjelmien asetusflagit ja sen sellaiset ovat monesti
täydennettävissä. Tämä vaatii erillistä logiikkaa, jota yleensä pluginien
muodossa lisätään shellin jatkeeksi. Näitä voi itsekin kirjoitella, mutta
kyseessä on edistynyt tekniikka, johon voin vain suositella manuaaleja ja
muuta kirjallisuutta.

Haku historiasta
----------------

Eräs tärkeimpiä ominaisuuksia on shellin kyky muistaa jo suoritettuja
komentoja, jotta niitä ei aina tarvitse kirjoittaa aina alusta. Edellä kävimme
jo alkeellisimman tavan selata historiaa, eli ylä- ja alanuolet. On kuitenkin
nopea keino hakea hyvinkin kaukaisia komentoja, jos niistä muistetaan jotain.
Voimme nimittäin hakea historiasta.

Tämä menetelmä on niinsanottu *reverse incremental search* ja se on oletuksena
kytketty helppohakuiseen näppäinyhdistelmään `<C-r>`. Oletetaan, että olet
joskus kauan aikaa sitten komentanut jonkin monimutkaisen ja vaikean komennon,
ja nyt haluat suorittaa saman uudestaan. Voit joko naputella sen kokonaan
uusiksi (huono), tai naputella ylänuolta todella pitkään kunnes oikea osuma
löytyy (aika huono), tai sitten voit etsiä historiasta komentamalla
`<C-r>scp`, ja yllättäen bash ehdottaakin jo sinulle jotain komentoa, jonka
olet aikaisemmin suorittanut, ja jossa esiintyy sana `scp`, joka on
sattumoisin tiedostonsiirto-ohjelma.

Tätä komentoa kannattaa opetella käyttämään. Käytä komentoa `history`
tehdäksesi listaa viimeaikoina suoritetuista komennoista ja sitten voit ottaa
jonkin sieltä malliksi, jonka 'koetat' hakea. Haun voi keskeyttää `<C-c>`:llä
ja ehdotetun komennon voi toki suorittaa enteriä näpyttämällä.

Editoi riviä isommin
--------------------

Komentoriviä ei tarvitse välttämättä editoida ollenkaan paikanpäällä, jos et
halua. Ainakin bash tukee näppäinyhdistelmää `<C-x><C-e>`, jolla nykyisen
komentorivin sisältö otetaan ylös tiedostoon ja käynnistetään vapaavalintainen
editori. Editorissa voit pyöritellä komentoriviä kuten mieli tekee, ja lopuksi
tallennat ja suljet editorin. Siinä kohtaa shell tulee väliin ja suorittaa
kyseisen tiedoston sisällön.

Tämä menetelmä on erityisesti pidempien litanioiden, kuten vaikkapa
`for`-silmukoiden, hienosäätöön soveltuva työkalu. Editorissa ei välttämättä
saa hyvää tabitäydennystä pikkujutuille, joten tarpeesta riippuen valitse
sopiva työkalu sopivaan ongelmaan.

Jatkoon
-------

Näillä perusteilla pääset jo pitkälle, mutta matka ei ole edes kunnolla
alkanut. Voit nimittäin komentorivillä tehdä aivan valtavat määrät sellaista
editointia, johon ei edes Wördillä pystyisi. Tutustu `bash`:n ohjeisiin (`man
bash`, kts Manpageista kertova osio) ja tutustu mm. seuraaviin ominaisuuksiin:

- leikkaa ja kopioi komentorivillä
- luo näppäilymakroja eliminoimaan puuduttavia näppäinyhdistelmiä
- käännä tekstiä isolla tai pienellä kirjoitetuksi yhden näppäinyhdistelmän
  voimin
- kumoa, tai tee uudestaan muutoksia
- käännä kirjainten tai sanojen paikkaa rivillä yhden yhdistelmän voimin

Totisesti. Suuri osa isojen editorien (Emacs, vi) kapasiteetista on siirretty
myös suoraan komentoriville käsiteltäväksi, vaikka tarvetta on hyvin harvoin.
Itse ainakin suosin mieluummin siirtymistä omaan editoriin kuin yrittäisin
kaiken tehdä rivillä suoraan.
