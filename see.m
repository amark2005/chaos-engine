data = csvread('chaosdiff.csv', 1, 0);
r = data(:,1);
lambda = data(:,2);

plot(r, lambda, 'b-', 'LineWidth', 1.5);
hold on;
yline(0, 'r--', 'LineWidth', 1);
xlabel('r'); ylabel('Lyapunov Exponent');
title('Logistic Map - Lyapunov Exponent');
legend('lambda', 'zero');
grid on;