% Experiment parameters
alpha = [0.75:0.25:3];
n_D = 50;
N = 40;
rates = [];

% Run experiments
disp("Starting...")
for a = alpha
    disp("Alpha = " + a)
    successful = 0;
    for n = 1 : n_D
        D = data(round(a * N), N);
        [~, success] = perceptron(D, a);
        if success
            successful = successful + 1;
        end
    end
    rates = [rates, successful / n_D];
end

% Plot success rate curve
figure, hold on;
stairs(alpha, rates)
plot(alpha, rates)
ylim([0 1])
title("Success rate of Perceptron vs P/N")
xlabel("P/N")
ylabel("Success Rate")