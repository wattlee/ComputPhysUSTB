function [x,k,flag]=gsdl(A,b)
%    - A �������ϵ������ nxn
%    - b ��������Ҷ���
%	 - delta ����1e-5
%	 - max1 ������������Ĭ��100��
%    - w Ϊ���ɳ�����
n = length(A); k=0;
x = zeros(n,1); y = zeros(n,1); flag ='OK!' ;
delta = 1e-5; max1 = 100;
while 1
    y = x;
    for i=1:n
        z=b(i);
        for j=1:n
            if j~=i
                z=z-A(i,j)*x(j);
            end
        end
        if abs(A(i,i))<1e-10|k==max1
            flag='Fail!'; return;
        end
        z=z/A(i,i); x(i)=z;
    end
    if norm(y-x,inf)<delta
        break;
    end
    k=k+1;
end
