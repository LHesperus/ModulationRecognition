%�����Ĺ�һ��˲ʱƵ�ʵ��Ľ׾� page 264,(5-292)
%���Ե㣨plot���Ĳ���Ӧ������ȷ�ģ������������������źţ�Ҳ��ֻ������4fsk��fm�ź�
function y=mu_f_42(a,fs,Rs)
%Rs=1000;                                                %symbol rate,if possible, it is best to estimate it.
N=length(a);
a_h=hilbert(a);
angle_a=angle(a_h);
angle_a=unwrap(angle_a);
%for i=1:length(angle_a)
%  angle_a(i)=mod(angle_a(i)-2*pi*fc*i/fs,2*pi);          %(5-295)
%end
phi_NL=angle_a-mean(angle_a);
f=fs/2/pi*(phi_NL(2:N)-phi_NL(1:N-1));
%plot(f)
m_f=mean(f);
f_m=f-m_f;
f_N=f_m/Rs;
%plot(f_N)
%�ڴ˴����������źŶη�ʽ�Ĳ��ԣ������������Ա仯
mu_f_42=mean(f_N.^4)/(mean(f_N.^2)^2);
y=mu_f_42;
end