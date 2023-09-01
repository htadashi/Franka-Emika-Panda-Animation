clc
clearvars

robot = importrobot('.\franka_description\panda_arm_hand.urdf');
robot.DataFormat = 'column';

% Home Configuration
Config_home = homeConfiguration(robot);
%figure
%show(robot,Config_home,'Frames','off');
%title("Home Configurationn")

% Animation
s = 100;
theta_1 = linspace(0,pi/3,s);
theta_2 = linspace(0,0,s);
theta_3 = linspace(0,0,s);
theta_4 = linspace(0,0,s);
theta_5 = linspace(0,0,s);
theta_6 = linspace(0,0,s);
theta_7 = linspace(0,0,s);

figure
for i=1:s
    configNow = [0 0 0 0 0 0 theta_7(i) 0 0].';
    HTM_EE = getTransform(robot, configNow, 'panda_hand');
    show(robot,configNow,'FastUpdate', true, 'PreservePlot',false,'Frames','off');
    
    % Supporting Plane
    hold on
    XL = [-1 1];
    YL = [-1 1];
    patch('Faces',[1 2 3 4],'Vertices',[XL(1) YL(1) 0; XL(2) YL(1) 0; XL(2) YL(2) 0; XL(1) YL(2) 0],'FaceColor',[1,1,1])
    
    axis([-1 1 -1 1 0 1.5]);
    view(45,10)    

    drawnow
end
