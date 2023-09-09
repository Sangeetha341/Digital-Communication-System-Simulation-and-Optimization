%% start anew statements %%
clc;
clearvars;
close all;
%% input bits(txBits) generation %%
NumBits = 10^5;                                       %input("enter number of bits to genarate :");
constellation = [-1 1];
inputBits = randi([0,1],NumBits,1);                    % txBits generation by randi function
snr_in_db = 0:10;
repetitions = 1;

for ii = 1:length(snr_in_db)
%% encoder %%
encodedBits = myRepEncoder(inputBits,repetitions);
%% interleaver %%
interleavedBits = myInterleaver(encodedBits,repetitions);
%% modulation %%
modSymbols = myModulator(interleavedBits,constellation);
%% noise generation %%
snr = 10^(ii/10);
noise = 1/sqrt(2*snr)*(randn(1,length(modSymbols)) + 1i*randn(1,length(modSymbols))); % noise generation
rxModSymbols = modSymbols + noise;                   % adding generated noise to the modSymbols
%% demodulation %%
[demodulatedSymbols,demodulatedBits] = myDemodulator(rxModSymbols,constellation);
%% deinterleaver %%
deinterleavedBits = myDeinterleaver(demodulatedBits,repetitions);
%% decoder %%
decodedBits = myDecoder(deinterleavedBits,repetitions);
%% Symbol Error Rate (SER) calculation %%
error_modSymbols = demodulatedSymbols - modSymbols;
SER= nnz(error_modSymbols)/length(error_modSymbols);
%% Bit Error Rate (BER) calculation %%
error_modBits = decodedBits - inputBits;
BER = nnz(error_modBits)/length(error_modBits);

SER_percent(ii) = SER;              % percentage of SER
BER_percent(ii) = BER;              % percentage of BER
end
%% results %%
semilogy(SER_percent,color='r')
hold on
semilogy(BER_percent,Color='b')
hold off
scatterplot(demodulatedSymbols)
