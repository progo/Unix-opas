Ensimmäinen yhteys
------------------

Ensimmäistä yhteyttään ei yleensä jännitä samalla tavalla kuin toista tai
kolmatta yhteyttä.  Ensimmäistä yhteyttä ottaessaan sitä lukee hyvin mielin
tutoriaaleja ja lähteitä, miten se oikein tehdään. Toisella kerralla sitä
uskoo omaan muistikapasiteettiinsa vähän liikaa, ja sitten hermostuu, kun ei
muistakaan seuraavaa askelta ulkomuistista.

:Ville:         Eli jos mä ymmärrän oikein, niin komennan `ssh
                ville@viuhka.fi`?
:Matias:        Polulle on monta reittiä. On valittava joskus oikean ja väärän
                välillä. Ymmärräthän, mitä olet komentamassa?
:Ville:         Sähköpostissa on samanlainen skeema. Tunnus on `ville` ja
                palvelin on `viuhka.fi`.

                Puttyssä sitten vastaavasti tunnus ja palvelin laitetaan
                haluttuihin kohtiin.

Tietenkään, se ei ole `ssh` mitä ihmiset jännittävät. Se on vain väline päästä
käsiksi Unix-shelliin. Shell, tuo komentorivien valtias. Shell on ohjelma,
joka tavallisesti ottaa vastaan tekstiä käyttäjältä, ja suorittaa muita
ohjelmia sitten annetun syötteen mukaan. Shell on ensimmäisten
päätetietokoneiden myötä syntynyt *batch*-henkinen tapa vuorovaikuttaa
tietokoneiden kanssa.

:Ville:         Ööh, eli mikä toi bäts on?
:Matias:        Annat syötteen koneelle kokonaisuudessaan, ja kone ajaa sen.
                Sen jälkeen voit komentaa lisää. Nykyisin on enemmän
                vuorovaikutteisista ohjelmista kyse, jossa jokainen tehtävä
                suunnitellaan yhdessä koneen ja käyttäjän kanssa, ja sitten
                lopuksi kone suorittaa sen.
:Ville:         Aha. Eikö se ole vähän kankeeta sitten?
:Matias:        Monissa hommissa ei tarvitse interaktiivisuutta. Niissä,
                joissa tarvitaan, on sitten interaktiiviset valikot sun muut.

Kaikilla käytännön tasoilla tarkasteltuna `ssh`-asiakasohjelmalla (esimerkiksi
PuTTy tai Linuxien `ssh`) yhteyden ottaminen Unix-palvelimeen on samanlaista
etäkäyttöä kuin vaikka Windowsien etätyöpöydän ajaminen. Onneksi puhtaasta
tekstistä koostuvien konsoliohjelmien ajaminen on sujuvaa hitaammallakin
nettiyhteydellä.
