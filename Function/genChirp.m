function [samps,i,phaseAccum1] = genChirp(N,ovs,NN,f0,down,ampl,phaseAccum )
%Generate a chirp 
%   [samps,i,phaseAccum1] = genChirp(N,ovs,NN,f0,ampl,phaseAccum)
%   \param N samples per chirp sans the oversampling
%   \param ovs the oversampling ratio
%   \param NN the number of samples to generate
%   \param f0 the phase offset\transmit symbol
%   \param down 1 for downchirp, 0 for upchirp
%   \param ampl the chirp amplitude
%   \param phaseAccum runing phase accumlator value
%   return samps 1 X N array the Chirp signal 
%   return i the 1XN array
%   return phaseAccum the phase accumlator value
%   Detailed explanation goes here
    fmin = -pi/ovs;
    fmax = pi/ovs;
    fstep = (2*pi)/(N*ovs*ovs);
    f = f0 + fmin;
    samps = 1:NN;
    if(down)
        for i= 1 : NN
            f = f + fstep;
            if(f > fmax) 
                f = f - (fmax - fmin);
            end
            phaseAccum = phaseAccum - f;
            samps(i) = ampl*cos(phaseAccum) + sqrt(-1)*ampl*sin(phaseAccum);
        end
    else
        for i = 1 : NN
            f = f + fstep;
            if(f > fmax)
                f= f - (fmax -fmin);
            end
            phaseAccum = phaseAccum +f;
            samps(i) = ampl*cos(phaseAccum) + sqrt(-1)*ampl*sin(phaseAccum);
        end
    end
    phaseAccum1 = phaseAccum - floor(phaseAccum/(2*pi))*2*pi;
end

