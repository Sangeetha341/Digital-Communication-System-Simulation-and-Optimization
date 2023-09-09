function [decodedBits] = myDecoder(deinterleavedBits,repetitions)

int_decodedBits = reshape(deinterleavedBits,repetitions,[]);
decodedBits = mode(int_decodedBits)';

end

