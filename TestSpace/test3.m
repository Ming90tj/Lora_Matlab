clc
clear all
samp_rate = 1e3;
t= 0 :1/samp_rate:1;
N = length(t);
df = samp_rate/(N-1);
F = (0:N-1)*df;
y1 = chirp(t,-30,1,30);
a2 = chirp(t,-30,1,30,'linear',-90);
y2 = sqrt(-1).*a2;
y3 = y1 + y2;
lo = 0.5 * cos(2*pi*100*t) + sqrt(-1)*0.5 * sin(2*pi*100*t);
figure(1)
subplot(211)
plot(t,real(y3),'b',t,imag(y3),'r')
subplot(212)
plot(t,lo)
%% 
Y1 = abs(fft(y1));
LO = abs(fft(lo));
Y2 = abs(fft(y2));
Y3 = abs(fft(y3));
figure(2)
subplot(411)
plot(F,Y1);
subplot(412)
plot(F,LO,'b',F,angle(lo),'r');
subplot(413)
plot(F,Y2);
subplot(414)
plot(F,Y3)
%% 
f2 = y1.*lo;
f3 = y2.*lo;
F2 = abs(fft(f2));
F3 = abs(fft(f3));
F4 = abs(fft(y3.*lo));
figure(3)
subplot(311)
plot(F,F2)
subplot(312)
plot(F,F3)
subplot(313)
plot(F,F4)
%% 
g1= y3.*conj(y3);
G1 = abs(fft(g1));
figure(4)
plot(F,G1)