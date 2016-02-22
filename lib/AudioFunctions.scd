a= a?();
/* OSC */a.o = {|f=440,p=0,m=1,a=0| [LFCub, LFSaw, LFTri, LFPar, LFPulse, LFGauss].choose.ar(f,p,m,a)};//{a[\o].()}.play
/* Noise */a.n = {|m=1| [WhiteNoise, BrownNoise, ClipNoise, PinkNoise, GrayNoise].choose.ar(m) };//{a[\n].(0.1)}.play
/* LFO */a.l = {|f=440,m=1,a=0| [LFNoise0, LFNoise1, LFNoise2].choose.ar(f,m,a) };//{a[\o].(a[\l].(2,100,200))}.play

/* Ppar Matrix */a.parMatrix = {|i, deg, dur, name=\default| Ppar( Array.fill(i, { |j| Pbind(\instrument,  name, \degree,Pn(Plazy({Pseq(deg)})), \dur,Pn(Plazy({Pseq(dur)})) )}))};//a[\parMatrix].(3,15.fib,1/18.fib.scramble).play

/* Freq Octaver for synth */a.freqOctaver = {|f=440, o=0| ((f.cpsmidi%12) + (12*o)).midicps};//a[\freqOctaver].(f:54,o:4);
