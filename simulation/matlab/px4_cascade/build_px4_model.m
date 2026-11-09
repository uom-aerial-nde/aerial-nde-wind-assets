% build_px4_model.m  -  builds px4_model.slx: the teammate's quadrotor plant
% with a PX4-style controller block in front of it, running at 1 kHz.
% Run once (it calls px4_init), then press Run in the model or: out = sim('px4_model');

px4_init;
mdl = 'px4_model';
if bdIsLoaded(mdl), close_system(mdl, 0); end
if exist([mdl '.slx'], 'file'), delete([mdl '.slx']); end
new_system(mdl); open_system(mdl);

Ts = 'p.Ts_rate';

% ---------- blocks ----------
add_block('simulink/Sources/Clock',              [mdl '/Clock'],        'Position', [30 100 60 130]);
add_block('simulink/Discrete/Zero-Order Hold',   [mdl '/Sample t'],     'Position', [100 98 135 132], 'SampleTime', Ts);
add_block('simulink/User-Defined Functions/MATLAB Function', [mdl '/Trajectory'],    'Position', [180 70 320 170]);
add_block('simulink/User-Defined Functions/MATLAB Function', [mdl '/PX4 controller'],'Position', [400 60 560 220]);
add_block('simulink/Math Operations/Sum',        [mdl '/Motor error'],  'Position', [620 120 640 140], 'Inputs', '+-');
add_block('simulink/Math Operations/Gain',       [mdl '/1 over tau_m'], 'Position', [670 115 720 145], 'Gain', '1/p.tau_m');
add_block('simulink/Continuous/Integrator',      [mdl '/Motor thrusts'],'Position', [750 115 780 145], 'InitialCondition', 'p.m*p.g/4*ones(4,1)');
add_block('simulink/User-Defined Functions/MATLAB Function', [mdl '/Rigid Body'],    'Position', [830 100 950 180]);
add_block('simulink/Continuous/Integrator',      [mdl '/State'],        'Position', [1000 125 1030 155], 'InitialCondition', 'p.state0');
add_block('simulink/Discrete/Zero-Order Hold',   [mdl '/Sample state'], 'Position', [700 260 735 290], 'SampleTime', Ts);
add_block('simulink/Signal Routing/Selector',    [mdl '/Position xyz'], 'Position', [1080 200 1120 230], 'Indices', '[1 2 3]', 'InputPortWidth', '12');
add_block('simulink/Sinks/Scope',                [mdl '/Position real vs desired'], 'Position', [1170 190 1200 240], 'NumInputPorts', '2');
add_block('simulink/Sinks/To Workspace', [mdl '/log state'],  'Position', [1100 50 1160 80],  'VariableName', 'state_log', 'SaveFormat', 'Timeseries');
add_block('simulink/Sinks/To Workspace', [mdl '/log ref'],    'Position', [400 300 460 330], 'VariableName', 'ref_log',   'SaveFormat', 'Timeseries');
add_block('simulink/Sinks/To Workspace', [mdl '/log motors'], 'Position', [830 20 890 50],   'VariableName', 'f_log',     'SaveFormat', 'Timeseries');
add_block('simulink/Sinks/To Workspace', [mdl '/log att ref'],'Position', [620 260 680 290], 'VariableName', 'attref_log','SaveFormat', 'Timeseries');

% ---------- MATLAB Function code ----------
rt = sfroot;
setcode = @(blk, code) set(rt.find('-isa','Stateflow.EMChart','Path',[mdl '/' blk]), 'Script', code);
setcode('Trajectory', sprintf([ ...
    'function [pos_ref, vel_ref, acc_ref, yaw_ref] = fcn(t)\n' ...
    '[pos_ref, vel_ref, acc_ref, yaw_ref] = px4_trajectory(t);\n']));
setcode('PX4 controller', sprintf([ ...
    'function [f_cmd, att_ref] = fcn(pos_ref, vel_ref, acc_ref, yaw_ref, state, p)\n' ...
    '[f_cmd, att_ref] = px4_controller(pos_ref, vel_ref, acc_ref, yaw_ref, state, p);\n']));
setcode('Rigid Body', sprintf([ ...
    'function xdot = fcn(state, f, p)\n' ...
    'xdot = quad_dynamics(state, f, p);\n']));
for blk = {'PX4 controller', 'Rigid Body'}
    ch = rt.find('-isa','Stateflow.EMChart','Path',[mdl '/' blk{1}]);
    d  = ch.find('-isa','Stateflow.Data','Name','p');
    d.Scope = 'Parameter';
end

% ---------- wiring ----------
L = @(a,b) add_line(mdl, a, b, 'autorouting', 'on');
L('Clock/1', 'Sample t/1');
L('Sample t/1', 'Trajectory/1');
L('Trajectory/1', 'PX4 controller/1');  L('Trajectory/2', 'PX4 controller/2');
L('Trajectory/3', 'PX4 controller/3');  L('Trajectory/4', 'PX4 controller/4');
L('Trajectory/1', 'log ref/1');
L('PX4 controller/1', 'Motor error/1');
L('PX4 controller/2', 'log att ref/1');
L('Motor error/1', '1 over tau_m/1');
L('1 over tau_m/1', 'Motor thrusts/1');
L('Motor thrusts/1', 'Motor error/2');
L('Motor thrusts/1', 'Rigid Body/2');
L('Motor thrusts/1', 'log motors/1');
L('Rigid Body/1', 'State/1');
L('State/1', 'Rigid Body/1');
L('State/1', 'Sample state/1');
L('Sample state/1', 'PX4 controller/5');
L('State/1', 'log state/1');
L('State/1', 'Position xyz/1');
L('Trajectory/1', 'Position real vs desired/1');
L('Position xyz/1', 'Position real vs desired/2');

% ---------- solver ----------
set_param(mdl, 'StopTime', 'p.Tstop', 'Solver', 'ode45', 'MaxStep', '1e-3', ...
          'ReturnWorkspaceOutputs', 'on');
save_system(mdl);
fprintf('Built %s.slx  -  press Run, or type: out = sim(''%s'');\n', mdl, mdl);
