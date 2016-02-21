r= r?();

/* Random Sequencer */r.randSeq = {|coef=0.85, l=16| ({[coef, 1-coef].windex;}!(l)).flat.replace([0], \)};//r[\randSeq].(coef:0.85, l:16)
/* Euclidean Distance */r.euclid = { |a, b| var big, small; # big, small = if( a.size > b.size, { [a, b] }, { [b, a] });
    if( small.size <= 1,  {a ++ b}   ,  {r[\euclid].(a:[].extend(small.size, a[0] ++ b[0]), b:[].extend(big.size - small.size, big[0]))} ) };//r[\euclid].(a:[1]!4,b:[\]!5);
/* E.D. All */r.eDA = {|l=8, n=5| Array.fill(n, {|i=0| r[\euclid].(a: [1]!(i+1),b: [\]!(l-(i+1)) ).flat})};
/* E.D. Offset */r.eDAO = {|l=8, n=5| Array.fill(n, {|i=0| r[\euclid].(a: [1]!(i+1),b: [\]!(l-(i+1)) ).flat.rotate(l.rand)})};
/* E.D. Rand */r.eDR = {|l=8, n=5| Array.fill(n, {i=n.rand; r[\euclid].(a: [1]!(i+1),b: [\]!(l-(i+1)) ).flat})};
/* E.D. Offset */r.eDRO = {|l=8, n=5| Array.fill(n, {i=n.rand; r[\euclid].(a: [1]!(i+1),b: [\]!(l-(i+1)) ).flat.rotate(l.rand)})};
/* Recursive Subdivision */r.rSubDiv = {|l=4, n=3, d=2| l = l.asArray; l = Array.fill(l.size, {|i| var div = d.rand+1; ((l[i]/div)!div).flat.scramble}).flat.scramble;
    if( n>1, {r[\rSubDiv].(l:l,n:n-1,d:d)}   ,  { l } ); };//r[\rSubDiv].(l:[3,1],n:4,d:2)
/* Recursive RandomDivision */r.rRandDiv = {|durs, n=1, l=1, h=3| var j; if((n>0) == true)
    { durs=durs.asArray; durs = durs.collect{|dur| j = rrand(l,h); Array.fill(j, dur/j)}.flat; r.[\rRhythms].(durs:durs,n:n-1); }{ durs } };//r[\rRandDiv].(durs:[8],n:2,l:3,h:4);
