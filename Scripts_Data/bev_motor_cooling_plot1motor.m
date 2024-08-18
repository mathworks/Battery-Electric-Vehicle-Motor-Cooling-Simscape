% Code to plot simulation results from bev_motor_cooling
%
% Copyright 2021-2024 The MathWorks, Inc.

% Generate simulation results if they don't exist
if isempty(out.simlog_bev_motor_cooling)
    sim('bev_motor_cooling')
end

% Reuse figure if it exists, else create new figure
if ~exist('h1_bev_motor_cooling', 'var') || ...
        ~isgraphics(h1_bev_motor_cooling, 'figure')
    h1_bev_motor_cooling = figure('Name', 'bev_motor_cooling');
end
figure(h1_bev_motor_cooling)
clf(h1_bev_motor_cooling)

% Get simulation results
simlog_data = out.simlog_bev_motor_cooling;
simlog_t    = simlog_data.Chassis.M.v.series.time;
simlog_vCar = simlog_data.Chassis.M.v.series.values;
simlog_TMot = simlog_data.Motor.H.T.series.values('degC');
simlog_tMot = simlog_data.Motor.torque_elec.series.values;
simlog_tReq = simlog_data.Motor.Tr.series.values;


% Plot results
simlog_handles(1) = subplot(2, 1, 1);
plot(simlog_t, simlog_vCar, 'LineWidth', 1)
hold off
grid on
title('Vehicle Speed')
ylabel('Speed (m/s)')

simlog_handles(1) = subplot(3, 1, 1);
plot(simlog_t, simlog_vCar, 'LineWidth', 1)
hold off
grid on
title('Vehicle Speed')
ylabel('Speed (m/s)')

simlog_handles(2) = subplot(3, 1, 2);
plot(simlog_t, simlog_tReq, 'LineWidth', 1)
hold on
plot(simlog_t, simlog_tMot, 'LineWidth', 1)
hold off
grid on
title('Motor Torque')
ylabel('Torque (N*m)')

legend({'Request','Measured'},'Location','Best');

simlog_handles(3) = subplot(3, 1, 3);
plot(simlog_t, simlog_TMot, 'LineWidth', 1)
grid on
title('Motor Temperature')
ylabel('Temp (degC)')
set(gca,'YLim',[0 200]);
xlabel('Time (s)')

linkaxes(simlog_handles, 'x')

% Remove temporary variables
clear simlog_t simlog_handles
clear simlog_R1i simlog_C1v temp_colororder

