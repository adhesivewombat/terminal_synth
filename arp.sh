
i=1
a="a"
while [ $i -le 4 ]
do
	seq -s $a 100 | aplay;
	a=$a$a
	(( i++ ))
done

i=1
a="!"
while [ $i -le 4 ]
do
	seq -s $a 100 | aplay;
	a=$a$a
	(( i++ ))
done

i=1
a="1"
while [ $i -le 4 ]
do
	seq -s $a 100 | aplay;
	a=$a$a
	(( i++ ))
done

i=1
a="1"
while [ $i -le 4 ]
do
	seq -s $a 100 | aplay;
	a=$a$a
	(( i++ ))
done



