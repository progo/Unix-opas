Editorit
========

Editorit -- eli miten muokkailla ja käsitellä puhdasta tekstiä komentorivien
tekstigraafisessa maailmassa. Käyttäjällä on komentorivillään täysi vapaus
käyttää haluamaansa editoria tiedostojen käsittelyyn, kuten graafisessa
maailmassa voit valita ohjelmasi vapaasti. On myös tapauksia, jossa jokin
toinen ohjelma haluaa käyttäjän käsittelevän tiedostoa. Hyvinkäyttäytyvä
ohjelma siten katsoo eräästä paikasta sen ohjelman, jota käyttäjä erityisesti
haluaa käyttää.

Tämä paikka on ympäristömuuttuja `$EDITOR`. Jos tiedät jonkun komentoriviltä
ajettavan editorin, niin voit asettaa sen tämänlaisella komennolla
`bash`-sukuisissa shelleissä::

    export EDITOR=nano

Tässä asetimme editoriksi aloittelijaystävällisen `nano`-editorin. Jos `nano`
ei ole asennettuna systeemiin, on yleensä vanhempi `pico` tarjolla, ja toimii
samaan tapaan. Esimerkkejä yleisistä editoreista ovat *pico*, *nano*, *vi* ja
*emacs*.  Käsittelemme joitain noista jonkin verran nyt seuraavaksi, jotta
tiedät, missä mennään.

Ylläolevan `export`-rivin voi laittaa shellin käynnistystiedostoon, jotta
asetuksesi säilyy päällä jatkossakin, mutta katsellaan sitä editorikatsauksen
jälkeen. Kun osaamme editoida niitä käynnistystiedostoja.

