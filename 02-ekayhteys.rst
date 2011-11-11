Ensimmäinen yhteys
==================

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

:Ville:         Ööh, eli mikä toi *bäts* on?
:Matias:        Annat syötteen koneelle kokonaisuudessaan, ja kone ajaa sen.
                Sen jälkeen voit komentaa lisää. Nykyisin on enemmän
                vuorovaikutteisista ohjelmista kyse, jossa jokainen tehtävä
                suunnitellaan yhdessä koneen ja käyttäjän kanssa, ja sitten
                lopuksi kone suorittaa sen.
:Ville:         Aha. Eikö se ole vähän kankeeta sitten?
:Matias:        Monissa hommissa ei tarvitse interaktiivisuutta. Niissä,
                joissa tarvitaan, on sitten interaktiiviset valikot sun muut.

Kaikilla käytännön tasoilla tarkasteltuna `ssh`-asiakasohjelmalla (esimerkiksi
Windows-ympäristössä PuTTy ja OpenSSH Linux/Unix-maailmoissa; komentoriviltä
ajettava `ssh`) yhteyden ottaminen Unix-palvelimeen on samanlaista etäkäyttöä
kuin vaikka Windowsien etätyöpöydän ajaminen. Onneksi puhtaasta tekstistä
koostuvien konsoliohjelmien ajaminen on sujuvaa hitaammallakin
nettiyhteydellä, sekä rajoitetummistakin ympäristöistä, kuten älypuhelimista
onnistuu etäkäyttö.

Jos olet itse Linux-ympäristössä, kuten Ubuntussa, ei sinun tietenkään
tarvitse ottaa ssh-yhteyksiä minnekään, vaan voit avata Terminaalin tai
vastaavan, jolla voit tutustua komentorivin saloihin yhtä hyvin kuin etänäkin.

Hei Unix?
---------

Mainittakoon, että puhumme tässä oppaassa Unixeista, vaikka oikeasti Linux ei
edes ole tarkalleen ottaen Unix. Siis yksinkertaistetusti *Linux on yksi
Unix-variantti*. Koska valtaosa, ellei kaikki, mitä tässä oppaassa opimme,
toimii Linuxien lisäksi Unixeissa, niin puhun yleisemmällä tasolla
Unix-käytöstä.

:Ville:         *I'm in!*
:Matias:        Hieno homma.
:Ville:         Mitä tässä voi nyt sitten tehdä? Kirjoittaa tekstiä ja
                odotella kun kone vastaa?
:Matias:        Ohjelma, jota siinä "ajat" tällä hetkellä, on se kuuluisa
                shelli sitten. Todennäköisimmin shell nimeltä `bash`.
                Joskus kirjallisuudessa puhutaan kuoriohjelmista, mutta on se
                aika toivoton suomennos.


Shell-ohjelmia on monia, joista `bash` on ylivoimaisesti suosituin tänä
päivänä. Joskus saattaa nähdä myös vanhempaa `csh`-ohjelmaa käytössä.
Peruskäytössä jokainen toimii yhtä hyvin, ja erot eri shellien välillä tulevat
ilmi vasta monimutkaisempia skriptejä kirjoitellessa. Nykyisin kaksi
suositeltavinta shelliä kaikkeen käyttöön ovat `bash` ja `zsh`, joita
ylläpidetään ahkerasti. Tässä vaiheessa ei tarvitse tietää muuta kuin se, että
shell-ohjelma on oma sovelluksensa, irti käyttöjärjestelmän ytimestä. Tiedät
sitten sanoa, että se on `bash` joka kenkkuilee, eikä linux.


:Matias:        Maistelepa komentorivin taikaa.
                Komennapa vaikka::
                
                    echo Hei Unix!

:Ville:         Kyllä minä nyt `echo`:n tiedän. Ei sillä ole kyllä paljoa
                käyttöä. Tuossahan minä näen sen tekstin ilman enterin
                painamistakin!
:Matias:        Echolla on käyttönsä esimerkiksi skriptatessa.
:Ville:         Pitääkös minun osata skriptausta? PHP ei ole vahvin lajini...
:Matias:        Kun osaat luovia komentorivillä, osaat samalla skriptata.
                Voithan ottaa tästä vähän vaativamman esimerkin::

                    echo Hei $USER

:Ville:         Se näyttää keksivän nimeni jostain. On se epeli tuo `echo`.
:Matias:        Paitsi että `echo` ei ole se fiksu osapuoli. Shellisi tekee
                muunnoksen kutsuvaiheessa, ja echo näkee vain tekstin "`Hei
                ville`" tulostettavaksi.
:Ville:         Vai silleen.
:Matias:        Katsos, siten ei jokaisen pikkuohjelman tarvitse itse
                ratkaista tuota `$USER`:in merkitystä, vaan riittää että yksi
                ohjelma, shell, hoitaa sen.

