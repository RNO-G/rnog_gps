
rev=E
if [[ -f /REV ]] ; 
then 
  rev=`cat /REV` 
fi
echo "rev is $rev"


if [[ $rev == "F" ]] 
then
export UBXOPTS="-P 29.20"
else
export UBXOPTS="-P 22.00"
fi 
