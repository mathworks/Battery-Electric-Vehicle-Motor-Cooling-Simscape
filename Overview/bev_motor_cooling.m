%% Battery Electric Vehicle With Motor Cooling
% 
% This example models a battery electric vehicle with a cooling system for
% the motor.  It is used to size mechanical, electrical, and fluid
% components in the vehicle.  The vehicle executes a passing maneuver and
% the speed, torque, and temperature measurements are used to assess if the
% system requirements are met.
%
% Copyright 2021-2022 The MathWorks, Inc.


%% Model

open_system('bev_motor_cooling')

set_param(find_system('bev_motor_cooling','FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')

%% Simulation Results from Simscape Logging: With Cooling System
%
% The plot below shows the test run with the cooling system applied to the
% motor.  The temperature of the motor only exceeds the rated temperature
% for a brief period of time during an extended period of acceleration.
%
open_system('bev_motor_cooling')
set_param(find_system('bev_motor_cooling','FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')
Cooling_On = 1;

out=sim('bev_motor_cooling');
bev_motor_cooling_plot1motor;

%%
bdclose('bev_motor_cooling')

%% Simulation Results from Simscape Logging: No Cooling System
%
% The plot below shows the test run with no cooling system applied to the
% motor.  The temperature of the motor increases when the vehicle is
% traveling at a constant speed, indicating that the cooling system is needed.
%
% The Variant Connector block was used to exclude the cooling loop from
% simulation without physically removing the components from the model.

open_system('bev_motor_cooling')
set_param(find_system('bev_motor_cooling','FindAll', 'on','type','annotation','Tag','ModelFeatures'),'Interpreter','off')
Cooling_On = 0;
set_param([bdroot '/Cooling System'],'BackgroundColor','[0.9 0.9 0.9]');

out=sim('bev_motor_cooling');
bev_motor_cooling_plot1motor;

%%
%clear all
close all
bdclose all
