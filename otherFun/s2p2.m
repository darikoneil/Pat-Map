[F] = plot_ROIs(ops,stat);

bounds = [ops.Lx,ops.Ly];

numNeur = length(stat);

LIST = double(iscell(:,1)).*(transpose(1:length(iscell)));
LIST(LIST==0)=[];

im = ones(bounds);
figure
A = jet(numel(LIST));

xlim([0 bounds(1)]);
ylim([0 bounds(2)]);

hold on


for i = 1:numel(LIST)
    ypix = double(stat{LIST(i)}.ypix).*double(~(stat{LIST(i)}.overlap));
    ypix(ypix==0)=[];
    xpix = double(stat{LIST(i)}.xpix).*double(~(stat{LIST(i)}.overlap));
    xpix(xpix==0)=[];
    b = boundary(transpose(xpix),transpose(ypix));
    %fill(xpix(b),ypix(b),A(i,:),'FaceAlpha',0.25);
    %fill(xpix(b),ypix(b),'r');
    plot(xpix(b),ypix(b),'k');
end

hold off

hold on
for a = 1:numel(F)
    ypix = double(stat{LIST(F(a))}.ypix).*double(~(stat{LIST(F(a))}.overlap));
    ypix(ypix==0)=[];
    xpix = double(stat{LIST(F(a))}.xpix).*double(~(stat{LIST((F(a)))}.overlap));
    xpix(xpix==0)=[];
    b = boundary(transpose(xpix),transpose(ypix));
    %fill(xpix(b),ypix(b),A(i,:),'FaceAlpha',0.25);
    fill(xpix(b),ypix(b),'r','FaceAlpha',0.5);
    %plot(xpix(b),ypix(b),'k');
end

hold off

hold on

for a = 1:numel(G)
    ypix = double(stat{LIST(G(a))}.ypix).*double(~(stat{LIST(G(a))}.overlap));
    ypix(ypix==0)=[];
    xpix = double(stat{LIST(G(a))}.xpix).*double(~(stat{LIST((G(a)))}.overlap));
    xpix(xpix==0)=[];
    b = boundary(transpose(xpix),transpose(ypix));
    %fill(xpix(b),ypix(b),A(i,:),'FaceAlpha',0.25);
    fill(xpix(b),ypix(b),'b','FaceAlpha',0.5);
    %plot(xpix(b),ypix(b),'k');
end


hold off

hold on
for a = [31 156 189]
    ypix = double(stat{LIST(a)}.ypix).*double(~(stat{LIST(a)}.overlap));
    ypix(ypix==0)=[];
    xpix = double(stat{LIST(a)}.xpix).*double(~(stat{LIST(a)}.overlap));
    xpix(xpix==0)=[];
    b = boundary(transpose(xpix),transpose(ypix));
    %fill(xpix(b),ypix(b),A(i,:),'FaceAlpha',0.25);
    fill(xpix(b),ypix(b),'y','FaceAlpha',0.5);
    %plot(xpix(b),ypix(b),'k');
end
hold off