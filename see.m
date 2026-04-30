data = csvread('chaosdiff.csv', 1, 0);
iter  = data(:,1);
lewis = data(:,2);
stroll= data(:,3);
diff  = data(:,4);

plot(iter, lewis, 'r-o', iter, stroll, 'b-o', iter, diff, 'g-o');
legend('lewis','stroll','diff');
xlabel('Iter'); ylabel('Value');
title('Lewis vs Stroll');
grid on;