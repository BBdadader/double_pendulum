% Time
tspan = 0:0.1:100;

% Initial Conditions:
y0 = [theta0_nopi*pi;0; phi0_nopi*pi; 0];

% Solve the problem using ode45
options=odeset('RelTol',1e-7);
[tout,yout]=ode45(@(t,y) double_pen(t,y,m,l,g) , tspan,y0,options);
theta = yout(:,1);
phi = yout(:,3);
%phase of theta(t) and phi(t)
phase = plot(app.UIAxes2,tout,theta,'b',tout,phi,'r');
legend(app.UIAxes2,'\theta','\phi');
%axis(app.UIAxes2,[0 10 -4 4])
%phase of theta(phi)
pha = plot(app.UIAxes3,theta,mod(phi));
% Post-process: plot the pendulum


hold(app.UIAxes,'on');
axis(app.UIAxes,[-20 20 -20 20],'square')
%set(app.UIAxes,gca,'DataAspectRatio',[1 1 1]);
px(1)=0;
py(1)=0;
px(2)=l(1)*sin(yout(1,1));
py(2)=0-l(1)*cos(yout(1,1));
px(3) = px(2) + l(2)*sin(yout(1,3));
py(3) = py(2) - l(2)*cos(yout(1,3));
px2=px(2);
py2=py(2);
px3=px(3);
py3=py(3);
sol=plot(app.UIAxes,px,py,'XDataSource','px','YDataSource','py','Color','k','LineWidth',2);
marker=plot(app.UIAxes,px2,py2,'o','XDataSource','px2','YDataSource','py2', ...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor','k',...
    'MarkerSize',m(1)^0.5);
marker2=plot(app.UIAxes,px3,py3,'o','XDataSource','px3','YDataSource','py3', ...
    'MarkerEdgeColor','k',...
    'MarkerFaceColor','k',...
    'MarkerSize',m(2)^0.5);
%try
    for i=1:length(tout)
        px(2)=l(1)*sin(yout(i,1));
        py(2)=0-l(1)*cos(yout(i,1));
        px(3) = px(2) + l(2)*sin(yout(i,3));
        py(3) = py(2) - l(2)*cos(yout(i,3));
        px2=px(2);
        py2=py(2);
        px3=px(3);
        py3=py(3);
    
        refreshdata(sol,'caller');
        refreshdata(marker,'caller');
        refreshdata(marker2,'caller');
    
        drawnow;
    end
%catch oException
%    msgbox(oException.message)
%end

