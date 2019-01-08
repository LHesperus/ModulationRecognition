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
% ���ۣ�sin�ź�Hilbert�任��Ϊcos�ź�
y = sin(2*pi*f*t);
yh = hilbert(y);    % matlab�����õ��ź��Ǻϳɵĸ��ź�
yi = imag(yh);      % �鲿Ϊ���϶����Hilbert�任
 
figure
subplot(221)
plot(t, y)
title('ԭʼsin�ź�')
subplot(222)
plot(t, yi)
title('Hilbert�任�ź�')
 
% ��������Hilbert�任�Ľ����������Ϊԭ�źŵĸ�ֵ��
% ���ۣ�����Hilbert�任�Ľ��Ϊԭ�źŵĸ�ֵ
yih = hilbert(yi);
yii = imag(yih);
max(y + yii)
 
% �ź�����Hilbert�任��������
% ���ۣ�Hilbert�任����ź���ԭ�ź�����
sum(y.*yi)
 
% �׷���
% ���ۣ�Hilbert�任��ϳɵĸ��źŵ���û�д�������Ƶ�ʵ�Ƶ�ף�������Ϊ���ߵ�
NFFT = 2^nextpow2(N);
f = fs*linspace(0,1,NFFT);
Y = fft(y, NFFT)/N;
YH = fft(yh, NFFT)/N;
 
%figure
subplot(223)
plot(f,abs(Y))
title('ԭ�źŵ�˫����')
xlabel('Ƶ��f (Hz)')
ylabel('|Y(f)|')
subplot(224)
plot(f,abs(YH))
title('�ź�Hilbert�任����ɵĸ��źŵ�˫����')
xlabel('Ƶ��f (Hz)')
ylabel('|YH(f)|')
