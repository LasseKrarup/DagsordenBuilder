#!/bin/bash

#Prompt user
echo
echo "===== DAGSORDEN BUILDER ======"
echo
echo "Bemærk! Virker kun til at bygge en ny dagsorden."
echo "Ændringer foretages efterfølgende i den mappe, der bliver lavet"
echo
read -p "Navn på møde: " NAVN
read -p "Dato for møde: " DATO
read -p "Tidspunkt for møde: " TIDSPUNKT
read -p "Mødested: " STED
read -p "Afbud: " AFBUD
read -p "Kommer senere: " KOMMERSENERE
read -p "Går før: " GAAFOER

#Copy template
DIRNAME=Dagsorden_${NAVN// /_}
cp -r Skabelon $DIRNAME
rm -f $DIRNAME/name.txt

#Search and replace in LaTeX files
sed -i "s/MEETINGNAME/$NAVN/g" $DIRNAME/main.tex
sed -i "s/MEETINGDATE/$DATO/g" $DIRNAME/main.tex
sed -i "s/MEETINGTIME/$TIDSPUNKT/g" $DIRNAME/main.tex
sed -i "s/MEETINGPLACE/$STED/g" $DIRNAME/main.tex
sed -i "s/MEETINGAFBUD/$AFBUD/g" $DIRNAME/Afbud.tex
sed -i "s/MEETINGKOMMERSENERE/$KOMMERSENERE/g" $DIRNAME/Afbud.tex
sed -i "s/MEETINGGAAFOER/$GAAFOER/g" $DIRNAME/Afbud.tex

echo "=============================="

#Make the thing
make -C $DIRNAME NAME=${NAVN// /_}
