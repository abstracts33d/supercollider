(
o = Server.local.options;
['blockSize',256,'memSize',8192,'numOutputBusChannels',2].clump(2).do{|item i| ("o."++item[0]++"="++item[1]).compile.value.postln};
s = Server(\Krach, NetAddr("127.0.0.1", 57111), o);
['makeWindow','scope','freqscope','boot'].do{|item|('s.'++item).compile.value}
)

s.quit

(
p = ProxySpace.push(s);
p.makeTempoClock(1)
p.fadeTime=0;
p.quant=0;
)
