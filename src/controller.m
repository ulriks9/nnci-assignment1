N = 20;
alpha = [0.25:0.25:10];
errors = [];
n_D = 100;

for a = alpha
    disp(strcat("INFO: Running for alpha: ", string(a)))
    average = zeros(1, n_D);

    for n = 1 : n_D
        P = round(a * N);
        D = data(P, N);
        [~, error] = perceptron(D, a);
        average(n) = error;
    end
    errors = [errors, mean(average)];
end

disp(alpha)

figure, hold on;
plot(alpha, errors)
ylim([0 1])
title("Generalization Error over P/N")
xlabel("P/N")
ylabel("Generalization Error")