# Skabelon til dagsordener

Dette projekt forsøger at gøre det så let og hurtigt som muligt at lave dagsordener til møderne i RUS-1
Katrinebjerg.

Projektet kan bruges på Linux systemer eller på Windows med [CygWin](https://www.cygwin.com/) installeret. Det er vigtigt at inkludere pakken *make* i installationen (søg efter *make* under installationen af CygWin).

Derudover anbefales det at bruge en terminal-emulator som fx [Cmder](https://cmder.net/), men *cmd.exe* eller *Windows PowerShell* kan også bruges.

# Før brug (vigtigt)

Det anbefales at mappe BlackBoard RUS-mappen til din computer. Derved kan du uploade dagsordenerne direkte til det fælles drev for max tjekkethed. [Følg denne guide på Windows 10](https://www.laptopmag.com/articles/map-network-drive-windows-10) for at mappe drevet. Under "Folder:" indtastes det link, man finder på BlackBoard ved at åbne fællesdrevet på BlackBoard og vælge "Set Up Web Folder".

Før brug er det vigtigt, at den (eller de) ønskede outputmapper indtastes i Makefile i mappen Skabelon [(/Skabelon/Makefile)](Skabelon/Makefile). Dette gøres ved at skrive den korrekte sti i variablerne *OUTPUTDIR1* og *OUTPUTDIR2*.

```Makefile
OUTPUTDIR1 = Z:\Rusture\2019 Sommer\Formandsgruppen\Dagsordener #Indsæt din sti her
OUTPUTDIR2 = Z:\Rusture\2019 Sommer\Dagsordner og referater #...og her hvis du vil have 2 outputs. Ellers læs nedenfor
```

Hvis det kun ønskes, at der skal outputtes en PDF ét sted, så slettes variablen *OUTPUTDIR2* og følgende linje slettes:

```Makefile
deploy: latex name
	cp "$(PRINTNAME).pdf" "$(OUTPUTDIR1)/$(PRINTNAME).pdf"
	cp "$(PRINTNAME).pdf" "$(OUTPUTDIR2)/$(PRINTNAME).pdf" #SLET MIG! <-------------------
```

# Guide

## Opret ny dagsorden

1. Åbn en terminal
1. Skriv `make` på Windows eller `make buildLinux` på Linux

Du vil nu blive bedt om at udfylde fx mødenavn (oprydningsmøde, stormøde 1...), dato, tidspunkt osv. Der er ingen formatteringskrav, så følgende er fx muligt:

```
$ Dato for møde:          Torsdag d. 5. april
$ Tidspunkt for møde:     kl. 16:00
```

## Lav en ændring på eksisterende dagsorden

1. Åbn en terminal
1. Skriv `make afbud`
1. Indtast navnet på en eksisterende dagsorden uden ordet "Dagsorden" og uden underscores. For en fil kaldet "Dagsorden_Stormøde_1_foreløbig" vil navnet være "Stormøde 1 foreløbig"
1. Tilføj de ønskede ændringer
	* Et nyt navn vil lave en kopi af den nuværende dagsorden med et nyt navn og tilføje de ændringer, du måtte tilføje
	* Hvis et felt ikke ønskes ændret, skal det blot efterlades blankt (tryk <ENTER> uden at indtaste noget)
	* Hvis der er indtastet et nyt navn, vil den gamle dagsorden ikke blive slettet. Dette er med vilje, da man så let kan lave "foreløbige" og "endelige" dagsordener

# Future work

* Port til OS X (Mac)
* Konverter Windows-udgave til Batch-script, så man undgår CygWin
* Lav skidtet om fra bunden, så det ikke bruger Makefiles (hvilket bliver brugt på en ret retarderet måde i det her projekt, men jeg vidste ikke bedre, da jeg startede...)
