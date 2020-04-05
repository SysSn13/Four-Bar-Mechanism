% Sudesh Chaudhary
% Github: https://github.com/sudesh1122

% Solution of:
% Show the different position of the links of the mechanism for an appropriate range of the input
% angle

close;clc; clear;
% Parameters
% Link lengths - L1,L2,L3,L4
% Should satisfy Grasof law

while true
close;clear;
prompt ="Press Ctrl+c to exit \nEnter the value of Theta:";
theta = input(prompt);
theta = theta*pi/180;
L1 = 20; L2 =60 ; L3 = 80; L4 = 100; % given
% Lets assume point P1 is at the origin So
p1 = [0;0];

% Lets assume point P4 is at x-axis. So the coordinates will be D distance away from the point p1 in x-dir

p4 = L4*[1;0];

% using using Analytical Method we can get the coordinate of point P2
p2 = L1*[cos(theta); sin(theta)];
% Length of P2P4
E = sqrt(L1^2 + L4^2 - 2*L1*L4*cos(theta));

beta = acos((E.^2 + L3^2 - L2^2)./(2*E*L3));

alpha = asin(L1*sin(theta)./E);
% So coordinates of point P3

p3 = [L4 - L3*cos(alpha+beta); L3*sin(alpha+beta)];

   animation = subplot(1,1,1);
   % create small circles to show points clearly
   p1_circle = viscircles(p1',0.5);
   p2_circle = viscircles(p2',0.5);
   p3_circle = viscircles(p3',0.5);
   p4_circle = viscircles(p4',0.5);

   % to plot the bars, plotting line
   A_bar = line([p1(1) p2(1)],[p1(2) p2(2)]);
   B_bar = line([p2(1) p3(1)],[p2(2) p3(2)]);
   C_bar = line([p3(1) p4(1)],[p3(2) p4(2)]);

   % adjusting axises
   axis(animation,'equal');
   set(gca,'XLim',[-50 100],'YLim',[-20 110]);

   str3 = 'p3';
   str1 = 'p1';
   str2 = 'p2';
   str4 = 'p4';
   p1_text = text(p1(1),p1(2)+0.1,str1);
   p2_text = text(p2(1),p2(2)+0.1,str2);
   p3_text = text(p3(1),p3(2)+0.1,str3);
   p4_text = text(p4(1),p4(2)+0.1,str4);
   pause(20);
end
