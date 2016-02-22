//ServerOptions
s = Server.local;
o = s.options;
['blockSize',1024,'memSize',8192,'numOutputBusChannels',2].clump(2).do{|item i| ("o."++item[0]++"="++item[1]).compile.value.postln};
['makeWindow','scope','freqscope','boot'].do{|item|('s.'++item).compile.value};
//Functions
e = { |a, b| var big, small; # big, small = if( a.size > b.size, { [a, b] }, { [b, a] }); if( small.size <= 1,  {a ++ b}   ,  {e.(a:[].extend(small.size, a[0] ++ b[0]), b:[].extend(big.size - small.size, big[0]))} ) };//e.(a:[1]!4,b:[\]!5)/*.flat*/;
r = {|coef=0.85, l=16| ({[coef, 1-coef].windex;}!(l)).flat.replace([0], \)};//r[\randSeq].(coef:0.85, l:16);
//ProxySpace Boot
p = ProxySpace.push(s.boot);
