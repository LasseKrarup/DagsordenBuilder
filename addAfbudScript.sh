#!/bin/bash

#Prompt user
echo
echo "===== DAGSORDEN BUILDER ======"
echo " ------- Tilføj afbud -------- "
echo
echo 'OBS: Navnet på et eksisterende møde indeholder ikke ordet "Dagsorden" eller underscores (_)'
echo 'Brug mellemrum i stedet for underscores og udelad ordet "Dagsorden"'
echo
while [ -z "$NAVN" ]
do
  read -p "Indtast navn på et eksisterende møde: " NAVN
done
read -p "Afbud: " AFBUD
read -p "Kommer senere: " KOMMERSENERE
read -p "Går før: " GAAFOER

DIRNAME=Dagsorden_${NAVN// /_}

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

echo "=============================="

#Make the thing
if [ $1 != "nomake" ]
then
make -C $DIRNAME NAME=${NAVN// /_}
fi
