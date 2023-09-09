function [deinterleavedBits] = myDeinterleaver(demodulatedBits,repetitions)

int_deinterleavedBits = reshape(demodulatedBits,[],repetitions)';
deinterleavedBits = reshape(int_deinterleavedBits,[],1);

end