clc
c1 = csvread('upchirp.csv');
c2 = csvread('downchirp.csv');
N = length(c1);
t = 1:1:N;
% subplot(211)
% plot(t,real(c1),'b',t,imag(c1),'r');
% subplot(212)
% plot(t,real(c2),'b',t,imag(c2),'r');
df = 1e4/(N-1);
F = (0:N-1)*df;
F1=abs(fft(c1));
F2=20*log10(abs(fft(c1)));
upbase = c1.*c1;
F3 =abs(fft(upbase));
%% 
figure(1)
subplot(211)
plot(t(1:N),F1(1:N));
title('specturm of upchirp');
subplot(212)
plot(t(1:N),F2(1:N));
title('specturm of downchirp');
%% 
figure(2)
plot(t(1:N),F3(1:N));
%% 
figure(3)
plot(t,real(upbase),'b',t,imag(upbase),'r');
