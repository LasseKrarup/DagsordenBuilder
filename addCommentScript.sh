#!/bin/bash

#Prompt user
echo
echo "===== DAGSORDEN BUILDER ======"
echo " ---- Tilføj kommentar ------- "
echo
echo 'OBS: Navnet på et eksisterende møde indeholder ikke ordet "Dagsorden" eller underscores (_)'
echo 'Brug mellemrum i stedet for underscores og udelad ordet "Dagsorden"'
echo
while [ -z "$NAVN" ]
do
  read -p "Indtast navn på et eksisterende møde: " NAVN
done
read -p "Kommentarer: " KOMMENTARER

DIRNAME=Dagsorden_${NAVN// /_}

#Search and replace in LaTeX files
sed -i "/kommentarer/s/}\$/. $KOMMENTARER}/g" $DIRNAME/variables.tex

# Remove stuff "Ingen, " and ", "
sed -i "/kommentarer/s/Ingen\. //g" $DIRNAME/variables.tex
sed -i "/kommentarer/s/Ingen kommentarer\. //g" $DIRNAME/variables.tex
sed -i "/kommentarer/s/ingen\. //g" $DIRNAME/variables.tex
sed -i "/kommentarer/s/ingen kommentarer\. //g" $DIRNAME/variables.tex
sed -i "s/{\. /{/g" $DIRNAME/variables.tex
sed -i "s/\.\./\./g" $DIRNAME/variables.tex

echo "=============================="

#Make the thing
if [ $1 != "nomake" ]
then
make -C $DIRNAME NAME=${NAVN// /_}
fi
