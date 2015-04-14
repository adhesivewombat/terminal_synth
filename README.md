# terminal_synth
Project to play sound files via terminal. Uses aplay to output sound.

The piano.sh file will take paramaters:

  pitch - (c,d,e,f,g,a,b,C,D,E,F,G,A,B,c#,d#,f#,a#,C#,D#,F#,A#,db,eb,gb,ab,bb,Db,Eb,Gb,Ab,Bb)
  
  duration - (Positive Integer) somewhat arbitrary, may depend on processor/sound card. Duration 240 is about a second.
  
  octave - (0,1,2,3) Determines octave, 0 being the lowest in freq, 3 being the highest.
  
and generate a string and duration to pipe to aplay which will create a sound.

An example command to send to piano.sh would be "./piano.sh g 200 1" Which will play a 'G' in octave 1 for duration 200

Running "./suite1.sh" will start a sequence of piano.sh calls to play Bach's Cello Suite No. 1 

I would eventually like to write an intepreter for midi files.
