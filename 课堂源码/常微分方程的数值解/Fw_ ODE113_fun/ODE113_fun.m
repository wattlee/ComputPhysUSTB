%adams
function dy=ODE113_fun(t,y)
dy=zeros(2,1);
dy(1)=3*y(1)+1.5*y(2);
dy(2)=1.2*y(1)+0.8*y(2);
