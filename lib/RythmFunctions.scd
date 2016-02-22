r= r?();

/* Random Sequencer */r.randSeq = {|coef=0.85, l=16| ({[coef, 1-coef].windex;}!(l)).flat.replace([0], \)};//r[\randSeq].(coef:0.85, l:16);

/* Euclidean Distance */r.euclid = { |a, b| var big, small; # big, small = if( a.size > b.size, { [a, b] }, { [b, a] }); if( small.size <= 1,  {a ++ b}   ,  {r[\euclid].(a:[].extend(small.size, a[0] ++ b[0]), b:[].extend(big.size - small.size, big[0]))} ) };//r[\euclid].(a:[1]!4,b:[\]!5)/*.flat*/;

/* Recursive Subdivision */r.rSubDiv = {|l=4, n=3, d=2| l = l.asArray; l = Array.fill(l.size, {|i| var div = d.rand+1; ((l[i]/div)!div).flat.scramble}).flat.scramble; if( n>1, {r[\rSubDiv].(l:l,n:n-1,d:d)}   ,  { l } ); };//r[\rSubDiv].(l:r[\euclid].(a:[4.rand]!4,b:[0]!4),n:4,d:2);

/* Recursive RandomDivision */r.rRandDiv = {|durs, n=1, l=1, h=3| var j; if((n>0) == true)    { durs=durs.asArray; durs = durs.collect{|dur| j = rrand(l,h); Array.fill(j, dur/j)}.flat; r.[\rRandDiv].(durs:durs,n:n-1); }{ durs } };//r[\rRandDiv].(durs:r[\euclid].(a:[4.rand]!4,b:[0]!3),n:2,l:3,h:4);
