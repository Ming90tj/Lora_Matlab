clc;
t0=0;
t1=0.063;
samp_rate= 1e3;
t = t0:1/samp_rate:t1;
N = length(t);
df = samp_rate/(N-1);
F = (0:N-1)*df;
y1=chirp(t,150,t1,199.20635,'linear',30);
y2=chirp(t,150,t1,199.20635,'linear',-60);
c1=y1+sqrt(-1)*y2;
y3=chirp(t,-100,t1,100,'linear',0);
y4=chirp(t,-100,t1,100,'linear',-90);
c2=y3+sqrt(-1)*y4;
F1=20*log10(abs(fft(c1)));
F2=20*log10(abs(fft(c2)));
%% 
angc1 = (180*angle(c2(1)))/pi;
angcc1 = (180*angle(c2(64)))/pi;
%% 
upbase = c2.*c2;
F3=20*log10(abs(fft(upbase)));
dobase = c2.*(conj(c2));
F31=20*log10(abs(fft(dobase)));
%% 
upchirp = c1.*c2;
F4=20*log10(abs(fft(upchirp)));
dochirp = c1.*conj(c2);
F41=20*log10(abs(fft(dochirp)));
%% 
% F3=fft(c1)/N;
% F4=fft(c2)/N;
% figure(1);
% subplot(211)
% plot(F,abs(F3));
% subplot(212)
% plot(F,abs(F4));
figure(1)
subplot(211)
plot(F(1:N),F1(1:N));
title('specturm of 30');
subplot(212)
plot(F(1:N),F2(1:N));
title('specturm of 0');
%% 
figure(2)
subplot(211)
plot(F,F3);
title('upchirp * upchirp (phase 0 * phase 0)');
subplot(212)
plot(F,F31);
title('upchirp * downchirp (phase 0 * phase 0)');
%% 
figure(3)
subplot(211)
plot(F,F4)
title('upchirp * upchirp (phase 30 * phase 0)');
subplot(212)
plot(F,F41);
title('upchirp * downchirp (phase  30 * phase 0 )');
%% 
% figure(4)
% subplot(211)
% plot(

