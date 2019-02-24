# Skabelon til dagsordener

Dette projekt forsøger at gøre det så let og hurtigt som muligt at lave dagsordener til møderne i RUS-1
Katrinebjerg.

Projektet kan bruges på Linux systemer eller på Windows med [CygWin](https://www.cygwin.com/) installeret. Det er vigtigt at inkludere pakken *make* i installationen (søg efter *make* under installationen af CygWin).

Derudover anbefales det at bruge en terminal-emulator som fx [Cmder](https://cmder.net/), men *cmd.exe* eller *Windows PowerShell* kan også bruges.

#Guide

Før brug er det vigtigt, at den (eller de) ønskede outputmapper indtastes i Makefile i mappen Skabelon [(/Skabelon/Makefile)](Skabelon/Makefile). Dette gøres ved at skrive den korrekte sti i variablerne *OUTPUTDIR1* og *OUTPUTDIR2*.

```Makefile
OUTPUTDIR1 = Z:\Rusture\2019 Sommer\Formandsgruppen\Dagsordener
OUTPUTDIR2 = Z:\Rusture\2019 Sommer\Dagsordner og referater
```

Hvis det kun ønskes, at der skal outputtes en PDF ét sted, så slettes variablen *OUTPUTDIR2* og følgende linje slettes:

```Makefile
deploy: latex name
	cp "$(PRINTNAME).pdf" "$(OUTPUTDIR1)\$(PRINTNAME).pdf"
	cp "$(PRINTNAME).pdf" "$(OUTPUTDIR2)\$(PRINTNAME).pdf" #SLET MIG! <-------------------
```

I root-directory for projektet ligger [et bash-script kaldet buildscript.sh](buildscript.sh). Dette script tager brugerens input og bygger dagsordenen. Derudover ligger en [Makefile](Makefile), som blot eksekverer scriptet, enten på Windows (default) eller på linux med *make buildLinux*

Efter dagsordenen er blevet bygget kan lokale ændringer (såsom tilføjelse af afbud) ske under det subdirectory, der bliver oprettet. Der kan IKKE foretages ændringer i output-filerne ved at køre [Makefile](Makefile) fra root directory. Man skal ændre de lokale filer og køre en Makefile direkte fra subdirectory, fx *Dagsorden_Stormøde_3/Makefile*.
