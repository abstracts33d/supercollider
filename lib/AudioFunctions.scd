a= a?();
/* OSC */a.o = { |f=0,p=0| [LFCub, LFSaw, LFTri, LFPar, LFPulse, LFGauss].choose.ar(f,p) };
/* Noise */a.n = { |m=1| [WhiteNoise, BrownNoise, ClipNoise, PinkNoise, GrayNoise].choose.ar(m) };
/* LFO */a.l = { |...par| [LFNoise0, LFNoise1, LFNoise2].choose.ar(*par) };

/* Ppar Matrix */~attack.kr;~attack = {|attack=0.1| attack}; a.parMatrix = {|i, o=3, deg, dur, pan, amp, name| Ppar( Array.fill(8, { |j| Pbind(\instrument,  (i.asString ++ 99.rand.round).asSymbol,
	\octave, o,
	\degree, Pn( Plazy( {Pseq(t.parts.()*[1,2,3,4],1)})),
	\dur,    Pn( Plazy( {dur.interpret} ) ),
	\pan,    pan.interpret,
	\amp,    amp.interpret,
	\attack, ~attack,
	\osc, Pfunc({ |evt| n.sendMsg("instr", name.asString);}))}))};

/* Freq Octaver for synth */a.freqOctaver = {|f=440, o=0| ((f.cpsmidi%12) + (12*o)).midicps};//f[\freqOctaver].(f:54,o:4);
