#!/bin/bash

#Prompt user
echo
echo "===== DAGSORDEN BUILDER ======"
echo
while [ -z "$NAVN" ]
do
  read -p "Navn på møde: " NAVN
done
read -p "Dato for møde: " DATO
read -p "Tidspunkt for møde: " TIDSPUNKT
read -p "Mødested: " STED
read -p "Evt. kommentarer: " KOMMENTARER
read -p "Afbud: " AFBUD
read -p "Kommer senere: " KOMMERSENERE
read -p "Går før: " GAAFOER

#Copy template
DIRNAME=Dagsorden_${NAVN// /_}
cp -r Skabelon $DIRNAME
rm -f $DIRNAME/name.txt

#Search and replace in LaTeX files
sed -i "s/meeting.*/meeting}{$NAVN}/g" $DIRNAME/variables.tex
sed -i "s/dato.*/dato}{$DATO}/g" $DIRNAME/variables.tex
sed -i "s/tid.*/tid}{$TIDSPUNKT}/g" $DIRNAME/variables.tex
sed -i "s/location.*/location}{$STED}/g" $DIRNAME/variables.tex
sed -i "s/kommentarer.*/kommentarer}{$KOMMENTARER}/g" $DIRNAME/variables.tex
sed -i "s/afbud.*/afbud}{$AFBUD}/g" $DIRNAME/variables.tex
sed -i "s/kommersenere.*/kommersenere}{$KOMMERSENERE}/g" $DIRNAME/variables.tex
sed -i "s/gaafoer.*/gaafoer}{$GAAFOER}/g" $DIRNAME/variables.tex

echo "=============================="

#Make the thing
if [ $1 != "nomake" ]
then
make -C $DIRNAME NAME=${NAVN// /_}
fi
