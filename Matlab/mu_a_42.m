%��һ��������˲ʱ���ȵĽ����ԣ��Ľ׾أ���page 264,(5-291)
%���򲻺�ʹ����֪����ô���£������Ϲ�ʽ���ģ�û��鵽����
%���ֻ��Ϊ��ʽ�ͽ������йصĻ����������´���
%mean(y_AM.^4)/(mean(y_AM.^2)^2) 
%mean(y_2ask.^4)/(mean(y_2ask.^2)^2) 
%mean(y_mask.^4)/(mean(y_mask.^2)^2)
%��������򵥲��Է���u(AM)<2,u(ask)>2,��Ȼ���ֽ�������ϵĽ���෴
function y=mu_a_42(a)
a_h=hilbert(a);   
amp_a=abs(a_h);                                        %Envelope calculation from the Hilbert transform
m_a=mean(amp_a);
%plot(amp_a)
a_n=amp_a/m_a;
a_cn=a_n-1;
%plot(a_cn)
mu_a_42=mean(a_cn.^4)/(mean(a_cn.^2)^2);
mu_a_42=mean(a.^4)/(mean(a.^2)^2);
y=mu_a_42;
end