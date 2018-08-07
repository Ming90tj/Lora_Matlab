function [ upchirp,downchirp ] = baseChirp( N , phaseAccum )
%   [upchirp,downchirp] = basechirp(N,phaseAccum)
%   \param N samples per chirp sans the oversampling
%   \param phaseAccum runing phase accumlator value
%   return upchirp a 1 X N the base upChirp signal
%   return downchirp a 1 X N the base downChirp signal
%   Detailed explanation goes here
    upchirp = 1:N;
    phase = -pi;
    for i = 1:N
        phaseAccum = phaseAccum + phase;
        upchirp(i) = cos(phaseAccum) + sqrt(-1)*sin(phaseAccum);
        phase = phase + (2*pi)/N;
    end
    downchirp = conj(upchirp);
end

