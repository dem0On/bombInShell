#!/bin/bash

mdp=""
mdpDeBase="1004"
debut=$(date +%s)
calculTemps=0
tempsRef=60
secondeRest=0
actuelle=$(date +%s)
bombIsExploded=true




while [ "$bombIsExploded" != false ]
do
let "calculTemps=$actuelle-$debut"
let "secondeRest=$tempsRef-$calculTemps"
echo -n -e "\033[1K"
echo -n -e "\r $secondeRest secondes. Donner un mot de passe: "
read -s -t 60 mdp
if [ $mdp == $mdpDeBase ]
then
echo -n -e "\033[1K"
echo -e "\r mot de passe bon, bombe désamorcé"
bombIsExploded=false
else
echo -n -e "\033[1K"
echo -n -e "\r mauvais mot de passe"
sleep 1
actuelle=$(date +%s)
let "calculTemps=$actuelle-$debut"
let "secondeRest=$tempsRef-$calculTemps"
echo -n -e "\033[1K"
echo -n -e "\r Temps restant: "$secondeRest" secondes"
fi
actuelle=$(date +%s)
let "calculTemps=$actuelle-$debut"
let "secondeRest=$tempsRef-$calculTemps"

if [ $secondeRest -le 0 ]
then
echo "La bombe à explosée"
bombIsExploded=false
fi
done


