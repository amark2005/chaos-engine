data = csvread('chaosdiff.csv', 1, 0);
x = data(:,1);
y = data(:,2);
z = data(:,3);

plot3(x, y, z, 'b.', 'MarkerSize', 1);
xlabel('X'); ylabel('Y'); zlabel('Z');
title('Lorenz Butterfly');
grid on;