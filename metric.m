function llr = metric(bi,x,y)

xy=x+1j*y;

w = [0.5115+1.2092j, 1.2092+0.5115j, 0.2663+0.4530j, 0.4530+0.2663j];

w0=      w ;
w1=-conj(w);
w2=+conj(w);
w3=-     w ;

pkg load communications
Wi= de2bi(0:15);
W = [w0 w1 w2 w3];

llr = zeros(size(xy));
for xi=1:size(xy,1)
for yi=1:size(xy,2)
  pow=abs(xy(xi,yi)-W).^2;
  met=1./pow;
  llr0=sum(met(Wi(:,bi+1)==0));
  llr1=sum(met(Wi(:,bi+1)==1));
  llr(xi,yi) = log( llr0/llr1 );
end
end

end
