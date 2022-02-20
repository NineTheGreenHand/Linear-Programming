clear all; close all; clc;

%% Generate the transition Matrix

% limit = 26;
% A = transMatrix(limit);
% 
% 
% 
% Q = A(1:limit, 1:limit);
% N = inv(eye(limit) - Q);
% 
% 
% expected_nun = sum(N(1, :));



% % Probability of at least half of expected number of rolls needed to end.
% 
% temp = A^7;
% prob = 1 - temp(1, limit + 1);

%% Generate the transition matrix

limit = [10, 20, 26, 40, 50, 70, 100, 150, 200, 250, 300, 350, 400, 500, 750, 1000];
expect_num = zeros(length(limit), 1);
idx = 1;

for i = limit
    A = transMatrix(i);
    % Generate Q, N, and Expected Number
    Q = A(1:i, 1:i);
    N = inv(eye(i) - Q);
    expect_num(idx) = sum(N(1, :));
    idx = idx + 1;
end

%% For a larger set of limits with increment of 2, range from 10 to 5000

% limit = 10:2:5000;
% expect_num = zeros(length(limit), 1);
% idx = 1;
% 
% for i = limit
%     A = transMatrix(i);
%     % Generate Q, N, and Expected Number
%     Q = A(1:i, 1:i);
%     N = inv(eye(i) - Q);
%     expect_num(idx) = sum(N(1, :));
%     idx = idx + 1;
% end
% 
% % Plot it
% 
% x = limit;
% y = expect_num;
% plot(x, y,'LineWidth', 1.5); xlabel('Limit'); ylabel('Expected Number');
% hold on;
% 
% % Plot
%  
% tt = zeros(length(limit), 1);
% 
% for j = 1:length(limit)
%     tt(j) = sqrt(expect_num(j)) / limit(j);
% end
% 
% plot(limit, tt); xlabel('Limit'); ylabel('Expected Number / Limit');
% 
% tt2 = zeros(length(limit), 1);
% 
% for j = 1:length(limit)
%     tt2(j) = (expect_num(j)^2) / limit(j);
% end
% 
% plot(limit, tt2); xlabel('Limit'); ylabel('Expected Number^2 / Limit');
% 
% tt3 = zeros(length(limit), 1);
% 
% for j = 1:length(limit)
%     tt3(j) = log(expect_num(j)) / log(limit(j));
% end
% 
% plot(limit, tt3); xlabel('Limit'); ylabel('log(Expected Number) / log(Limit)');


%% Simulation the game for limit = 26 

% limit = 26;
% games = 1:100000;
% throws = zeros(1, 100000);
% 
% for i = games
%     score = 0;
%     while score < limit
%         throws(i) = throws(i) + 1;
%         % random rolls
%         roll = randi(6);
%         if isprime(score + roll)
%             if score + roll >= limit
%                 break;
%             elseif score == 0
%                 score = roll;
%             else
%                 score = score - roll;
%                 if score < 0
%                     score = 0;
%                 end
%             end
%         else
%             score = score + roll;
%         end
%     end
% end
% 
% % 6492/413 = 15.719
% 
% % Average throws
% 
% average_throws = mean(throws);
% 
% % Verify the probabily we get in Section II.
% 
% verify = 1 - sum(throws <= 7) / length(throws); 

%%

% limit = [10, 20, 26, 40, 50, 70, 100, 150, 200, 250, 300, 350, 400, 500, 750, 1000];
% games = 1:100000;
% average = zeros(length(limit), 1);
% 
% for k = 1:length(limit)
%     throws = zeros(1, 100000);
%     for i = games
%         score = 0;
%         while score < limit(k)
%             throws(i) = throws(i) + 1;
%             % random rolls
%             roll = randi(6);
%             if isprime(score + roll)
%                 if score + roll >= limit(k)
%                     break;
%                 elseif score == 0
%                     score = roll;
%                 else
%                     score = score - roll;
%                     if score < 0
%                         score = 0;
%                     end
%                 end
%             else
%                 score = score + roll;
%             end
%         end
%     end
%     average(k) = mean(throws);
% end

%% Plot limit and expected value graph

x = limit;
y = expect_num;
plot(x, y, 'o-','LineWidth', 1.5); xlabel('Limit'); ylabel('Expected Number');
hold on;
 
% Plot the best fit line:

% 0.449776952493665          8.11428715615568

coeff_lin = polyfit(x, y, 1);   
yfit_lin = polyval(coeff_lin, x);
plot(x, yfit_lin, 'r-', 'LineWidth', 1.5);
hold on

% coeff_sti = polyfit(x, average, 1);
% yfit_sti = polyval(coeff_sti, x);
% plot(x, yfit_sti, 'y-', 'LineWidth', 1);


legend('Limit vs. Expected Number', 'Best Fit Line')

% legend('Limit vs. Expected Number', 'Best Fit Line', 'Best Fit Line (Simulation)');


%% Percentage Difference

% pd = zeros(length(limit), 1);
% 
% for i = 1:length(limit)
%     pd(i) = (abs(expect_num(i) - average(i))/((expect_num(i)+average(i))/2)) * 100;
% end











