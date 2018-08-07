clc 
N = length(upchirp);
t= 1:N;
f = syncword.*upchirp;
f1 = syncword1.*upchirp;
F1 = abs(fft(f));
F2 = abs(fft(f1));
%% plot dechirp sepcturm region
figure(1)
subplot(411)
plot(F1);
title('sync0 fft');
subplot(412)
plot(F2);
title('sync1 fft');
subplot(413)
plot(abs(fft(upchirp1.*upchirp)));
title('sync0 defft')
subplot(414)
plot(abs(fft(downchirp.*upchirp)));
title('sync1 defft')
%% plot time region
figure(2)
subplot(411)
plot(t,real(syncword),'b',t,imag(syncword),'r');
subplot(412)
plot(t,real(syncword1),'b',t,imag(syncword1),'r');
subplot(413)
plot(t,real(downchirp),'b',t,imag(downchirp),'r');
subplot(414)
plot(t,real(upchirp1),'b',t,imag(upchirp1),'r');
%% plot 
figure(3)
subplot(411)
plot(abs(fft(syncword)))
subplot(412)
plot(abs(fft(syncword1)))
subplot(413)
plot(abs(fft(upchirp)))
subplot(414)
plot(abs(fft(downchirp)))