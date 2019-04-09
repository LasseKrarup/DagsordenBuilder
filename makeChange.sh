#!/bin/bash

#Prompt user
echo
echo "===== DAGSORDEN BUILDER ======"
echo " ---- Ændr eksisterende ----- "
echo
echo 'OBS: Navnet på et eksisterende møde indeholder ikke ordet "Dagsorden" eller underscores (_)'
echo 'Brug mellemrum i stedet for underscores og udelad ordet "Dagsorden"'
echo 'Efterlad et felt blank for ikke at ændre det'
echo
while [ -z "$NAVN" ]
do
  read -p "Indtast navn på et eksisterende møde: " NAVN
done
read -p "Nyt navn på møde (opretter en ny dagsorden): " NYTNAVN
read -p "Dato for møde: " DATO
read -p "Tidspunkt for møde: " TIDSPUNKT
read -p "Mødested: " STED
read -p "Evt. kommentarer: " KOMMENTARER
read -p "Afbud: " AFBUD
read -p "Kommer senere: " KOMMERSENERE
read -p "Går før: " GAAFOER


DIRNAME=Dagsorden_${NAVN// /_}

if [ ! -z "$NYTNAVN" ]; then #if not empty
  cp -r $DIRNAME Dagsorden_${NYTNAVN// /_} #copy directory
  DIRNAME=Dagsorden_${NYTNAVN// /_} #change dirname
  sed -i "s/meeting.*/meeting}{$NYTNAVN}/g" $DIRNAME/variables.tex #change name
fi

############## ############### ################
############ Ændring i formalia ################
############## ############### ################
if [ ! -z "$DATO" ]; then
sed -i "s/dato.*/dato}{$DATO}/g" $DIRNAME/variables.tex
fi

if [ ! -z "$TIDSPUNKT" ]; then
sed -i "s/tid.*/tid}{$TIDSPUNKT}/g" $DIRNAME/variables.tex
fi

if [ ! -z "$STED" ]; then
sed -i "s/location.*/location}{$STED}/g" $DIRNAME/variables.tex
fi

############## ############### #################
############## ÆNDRING I AFBUD #################
############## ############### #################

#Search and replace in LaTeX files
if [ ! -z "$AFBUD" ]
then
sed -i "/afbud/s/}\$/, $AFBUD}/g" $DIRNAME/variables.tex
fi

if [ ! -z "$KOMMERSENERE" ]
then
sed -i "/kommersenere/s/}\$/, $KOMMERSENERE}/g" $DIRNAME/variables.tex
fi

if [ ! -z "$GAAFOER" ]
then
sed -i "/gaafoer/s/}\$/, $GAAFOER}/g" $DIRNAME/variables.tex
fi

# Remove stuff "Ingen, " and ", "
sed -i "/afbud/s/Ingen, //g" $DIRNAME/variables.tex
sed -i "/kommersenere/s/Ingen, //g" $DIRNAME/variables.tex
sed -i "/gaafoer/s/Ingen, //g" $DIRNAME/variables.tex
sed -i "s/{, /{/g" $DIRNAME/variables.tex

################################################
############ Ændring i kommentar ###############
################################################

#Search and replace in LaTeX files
sed -i "/kommentarer/s/}\$/. $KOMMENTARER}/g" $DIRNAME/variables.tex

# Remove stuff "Ingen. " and ". " and ".."
sed -i "/kommentarer/s/Ingen\. //g" $DIRNAME/variables.tex
sed -i "/kommentarer/s/Ingen kommentarer\. //g" $DIRNAME/variables.tex
sed -i "/kommentarer/s/ingen\. //g" $DIRNAME/variables.tex
sed -i "/kommentarer/s/ingen kommentarer\. //g" $DIRNAME/variables.tex
sed -i "s/{\. /{/g" $DIRNAME/variables.tex
sed -i "s/\.\./\./g" $DIRNAME/variables.tex
sed -i "s/\s\.//g" $DIRNAME/variables.tex

echo "=============================="

#Make the thing
if [ $1 != "nomake" ]
then
make -C $DIRNAME NAME=${NAVN// /_}
fi
