im = zeros(ops.Ly,ops.Lx);
LIST = iscell(:,1).*transpose((1:296));
LIST(LIST==0)=[];


for i = 1:numel(LIST)
    ypix = double(stat{LIST(i)}.ypix).*double(stat{LIST(i)}.overlap);
    ypix(ypix==0)=[];
    xpix = double(stat{LIST(i)}.xpix).*double(stat{LIST(i)}.overlap);
    xpix(xpix==0)=[];
    im(ypix,xpix)=i+1;
end

figure
imagesc(im);


im = zeros(ops.Ly,ops.Lx);
LIST = iscell(:,1).*transpose((1:296));
LIST(LIST==0)=[];


for i = 1:numel(LIST)
    ycirc = stat{LIST(i)}.ycirc;
    xcirc = stat{LIST(i)}.xcirc;
    im(ycirc,xcirc)=i+1;
end

figure
imagesc(im);

