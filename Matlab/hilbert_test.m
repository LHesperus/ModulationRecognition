% Hilbert transform testing
clc
clear all
close all
 
ts = 0.001;
fs = 1/ts;
N = 200;
f = 50;
k = 0:N-1;
t = k*ts;
 
% signal transform
% 结论：sin信号Hilbert变换后为cos信号
y = sin(2*pi*f*t);
yh = hilbert(y);    % matlab函数得到信号是合成的复信号
yi = imag(yh);      % 虚部为书上定义的Hilbert变换
 
figure
subplot(221)
plot(t, y)
title('原始sin信号')
subplot(222)
plot(t, yi)
title('Hilbert变换信号')
 
% 检验两次Hilbert变换的结果（理论上为原信号的负值）
% 结论：两次Hilbert变换的结果为原信号的负值
yih = hilbert(yi);
yii = imag(yih);
max(y + yii)
 
% 信号与其Hilbert变换的正交性
% 结论：Hilbert变换后的信号与原信号正交
sum(y.*yi)
 
% 谱分析
% 结论：Hilbert变换后合成的复信号的谱没有大于奈氏频率的频谱，即其谱为单边的
NFFT = 2^nextpow2(N);
f = fs*linspace(0,1,NFFT);
Y = fft(y, NFFT)/N;
YH = fft(yh, NFFT)/N;
 
%figure
subplot(223)
plot(f,abs(Y))
title('原信号的双边谱')
xlabel('频率f (Hz)')
ylabel('|Y(f)|')
subplot(224)
plot(f,abs(YH))
title('信号Hilbert变换后组成的复信号的双边谱')
xlabel('频率f (Hz)')
ylabel('|YH(f)|')
