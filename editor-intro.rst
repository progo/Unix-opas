Editorit
========

Editorit -- ja miten valmistautua koitokseen. Käyttäjällä on komentorivillään
täysi vapaus käyttää haluamaansa editoria tiedostojen käsittelyyn. On
kuitenkin myös tapauksia, jossa joku toinen ohjelma haluaa käyttäjän
käsittelevän tiedostoa. Hyvinkäyttäytyvä ohjelma katsoo eräästä paikasta sen
ohjelman, jota käyttäjä erityisesti haluaa käyttää.

Tämä paikka on ympäristömuuttuja `$EDITOR`. Jos tiedät jonkun komentoriviltä
ajettavan editorin, niin voit asettaa sen tämänlaisella komennolla
`bash`-sukuisissa shelleissä::

    export EDITOR=nano

Tässä asetimme editoriksi aloittelijaystävällisen `nano`-editorin. Jos `nano`
ei ole asennettuna systeemiin, on yleensä vanhempi `pico` tarjolla, ja toimii
samaan tapaan. Esimerkkejä yleisistä editoreista ovat *pico*, *nano*, *vi* ja
*emacs*.  Käsittelemme niitä jonkin verran nyt seuraavaksi, jotta tiedät,
missä mennään.

Ylläolevan `export`-rivin voi laittaa shellin käynnistystiedostoon, jotta
asetuksesi säilyy päällä jatkossakin, mutta katsellaan sitä editorikatsauksen
jälkeen. Kun osaamme editoida niitä käynnistystiedostoja.


