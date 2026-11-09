% run_px4_simulink.m  -  builds (if needed) and runs the Simulink version, then plots
px4_init;
if ~exist('px4_model.slx', 'file'), build_px4_model; end
out = sim('px4_model');

t   = out.state_log.Time;
x   = tsdata(out.state_log);
ref = interp1(out.ref_log.Time,    tsdata(out.ref_log),    t, 'previous', 'extrap');
att = interp1(out.attref_log.Time, tsdata(out.attref_log), t, 'previous', 'extrap');
f   = interp1(out.f_log.Time,      tsdata(out.f_log),      t);
px4_plots(t, ref, x, f, att, p, 'Simulink model');

function D = tsdata(ts)
% timeseries data as (samples x signals)
D = squeeze(ts.Data);
if size(D,1) ~= numel(ts.Time), D = D'; end
end
