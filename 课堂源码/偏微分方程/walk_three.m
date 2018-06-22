clear 
N=100; 
M=500;  
re=zeros(M*3,N); 
for ii=1:N-1 
    for jj=1:M 
        if rand <(2/3)      
            if rand<(1/3)          
                re(jj*3-1,ii+1)=re(jj*3-1,ii)+sign(rand-0.5);
                re(jj*3-2,ii+1)=re(jj*3-2,ii);         
                re(jj*3,ii+1)=re(jj*3,ii);      
            else
                re(jj*3-2,ii+1)=re(jj*3-2,ii)+sign(rand-0.5);
                re(jj*3-1,ii+1)=re(jj*3-1,ii);
                re(jj*3,ii+1)=re(jj*3,ii);
            end
        else
            re(jj*3,ii+1)=re(jj*3,ii)+sign(rand-0.5); 
            re(jj*3-2,ii+1)=re(jj*3-2,ii); 
            re(jj*3-1,ii+1)=re(jj*3-1,ii); 
        end
    end
end
plot(sum(re.^2,1)/M)  
title('Random walk in three dimension') 
xlabel('step number (= time)') 
ylabel('<r^2>')

