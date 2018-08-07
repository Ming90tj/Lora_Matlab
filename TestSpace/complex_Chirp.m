function [ ComplexSignal, NumberPonit, Freq ] = complex_Chirp( t0, t1, f0, f1, samp_rate, shift_N)
%complex_Chirp �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��:
%   t0 �źŵ����,��λ��
%   t1 �źŵ��յ�, t1 >  t0,��λ��
%   samp_rate, ��������t0~t1֮��Ĳ�����
%   shift_k, ƫ����, ƫ����Ӧ�ô���0, ��������chirp�ź������ƶ� sample_rate * shift_k ����λʱ����
t = t0: 1/samp_rate : t1;
NumberPonit = length(t);
df = samp_rate/(NumberPonit-1);
Freq = (0:NumberPonit-1)*df;
y1 = chirp(t, f0, t1, f1);   %y1 is cos signal 
y2 = chirp(t, f0, t1, f1, 'linear',-90); %y2 is sin signal
z = y1 + sqrt(-1)*y2;   %z is complex chirp signal
ComplexSignal((shift_N + 1) : NumberPonit) = z (1 : (NumberPonit - shift_N));
ComplexSignal(1 : shift_N) = z ((NumberPonit - shift_N + 1) : NumberPonit);
end

