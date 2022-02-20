clear all; close all; clc;

%% Default strategy: Always add

% % Set up
% 
% run = 1000;
% game = 100000;
% limit = 33;
% 
% % To record win ratio of A and B for each run
% 
% winRatio_A = zeros(1, run);
% winRatio_B = zeros(1, run);
% 
% % To see whoes turn it is
% 
% A = 0;  % Head
% B = 1;  % Tail
% 
% for i = 1:run
%     num_A_win = 0;
%     num_B_win = 0;
%     for j = 1:game
%         score_A = 0;
%         score_B = 0;
%         % randomly decide first hand is A or B (flip a coin)
%         player = round(rand);
%         while score_A < limit && score_B < limit
%             % random roll
%             roll = randi(6);
%             % A's turn
%             if player == A
%                 score_A = score_A + roll;
%             end
%             % B's turn
%             if player == B
%                 score_B = score_B + roll;
%             end
%             % Switch player 
%             player = 1 - player;
%             % See who wins
%             if score_A >= limit
%                 num_A_win = num_A_win + 1;
%                 break;
%             end
%             if score_B >= limit
%                 num_B_win = num_B_win + 1;
%                 break;
%             end 
%         end
%     end
%     winRatio_A(1, i) = (num_A_win / game);
%     winRatio_B(1, i) = (num_B_win / game);
% end
% 
% % plot histogram
% 
% figure;
% histogram(winRatio_A);
% title("Win Ratio for Player A");
% xlabel("Win Ratio"); ylabel("Number of Runs");
% figure
% histogram(winRatio_B);
% title("Win Ratio for Player B");
% xlabel("Win Ratio"); ylabel("Number of Runs");
% 
% % Calculate mean and sample standard deviation
% 
% mean_winRatioA = mean(winRatio_A);               % 0.5000
% mean_winRatioB = mean(winRatio_B);               % 0.5000
% sd_winRatioA = std(winRatio_A);                  % 0.0016
% sd_winRatioB = std(winRatio_B);                  % 0.0016
% 
% % Confidence Interval: 99.73%
% 
% upper_P_winRatioA = mean_winRatioA + 3 * sd_winRatioA;              % 0.5047
% lower_P_winRatioA = mean_winRatioA - 3 * sd_winRatioA;              % 0.4953
% upper_P_winRatioB = mean_winRatioB + 3 * sd_winRatioB;              % 0.5047
% lower_P_winRatioB = mean_winRatioB - 3 * sd_winRatioB;              % 0.4953
% 
% range_A = [lower_P_winRatioA, upper_P_winRatioA];
% range_B = [lower_P_winRatioB, upper_P_winRatioB];

%% Test: 10 runs

% % Set up
% 
% run = 10;
% game = 1000:1000:100000;
% limit = 33;
% 
% % To record win ratio of A and B for each run, and the average 
% % number of round to end the game for each run.
% 
% winRatio_A = zeros(run, length(game));
% winRatio_B = zeros(run, length(game));
% 
% % To see whoes turn it is
% 
% A = 0;  % Head
% B = 1;  % Tail
% 
% for i = 1:10
%     for k = 1:length(game)
%         num_A_win = 0;
%         num_B_win = 0;
%         round_to_win = zeros(1, game(k));
%         for j = 1:game(k)
%             score_A = 0;
%             score_B = 0;
%             % randomly decide first hand is A or B (flip a coin)
%             player = round(rand);
%             while score_A < limit && score_B < limit
%                 % random roll
%                 roll = randi(6);
%                 % A's turn
%                 if player == A
%                     if limit - score_B <= 6
%                         score_B = score_B - roll;
%                     else
%                         if score_B - score_A >= 5
%                             score_B = score_B - roll;
%                             if score_B < 0
%                                 score_B = 0;
%                             end
%                         else
%                             score_A = score_A + roll;
%                         end
%                     end
%                 end
%                 % B's turn
%                 if player == B
%                     if limit - score_A <= 6
%                         score_A = score_A - roll;
%                     else
%                         score_B = score_B + roll;
%                     end
%                 end
%                 % Switch player 
%                 player = 1 - player;
%                 % See who wins
%                 if score_A >= limit
%                     num_A_win = num_A_win + 1;
%                     break;
%                 end
%                 if score_B >= limit
%                     num_B_win = num_B_win + 1;
%                     break;
%                 end 
%             end
%         end
%         winRatio_A(i, k) = (num_A_win / game(k));
%         winRatio_B(i, k) = (num_B_win / game(k));
%     end
% end
% 
% for i = 1:run
%     tempA = winRatio_A(i, :);
%     plot(game, tempA);
%     hold on
% end
% 
% for i = 1:run
%     tempB = winRatio_B(i, :);
%     plot(game, tempB);
%     hold on
% end

%% Strategy I

% % Set up
% 
% threshold = 6;
% run = 100;
% game = 100000;
% limit = 33;
% 
% % To record win ratio of A and B for each run, and the average 
% % number of round to end the game for each run.
% 
% winRatio_A = zeros(1, run);
% winRatio_B = zeros(1, run);
% 
% % To see whoes turn it is
% 
% A = 0;  % Head
% B = 1;  % Tail
% 
% for i = 1:run
%     num_A_win = 0;
%     num_B_win = 0;
%     for j = 1:game
%         score_A = 0;
%         score_B = 0;
%         % randomly decide first hand is A or B (flip a coin)
%         player = round(rand);
%         while score_A < limit && score_B < limit
%             % random roll
%             roll = randi(6);
%             % A's turn
%             if player == A
%                 if limit - score_B <= threshold
%                     score_B = score_B - roll;
%                 else
%                     if score_B - score_A >= 5
%                         score_B = score_B - roll;
%                         if score_B < 0
%                             score_B = 0;
%                         end
%                     else
%                         score_A = score_A + roll;
%                     end
%                 end
%             end
%             % B's turn
%             if player == B
%                 if limit - score_A <= threshold
%                     score_A = score_A - roll;
%                 else
%                     score_B = score_B + roll;
%                 end
%             end
%             % Switch player 
%             player = 1 - player;
%             % See who wins
%             if score_A >= limit
%                 num_A_win = num_A_win + 1;
%                 break;
%             end
%             if score_B >= limit
%                 num_B_win = num_B_win + 1;
%                 break;
%             end 
%         end
%     end
%     winRatio_A(1, i) = (num_A_win / game);
%     winRatio_B(1, i) = (num_B_win / game);
% end
% 
% % plot histogram
% 
% % figure;
% % histogram(winRatio_A);
% % title("Win Ratio for Player A");
% % xlabel("Win Ratio"); ylabel("Number of Runs");
% % figure
% % histogram(winRatio_B);
% % title("Win Ratio for Player B");
% % xlabel("Win Ratio"); ylabel("Number of Runs");
% 
% % Calculate mean and sample standard deviation
% 
% mean_winRatioA = mean(winRatio_A);   % 0.559321500000000           
% mean_winRatioB = mean(winRatio_B);   % 0.440678500000000          
% sd_winRatioA = std(winRatio_A);      % 0.001674480094196         
% sd_winRatioB = std(winRatio_B);      % 0.001674480094196             
% 
% % Confidence Interval: 99.73%
% 
% upper_P_winRatioA = mean_winRatioA + 3 * sd_winRatioA;  % 0.564344940282588             
% lower_P_winRatioA = mean_winRatioA - 3 * sd_winRatioA;  % 0.554298059717412          
% upper_P_winRatioB = mean_winRatioB + 3 * sd_winRatioB;  % 0.445701940282588           
% lower_P_winRatioB = mean_winRatioB - 3 * sd_winRatioB;  % 0.435655059717412               
%             
% range_A = [lower_P_winRatioA, upper_P_winRatioA]
% range_B = [lower_P_winRatioB, upper_P_winRatioB]
    

%% Strategy II

% % Set up
% 
% goal = 9;
% run = 10;
% game = 100000;
% limit = 33;
% 
% % To record win ratio of A and B for each run, and the average 
% % number of round to end the game for each run.
% 
% winRatio_A = zeros(1, run);
% winRatio_B = zeros(1, run);
% 
% % To see whoes turn it is
% 
% A = 0;  % Head
% B = 1;  % Tail
% 
% for i = 1:run
%     num_A_win = 0;
%     num_B_win = 0;
%     for j = 1:game
%         score_A = 0;
%         score_B = 0;
%         % randomly decide first hand is A or B (flip a coin)
%         player = round(rand);
%         while score_A < limit && score_B < limit
%             % random roll
%             roll = randi(6);
%             % A's turn
%             if player == A
%                 if score_A < goal       % goal is defined outside the loop
%                     score_A = score_A + roll;
%                 else
%                     if limit - score_B <= 6
%                         score_B = score_B - roll;
%                     else
%                         if score_B - score_A >= 3
%                             score_B = score_B - roll;
%                             if score_B < 0
%                                 score_B = 0;
%                             end
%                         else
%                             score_A = score_A + roll;
%                         end
%                     end
%                 end
%             end
%             % B's turn
%             if player == B
%                 if limit - score_A <= 6
%                     score_A = score_A - roll;
%                 else
%                     score_B = score_B + roll;
% %                     if score_A - score_B >= 3
% %                         score_A = score_A - roll;
% %                         if score_A < 0
% %                             score_A = 0;
% %                         end
% %                     else
% %                         score_B = score_B + roll;
% %                     end
%                 end
%             end
%             % Switch player 
%             player = 1 - player;
%             % See who wins
%             if score_A >= limit
%                 num_A_win = num_A_win + 1;
%                 break;
%             end
%             if score_B >= limit
%                 num_B_win = num_B_win + 1;
%                 break;
%             end 
%         end
%     end
%     winRatio_A(1, i) = (num_A_win / game);
%     winRatio_B(1, i) = (num_B_win / game);
% end
% 
% % plot histogram
% 
% % figure;
% % histogram(winRatio_A);
% % title("Win Ratio for Player A");
% % xlabel("Win Ratio"); ylabel("Number of Runs");
% % figure
% % histogram(winRatio_B);
% % title("Win Ratio for Player B");
% % xlabel("Win Ratio"); ylabel("Number of Runs");
% 
% % Calculate mean and sample standard deviation
% 
% mean_winRatioA = mean(winRatio_A);               
% mean_winRatioB = mean(winRatio_B);               
% sd_winRatioA = std(winRatio_A);                  
% sd_winRatioB = std(winRatio_B);                     
% 
% % Confidence Interval: 99.73%
% 
% upper_P_winRatioA = mean_winRatioA + 3 * sd_winRatioA;              
% lower_P_winRatioA = mean_winRatioA - 3 * sd_winRatioA;              
% upper_P_winRatioB = mean_winRatioB + 3 * sd_winRatioB;              
% lower_P_winRatioB = mean_winRatioB - 3 * sd_winRatioB;                  
%             
% range_A = [lower_P_winRatioA, upper_P_winRatioA];
% range_B = [lower_P_winRatioB, upper_P_winRatioB];

%% Strategy III

% % Set up
% 
% run = 10;
% game = 100000;
% limit = 33;
% 
% % To record win ratio of A and B for each run, and the average 
% % number of round to end the game for each run.
% 
% winRatio_A = zeros(1, run);
% winRatio_B = zeros(1, run);
% 
% % To see whoes turn it is
% 
% A = 0;  % Head
% B = 1;  % Tail
% 
% for i = 1:run
%     num_A_win = 0;
%     num_B_win = 0;
%     for j = 1:game
%         score_A = 0;
%         score_B = 0;
%         % randomly decide first hand is A or B (flip a coin)
%         player = round(rand);
%         while score_A < limit && score_B < limit
%             % random roll
%             roll = randi(6);
%             % A's turn
%             if player == A
%                 if limit - score_B <= 6
%                     score_B = score_B - roll;
%                 else
%                     if score_B - score_A >= 3
%                         if roll == 4 || roll == 5 
%                             score_B = score_B - roll;
%                             if score_B < 0
%                                 score_B = 0;
%                             end
%                         else
%                             score_A = score_A + roll;
%                         end
%                     else
%                         score_A = score_A + roll;
%                     end
%                 end
%             end
%             % B's turn
%             if player == B
%                 if limit - score_A <= 6
%                     score_A = score_A - roll;
%                 else
%                     if score_A - score_B >= 3
%                         score_A = score_A - roll;
%                         if score_A < 0
%                             score_A = 0;
%                         end
%                     else
%                         score_B = score_B + roll;
%                     end
%                 end
%             end
%             % Switch player 
%             player = 1 - player;
%             % See who wins
%             if score_A >= limit
%                 num_A_win = num_A_win + 1;
%                 break;
%             end
%             if score_B >= limit
%                 num_B_win = num_B_win + 1;
%                 break;
%             end 
%         end
%     end
%     winRatio_A(1, i) = (num_A_win / game);
%     winRatio_B(1, i) = (num_B_win / game);
% end
% 
% % Calculate mean and sample standard deviation
% 
% mean_winRatioA = mean(winRatio_A);               
% mean_winRatioB = mean(winRatio_B);               
% sd_winRatioA = std(winRatio_A);                  
% sd_winRatioB = std(winRatio_B);                     
% 
% % Confidence Interval: 99.73%
% 
% upper_P_winRatioA = mean_winRatioA + 3 * sd_winRatioA;              
% lower_P_winRatioA = mean_winRatioA - 3 * sd_winRatioA;              
% upper_P_winRatioB = mean_winRatioB + 3 * sd_winRatioB;              
% lower_P_winRatioB = mean_winRatioB - 3 * sd_winRatioB;                  
%             
% range_A = [lower_P_winRatioA, upper_P_winRatioA]
% range_B = [lower_P_winRatioB, upper_P_winRatioB]

%% Strategy IV

% % Set up
% 
% run = 10;
% game = 100000;
% limit = 33;
% 
% % To record win ratio of A and B for each run, and the average 
% % number of round to end the game for each run.
% 
% winRatio_A = zeros(1, run);
% winRatio_B = zeros(1, run);
% 
% % To see whoes turn it is
% 
% A = 0;  % Head
% B = 1;  % Tail
% 
% for i = 1:run
%     num_A_win = 0;
%     num_B_win = 0;
%     for j = 1:game
%         score_A = 0;
%         score_B = 0;
%         % randomly decide first hand is A or B (flip a coin)
%         player = round(rand);
%         while score_A < limit && score_B < limit
%             % random roll
%             roll = randi(6);
%             % A's turn
%             if player == A
%                 if limit - score_B <= 6
%                     score_B = score_B - roll;
%                 else
%                     if roll == 5 || roll == 6
%                         score_A = score_A + roll;
%                     else
%                         score_B = score_B - roll;
%                         if score_B < 0
%                             score_B = 0;
%                         end
%                     end
%                 end
%             end
%             % B's turn
%             if player == B
%                 if limit - score_A <= 6
%                     score_A = score_A - roll;
%                 else
%                     if score_A - score_B >= 3
%                         score_A = score_A - roll;
%                         if score_A < 0
%                             score_A = 0;
%                         end
%                     else
%                         score_B = score_B + roll;
%                     end
%                 end
%             end
%             % Switch player 
%             player = 1 - player;
%             % See who wins
%             if score_A >= limit
%                 num_A_win = num_A_win + 1;
%                 break;
%             end
%             if score_B >= limit
%                 num_B_win = num_B_win + 1;
%                 break;
%             end 
%         end
%     end
%     winRatio_A(1, i) = (num_A_win / game);
%     winRatio_B(1, i) = (num_B_win / game);
% end
% 
% % plot histogram
% 
% % figure;
% % histogram(winRatio_A);
% % title("Win Ratio for Player A");
% % xlabel("Win Ratio"); ylabel("Number of Runs");
% % figure
% % histogram(winRatio_B);
% % title("Win Ratio for Player B");
% % xlabel("Win Ratio"); ylabel("Number of Runs");
% 
% % Calculate mean and sample standard deviation
% 
% mean_winRatioA = mean(winRatio_A);               
% mean_winRatioB = mean(winRatio_B);               
% sd_winRatioA = std(winRatio_A);                  
% sd_winRatioB = std(winRatio_B);                     
% 
% % Confidence Interval: 99.73%
% 
% upper_P_winRatioA = mean_winRatioA + 3 * sd_winRatioA;              
% lower_P_winRatioA = mean_winRatioA - 3 * sd_winRatioA;              
% upper_P_winRatioB = mean_winRatioB + 3 * sd_winRatioB;              
% lower_P_winRatioB = mean_winRatioB - 3 * sd_winRatioB;                  
%             
% range_A = [lower_P_winRatioA, upper_P_winRatioA]
% range_B = [lower_P_winRatioB, upper_P_winRatioB]

%% IV Investigation on Strategy I
% 
% % Set up
% 
% % Both from 2 to 8
% diff_A = 8;
% diff_B = 8;
% 
% run = 10;
% game = 100000;
% limit = 33;
% 
% % To record win ratio of A and B for each run, and the average 
% % number of round to end the game for each run.
% 
% winRatio_A = zeros(1, run);
% winRatio_B = zeros(1, run);
% 
% % To see whoes turn it is
% 
% A = 0;  % Head
% B = 1;  % Tail
% 
% for i = 1:run
%     num_A_win = 0;
%     num_B_win = 0;
%     for j = 1:game
%         score_A = 0;
%         score_B = 0;
%         % randomly decide first hand is A or B (flip a coin)
%         player = round(rand);
%         while score_A < limit && score_B < limit
%             % random roll
%             roll = randi(6);
%             % A's turn
%             if player == A
%                 if limit - score_B <= 6
%                     score_B = score_B - roll;
%                 else
%                     if score_B - score_A >= diff_A
%                         score_B = score_B - roll;
%                         if score_B < 0
%                             score_B = 0;
%                         end
%                     else
%                         score_A = score_A + roll;
%                     end
%                 end
%             end
%             % B's turn
%             if player == B
%                 if limit - score_A <= 6
%                     score_A = score_A - roll;
%                 else
%                     if score_A - score_B >= diff_B
%                         score_A = score_A - roll;
%                         if score_A < 0
%                             score_A = 0;
%                         end
%                     else
%                         score_B = score_B + roll;
%                     end
%                 end
%             end
%             % Switch player 
%             player = 1 - player;
%             % See who wins
%             if score_A >= limit
%                 num_A_win = num_A_win + 1;
%                 break;
%             end
%             if score_B >= limit
%                 num_B_win = num_B_win + 1;
%                 break;
%             end 
%         end
%     end
%     winRatio_A(1, i) = (num_A_win / game);
%     winRatio_B(1, i) = (num_B_win / game);
% end
% 
% % Calculate mean and sample standard deviation
% 
% mean_winRatioA = mean(winRatio_A);               
% mean_winRatioB = mean(winRatio_B);               
% sd_winRatioA = std(winRatio_A);                  
% sd_winRatioB = std(winRatio_B);                     
% 
% % Confidence Interval: 99.73%
% 
% upper_P_winRatioA = mean_winRatioA + 3 * sd_winRatioA;              
% lower_P_winRatioA = mean_winRatioA - 3 * sd_winRatioA;              
% upper_P_winRatioB = mean_winRatioB + 3 * sd_winRatioB;              
% lower_P_winRatioB = mean_winRatioB - 3 * sd_winRatioB;                  
%             
% range_A = [lower_P_winRatioA, upper_P_winRatioA]
% range_B = [lower_P_winRatioB, upper_P_winRatioB]


