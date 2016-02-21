h= h?();

/* 12 Tones Row Generator */h.tone12 = {|n=1| (Array.fill(12,{|i| i}).scramble!n).flat};//h[\tone12].(n:1)
/* Interval Inverter */h.intInv = {|a| Array.fill(a.size, {|i| (a[0]-a[i] + a[0]);})};//h[\intInv].(a:[1,3,5])
/* Interval Inverter Same Octave */h.intInvO = {|a| Array.fill(a.size, {|i| var d = (a[0]-a[i] + a[0]); if(d>11, {d=d-12;});if(d<0, {d=d+12;}); d})};//h[\IntInvO].(a:[1,3,5])
/* Scale Matrix */h.scaleMat = {|d| Array.fill(d.size, {|i| d.rotate(-1*i).postln}) };//h[\scaleMat].(d:[0,2,4,5,7,9,11]);
/* Chord Matrix */h.chordMat = {|d, i, n| Array.fill(d.size, {|l| Array.fill(n, {|j| [0,2,4,5,7,9,11].wrapAt((j*(i-1))+l)}).postln}) };//h[\chordMat].(d:[0,2,4,5,7,9,11], i:3, n:3);
