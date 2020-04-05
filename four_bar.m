% Sudesh Chaudhary
% Github: https://github.com/sudesh1122
% Solution of:
% Write a MATLAB Program for Position, Velocity and Acceleration Analysis of a 4-Bar Mechanism
Mechanism
close;clc; clear;
% Parameters
% Link lengths - L1,L2,L3,L4
% Should satisfy Grasof law

L1 = 2; L2 =6 ; L3 = 8; L4 = 10;

% Adjusting the time interval

t = 0:0.05:10;
T =0:0.05:9.975;

% Angular velocity of link L1 in radian per second

omega = 3;

% So theta will be omega*time

theta = omega*t;

% Lets assume point P1 is at the origin So

p1 = [0;0];

% Lets assume point P4 is at x-axis. So the coordinates will be D distance away from the point p1 in x-dir

p4 = L4*[1;0];

% using using Analytical Method we can get the coordinate of point P2

p2 = L1*[cos(theta); sin(theta)];

% Length of P2P4

E = sqrt(L1^2 + L4^2 - 2*L1*L4*cos(theta));
alpha = asin(L1*sin(theta)./E);
beta = acos((E.^2 + L3^2 - L2^2)./(2*E*L3));

% So coordinates of point P3

p3 = [L4 - L3*cos(alpha+beta); L3*sin(alpha+beta)];

% x coordinate of point P3

p3_x = p3(1,:);

% y coordinate of point P3

p3_y = p3(2,:);

% by differentiating coordinates with respect to time we can get the
% velocity of point P3

% x-component
p3_vx = diff(p3_x)./diff(t);

% y-component
p3_vy = diff(p3_y)./diff(t);

% magnitude of the velocity of point P3
p3_v = sqrt(p3_vx.^2 + p3_vy.^2);

% by differentiating velocity components with respect to time we can get the
% acceleration of point P3

% x-component
p3_ax = diff(p3_vx)./diff(T);

% y-component
p3_ay = diff(p3_vy)./diff(T);

% megnitude of the acceleration of point P3
p3_a = sqrt(p3_ax.^2+p3_ay.^2);

for i=1:length(T)

   ani = subplot(5,1,1);
   % create small circles to show points clearly
   p1_circle = viscircles(p1',0.05);
   p2_circle = viscircles(p2(:,i)',0.05);
   p3_circle = viscircles(p3(:,i)',0.05);
   p4_circle = viscircles(p4',0.05);

   % to plot the bars, plotting line
   A_bar = line([p1(1) p2(1,i)],[p1(2) p2(2,i)]);
   B_bar = line([p2(1,i) p3(1,i)],[p2(2,i) p3(2,i)]);
   C_bar = line([p3(1,i) p4(1)],[p3(2,i) p4(2)]);

   % adjusting axises
   axis(ani,'equal');
   set(gca,'XLim',[-5 10],'YLim',[-2 11]);

   str1 = 'p3';
   % to show time
   str2 = ['Time: '  num2str(t(i)) ' s'];
   p3_text = text(p3(1,i),p3(2,i)+0.4,str1);
   Time = text(-2,11,str2);
   pause(0.005);
   if i<length(T)
    delete(p1_circle);
    delete(p2_circle);
    delete(p3_circle);
    delete(p4_circle);
    delete(A_bar);
    delete(B_bar);
    delete(C_bar);
    delete(p3_text);
    delete(Time);
    % plotting x-coordinate vs time
    xco = subplot(5,1,2);
    plot(xco,t(1:i),p3_x(1:i));
    set(xco,'XLim',[0,10],'YLim',[0,10]);
    xlabel(xco,'Time (s)');
    ylabel(xco,'X-coordinate');
    title('X-coordinate of p3');
    grid on;
    % plotting y-coordinate vs time
    yco = subplot(5,1,3);
    plot(yco,t(1:i),p3_y(1:i));
    set(yco,'XLim',[0,10],'YLim',[0,10]);
    xlabel(yco,'Time (s)');
    ylabel(yco,'Y-coordinate');
    title('Y-coordinate of p3');
    grid on;
    % plotting speed vs time
    vel = subplot(5,1,4);
    plot(vel,t(1:i),p3_v(1:i));
    set(vel,'XLim',[0 10],'YLim',[0 10]);
    xlabel(vel, 'Time (s)');
    ylabel(vel, 'amplitude (m/s)');
    title(vel,'Velocity of p3');
    grid on;
    % plotting amplitude of acceleration vs time
    acc = subplot(5,1,5);
    plot(acc,T(1:i),p3_a(1:i));
    set(acc,'XLim',[0,10],'YLim',[0,50]);
    xlabel(acc,'Time (s)');
    ylabel(acc,'amplitude (m/s^2)');
    title(acc,'Acceleration of p3');
    grid on;
   end
end
