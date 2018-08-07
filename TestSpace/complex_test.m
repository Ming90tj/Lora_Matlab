
[y, N, f] = complex_Chirp(0, 1, 10, 20, 1e3, 0);
% 
% Y=fft(real(y));
% Y2=fft(imag(y));
% Y1=fft(y);
% y3 = Y + Y2;
% figure(1)
% subplot(211);
% plot(f(1:N),Y(1:N));
% subplot(212);
% plot(f(1:N),angle(Y(1:N))*180/pi);
% figure(2)
% subplot(211);
% plot(f(1:N),Y2(1:N));
% subplot(212);
% plot(f(1:N),angle(Y2(1:N))*180/pi);
% figure(3)
% subplot(211);
% plot(f(1:N),Y1(1:N));
% subplot(212);
% plot(f(1:N),angle(Y1(1:N))*180/pi);
% figure(4)
% plot(f(1:N),y3(1:N));
t = 0:1/1e3:1;
plot(t,real(y),'b',t,imag(y),'r')