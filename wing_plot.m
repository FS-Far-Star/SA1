clear, close all

xmax = 1.0;
xmin = 0.0;
ymax =  .5;
ymin = -.5;

pathin=[pwd,'/Geometry/'];
[filein,pathin]=uigetfile([pathin '*.surf']);
y=load([pathin,filein]);
x=y(2:end-1,1);
y=y(2:end-1,2);
L=length(x);
I=(x-1).^2+y.^2; I=find(I==max(I)); I=I(1);
Xbk=x;
Ybk=y;hZ=[];
axisZ=[];
aZ=[];
Res=get(0); Res=Res.ScreenSize;

[xs ys] = splinefit([1;x;1],[0;y;0],0);

pathin_1=[pwd,'/Geometry/'];
[filein,pathin_1]=uigetfile([pathin_1 '*.surf']);
y_1=load([pathin_1,filein]);
x_1=y_1(2:end-1,1);
y_1=y_1(2:end-1,2);
L=length(x_1);
I=(x_1-1).^2+y_1.^2; I=find(I==max(I)); I=I(1);
Xbk=x_1;
Ybk=y_1;hZ=[];
axisZ=[];
aZ=[];
Res=get(0); Res=Res.ScreenSize;
h=figure('units','normalized',...
    'outerposition',[.05 .2 1.35*Res(4)/Res(3) .6],...
    'DockControls','off',...
    'MenuBar','none',...
    'name','Wing Analysis Section Generator (Matlab version)',...
    'NumberTitle','off');
a=axes('position',[.10,.10,.87,.87]);
[xs_1 ys_1] = splinefit([1;x_1;1],[0;y_1;0],0);

hold on
plot(xs,ys,'--', 'Color',[1 0 0]);
plot(xs_1,ys_1,'-', 'Color',[0 0 1]);
legend('E58 mk2','E58 mk3')
axis equal
axis([xmin xmax ymin ymax])