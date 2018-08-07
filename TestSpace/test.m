%% test spectrogram



%% generate the signal
clc;
 t0 = 0;
 t1 = 0.63;
 samp_rate = 100;
 t=0:1/samp_rate:t1;%采样步长
 tt = 0:1:63;
% N= length(t);%样点个数
% y1=chirp(t,100,1,200);
% y2=chirp(t,100,1,200,'linear',-90);
% y=y1 + sqrt(-1)*y2; %complex
% x(501:N)=y(1:(N - 500));    %shift the signal 100
% x(1:500)=y((N-499):N);

[y, N] = complex_Chirp(t0, t1, 20, 20.63, samp_rate, 0);
[x, ~] = complex_Chirp(t0, t1, 20, 20.63, samp_rate, 1);
conj_base = conj(y);    %the conj with the base chirp
dechirp = x.*conj_base;
% fs=1e3;%采样频率
% df=fs/(N-1) ;%分辨率
% f=(0:N-1)*df;%其中每点的频率
Y=fft(y)/N*2;%真实的幅值
Conj_base=fft(conj_base)/N*2;
X=fft(x)/N*2;
Dechirp = fft(dechirp)/N*2;
%% 计算幅度
phase1 = angle(y(1))*180/pi;
phase2 = angle(y(64))*180/pi;
%% plot time region
figure(1);
subplot(411);
plot(t,real(y),'b',t,imag(y),'r');%xlim([0 0.4]);
title('base chirp');
subplot(412);
plot(t, real(conj_base),'b',t,imag(conj_base),'r');%xlim([0 0.4]);
title('conj base chirp');
subplot(413);
plot(t,real(x),'b',t,imag(x),'r');%xlim([0 0.4]);
title('shift chirp');
subplot(414);
plot(t,real(dechirp),'b',t,imag(dechirp),'r');%xlim([0 0.4]);

%% plot specturm region
figure(1)
subplot(411);
plot(f(1:N),abs(Y(1:N)));
title('specturm of base-chirp');
subplot(412);
plot(f(1:N),abs(Conj_base(1:N)));
subplot(413);
plot(f(1:N),abs(X(1:N)));
title('specturm of shift chirp');
subplot(414);
plot(tt(1:N),abs(Dechirp(1:N)));
title('specturm of dechirp ');

%% plot spectrogram
% % figure(3);
% % subplot(311);
% [S,F,T,P1] = spectrogram(dechirp,kaiser(32,5),12,32,samp_rate);
% surf(T,F,10*log10(P1),'edgecolor','none');axis tight;
% view(0,90);
% xlabel('Time (Seconds)');ylabel('Hz');
% % subplot(312);
% % spectrogram(x,256,250,256,1e3,'yaxis');ylim([0 300]);
% % subplot(313);
% % spectrogram(dechirp,256,250,256,1e3,'yaxis');
%% plot spectrogram
% % figure(4);
% [~,~,~,P,Fc,Tc]=spectrogram(y,kaiser(64,32),32,64,samp_rate,'minthreshold',-30);
% plot(Tc(P>0),Fc(P>0),'. ')
% title('linear Chirp: start at 100Hz and cross 200Hz at t=1sec');
% xlabel('Time (s)')
% ylabel('Frequency (Hz)')