# Skabelon til dagsordener

Dette projekt forsøger at gøre det så let og hurtigt som muligt at lave dagsordener til møderne i RUS-1
Katrinebjerg.

Projektet kan bruges på Linux systemer eller på Windows med [CygWin](https://www.cygwin.com/) installeret. Det er vigtigt at inkludere pakken *make* i installationen (søg efter *make* under installationen af CygWin).

Derudover anbefales det at bruge en terminal-emulator som fx [Cmder](https://cmder.net/), men *cmd.exe* eller *Windows PowerShell* kan også bruges.

# Før brug (vigtigt)

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

## Tilføj afbud, gå-før og/eller kommer-senere til eksisterende dagsorden

1. Åbn en terminal
1. Skriv `make afbud`
1. Indtast navnet på en eksisterende dagsorden uden ordet "Dagsorden" og uden underscores. For en fil kaldet "Dagsorden_Stormøde_1_foreløbig" vil navnet være "Stormøde 1 foreløbig"
1. Tilføj afbud, gå-før eller kommer-senere. Efterlad feltet blankt for ikke at tilføje nogen. Afslut indtastning med <ENTER>

## Tilføj kommentarer

1. Åbn en terminal
1. Skriv `make comment`
1. Indtast navnet på en eksisterende dagsorden uden ordet "Dagsorden" og uden underscores. For en fil kaldet "Dagsorden_Stormøde_1_foreløbig" vil navnet være "Stormøde 1 foreløbig"
1. Tilføj en kommentar og afslut med <ENTER>
