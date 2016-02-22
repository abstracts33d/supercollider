h= h?();

/* 12 Tones Row Generator */h.tone12 = {|n=1| (Array.fill(12,{|i| i}).scramble!n).flat};//h[\tone12].(n:1)
/* Chord Matrix */h.chordMat = {|d,l=3|d=d.degrees.as(Array);Array.fill(d.size,{|j|Array.fill(l,{|i| d.wrapAt(j+(i*2))}) }) };//h[\chordMat].(d:Scale.choose,l:4);
