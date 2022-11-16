clc, close 

%% Parameters 
length = 0.1; 
height = 0.03; 
fraction_volume = 0.1; 
radius = 0.1; 
gravity = 9.81; 
% phi = 90-alpha+atand(radius*angular_speed^2/gravity);
alpha = 45; 
angular_speed = 5; 


%% Solving equations
static = []; 
spinning = [];
for alpha = 1:45
    for angular_speed = 1:0.5:10
        % Static fluid
        dy = roots([1/2*tand(alpha) 0 -fraction_volume*length*height]);
        static_dy = dy(dy>0);
        static_dx = tand(alpha)*static_dy;
        static = [static; alpha angular_speed static_dx static_dy];
        
        % Spinning fluid
        phi = 90-alpha+atand(radius*angular_speed^2/gravity);
        spinning_dy = (tand(phi)*static_dx*static_dy)^(1/2);
        spinning_dx = static_dx*static_dy/spinning_dy;
        spinning = [spinning; alpha angular_speed spinning_dx spinning_dy];
    end
end














