%% Linear Chirp
% Generate a chirp with linear instantaneous frequency deviation. The chirp
% is sampled at 1 kHz for 2 seconds. The instantaneous frequency is 0 at t
% = 0 and crosses 250 Hz at t = 1 second.

% Copyright 2015 The MathWorks, Inc.


%% 
clc

t = 0:1/1e3:2;
% y1 = chirp(t, -10, 2, 10);   %y1 is cos signal 
% y2 = chirp(t, -10, 2, 10, 'linear',-90); %y2 is sin signal
% z = y1 + sqrt(-1)*y2;   %z is complex chirp signal
z = complex_Chirp ( 0 , 2 , 1e3, 1e3, 100);
base = complex_Chirp(0 ,2 , 1e3, 1e3,  0);
basej= conj(base);    %zj is conjugate with z
dechirp = z.*basej;
%%
% Compute and plot the time region of the chirp.
% Compute and plot the spectrogram of the chirp.
figure(1);
subplot(311);
plot (t, real(z), 'g', t, imag(z), 'r');
axis([ 0 2  -1 1]);
xlabel('Time / (s)');
ylabel('Amplitude');
title('Chirp signal');
grid on;
subplot(312);
plot (t, real(zj), 'g', t, imag(zj), 'r');
axis([ 0 2  -1 1]);
xlabel('Time / (s)');
ylabel('Amplitude');
title('Chirp signal');
grid on;
subplot(313);
plot (t,real(dechirp), 'g',t,imag(dechirp),'r');
axis([ 0 2  -2 2]);grid on;
figure(3);
spectrogram(z ,256, 250, 256, 10, 'yaxis');
title('Linear Chirp');
