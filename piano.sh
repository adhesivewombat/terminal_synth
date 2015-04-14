declare -i duration

pitch=$1
duration=$2
octave=$3

# Pitch is determined by the number of characters in the string: "aa" is an octave higher than "aaaaa"
# Calculate the # of characters for octave n-1 by multiplying the # of characters in n by 2 and adding 1

case $octave in
	"0")
		s="aaaaaaaaaaaaaaaaaaaaaaa"
		duration=$(echo "scale=0; ($duration / (23/5))"|bc)
		dot="|"
	;;
	"1")
		s="aaaaaaaaaaa"
		duration=$(echo "scale=0; ($duration / (11/5))"|bc)
		dot="            |"
	;;
	"2")
		s="aaaaa"
		dot="                        |"
	;;
	"3")
		s="aa"
		duration=$(echo "scale=0; ($duration * (5/2)/1)"|bc);
		dot="                                    |"
	;;
	*) echo "Not a valid octave"; exit;;
esac

declare -i fq
# The frequencies are offset by 4 whole steps to match the pitch of a piano
case $pitch in
	"c"|"C") 				fq=3136;echo "$dot";;
	"c#"|"db"|"C#"|"Db") 	fq=3322;echo " $dot";;
	"d"|"D")				fq=3520;echo "  $dot";;
	"d#"|"eb"|"D#"|"Eb")	fq=3729;echo "   $dot";;
	"e"|"E")				fq=3951;echo "    $dot";;
	"f"|"F")				fq=4186;echo "     $dot";;
	"f#"|"gb"|"F#"|"Gb")	fq=4434;echo "      $dot";;
	"g"|"G")				fq=4698;echo "       $dot";;
	"g#"|"ab"|"G#"|"Ab")	fq=4978;echo "        $dot";;
	"a"|"A")				fq=5274;echo "         $dot";;
	"a#"|"bb"|"A#"|"Bb")	fq=5587;echo "          $dot";;
	"b"|"B")				fq=5919;echo "           $dot";;
	"_")		# Rest		
				duration=$(echo "scale=0; ($duration * 245)"|bc);				
				$( dirname $0 )/note.sh $s $duration>/dev/null;exit;;
	*)	echo "Not a valid note"; exit;;
esac

# Normalize duration
ratio=$(echo "scale=4; ($fq/3136)"|bc);
duration=$(echo "scale=0; ($duration * $ratio)/1"|bc);

$( dirname $0 )/note.sh $s $duration | aplay -r $fq >/dev/null 2>&1;
	 


