function [interleavedBits] = myInterleaver(encodedBits,repetitions)

intitial_rearrangedBits = reshape(encodedBits,repetitions,[]);
interleavedBits = reshape(intitial_rearrangedBits',[],1);

end
