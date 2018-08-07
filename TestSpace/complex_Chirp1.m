function [ ComplexSignal, NumberPonit] = complex_Chirp1( t0, t1, f0, f1, samp_rate, shift_N)
%complex_Chirp1 此处显示有关此函数的摘要
%   此处显示详细说明:
%   t0 信号的起点,单位秒
%   t1 信号的终点, t1 >  t0,单位秒
%   samp_rate, 采样率在t0~t1之间的采样率
%   shift_k, 偏移量, 偏移量应该大于0, 将基础的chirp信号往右移动 sample_rate * shift_k 个单位时间量
t = t0: 1/samp_rate : t1;
NumberPonit = length(t);
f_step = (f1 - f0 + 0.1)/NumberPonit;
t_step =  (t1 - t0 + 0.01)/NumberPonit;
f_shift = shift_N * f_step;
t_shift = shift_N * t_step;
tt = t0 : 1/samp_rate : (t0 + t_shift); 
y1 = chirp (tt , f0 + f_shift , t0 + t_shift , f1);
y1_angl=(180 * angle(y1(shift_N)))/pi;
tt1 = (t0 + t_shift + t_step): 1/samp_rate : t1;
y2 = chirp (tt1 , f0 , t1 , f1 - f_step ,'linear' , y1_angl);
yy = [y1,y2];
y3 = chirp (tt , f0 + f_shift , t0 + t_shift , f1 , 'linear' , -90);
y4 = chirp (tt1 , f0 , t1 , f1 - f_step ,'linear' , y1_angl-90);
yy1 = [y3,y4];
ComplexSignal= yy1 + sqrt(-1)*yy2;

end

