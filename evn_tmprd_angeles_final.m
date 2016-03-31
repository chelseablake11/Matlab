f = figure;
set(f, 'doublebuffer', 'on');

n=10;

r(1)=1;
for k=2:n;
    r(k)=r(k-1)*(2^(7\12));
    if r(k)>2
        r(k)=r(k)/2;
    end
    theta=(2*pi)*log2(r);
    
end

theta;



rho=ones(1,n);




xlim([-1,1])
ylim([-1,1])

for i=1:n;
  
   unit=polar(theta(i),rho(i),'.');
   drawnow;
   pause(.5); %speed
   hold on;
end