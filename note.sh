note=$1
duration=$2

i=1
while [ $i -le $duration ]
do
	echo $note
	(( i++ ))
done
