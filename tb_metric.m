% tb_metric
xmin=-2;
xmax=+2;
s=xmin:.1:xmax;
m=repmat(s',1,numel(s));
r=[ xmin xmax ];
offset=5;

for i=0:3
  llr=metric(i,s',s);
  surf(m',m,llr+offset);
  hold on;
  z=image(r,r,llr,'CDataMapping','scaled');
  hold off;
  pause(1)
end
