function [ ComplexSignal, NumberPonit, Freq ] = complex_Chirp( t0, t1, f0, f1, samp_rate, shift_N)
%complex_Chirp 此处显示有关此函数的摘要
%   此处显示详细说明:
%   t0 信号的起点,单位秒
%   t1 信号的终点, t1 >  t0,单位秒
%   samp_rate, 采样率在t0~t1之间的采样率
%   shift_k, 偏移量, 偏移量应该大于0, 将基础的chirp信号往右移动 sample_rate * shift_k 个单位时间量
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

