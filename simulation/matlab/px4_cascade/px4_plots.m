function px4_plots(t, ref, x, f, att_ref, p, label)
% Plots for the PX4 simulation. ref = Nx3 position setpoints, x = Nx12 states,
% f = Nx4 motor thrusts, att_ref = Nx3 desired roll/pitch/yaw.

pos = x(:,1:3);  eul = x(:,7:9);
err = vecnorm(ref - pos, 2, 2);
late = t > 10;
fprintf('\n[%s]\n', label);
fprintf('Tracking error after t=10 s: RMS %.3f m, max %.3f m\n', sqrt(mean(err(late).^2)), max(err(late)));
fprintf('Max tilt: %.1f deg   Motor thrust range: %.2f to %.2f N (limit %.1f N)\n', ...
        rad2deg(max(max(abs(eul(:,1:2))))), min(f(:)), max(f(:)), p.fmax);

figure('Name', ['PX4 simulation - ' label], 'Position', [100 100 1100 750]);

subplot(2,2,1);
plot3(ref(:,1), ref(:,2), ref(:,3), 'k--', pos(:,1), pos(:,2), pos(:,3), 'LineWidth', 1.5);
grid on; axis equal; xlabel('x [m]'); ylabel('y [m]'); zlabel('z [m]');
legend('desired path', 'drone'); title('Flight path');

subplot(2,2,2);
plot(t, ref, '--', 'LineWidth', 1); hold on; set(gca, 'ColorOrderIndex', 1);
plot(t, pos, 'LineWidth', 1.5); grid on;
xlabel('time [s]'); ylabel('position [m]');
legend('x ref','y ref','z ref','x','y','z', 'Location', 'best'); title('Position vs setpoint');

subplot(2,2,3);
plot(t, rad2deg(att_ref(:,1:2)), '--', 'LineWidth', 1); hold on; set(gca, 'ColorOrderIndex', 1);
plot(t, rad2deg(eul(:,1:2)), 'LineWidth', 1.5); grid on;
xlabel('time [s]'); ylabel('angle [deg]');
legend('roll ref','pitch ref','roll','pitch', 'Location', 'best'); title('Inner loop: attitude tracking');

subplot(2,2,4);
plot(t, f, 'LineWidth', 1.2); grid on; yline(p.fmax, 'r:'); yline(p.m*p.g/4, 'k:');
xlabel('time [s]'); ylabel('thrust [N]'); ylim([0 p.fmax+0.5]);
legend('M1','M2','M3','M4','max','hover', 'Location', 'best'); title('Motor thrusts');
end
