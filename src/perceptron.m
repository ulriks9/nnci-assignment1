% Trains weights w on data D. If all E > 0, success == true
function [w, success] = perceptron(D, alpha)
    N = length(D.features(1,:));
    P = round(alpha * N);
    n_max = 100;
    w = zeros(1, N);
    xi = D.features;
    S = D.labels;
    n = 0;
    success = false;
    % Outer loop: Runs for n epochs
    while ~success && n < n_max
        E_P = zeros(P,1);
        for i = 1 : P
            % Estimate
            E = w * xi(i,:)' * S(i);
            % Update weights if incorrect estimate
            if E <= 0
                w = w + (1 / N) * xi(i,:) * S(i);
            else
                E_P(i) = E;
            end
        end
        % Checks if stopping condition met
        if all(E_P > 0)
            success = true;
        end
        n = n + 1;
    end
end