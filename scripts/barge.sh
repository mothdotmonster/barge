#!/bin/sh

# barge - display progress bars in the shell

# USAGE: barge.sh [length of bar] [percentage filled]

pchr="#" # positive character
nchr="." # negative character

tlen="$1" # total length
perc="$2" # percentage
unset pbar nbar # prevent problems if script is ran repeatedly

plen=$(( $(( perc * tlen )) / 100)) # get positive length
nlen=$(( tlen - plen )) # get negative length 

while [ "$plen" -ne 0 ]; do # add pchr to pbar plen times
	pbar="$pbar""$pchr"	
	plen=$(( "$plen" - 1 )) 
done

while [ "$nlen" -ne 0 ]; do # add nchr to nbar nlen times
	nbar="$nbar""$nchr"
	nlen=$(( "$nlen" - 1 ))
done

printf "%s" "$pbar" # print pbar
printf "%s" "$nbar" # print nbar