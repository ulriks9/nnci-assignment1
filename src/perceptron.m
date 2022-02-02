% Trains weights w on data D. If all E > 0, success == true
function [w_s, error] = perceptron(D, alpha)
    N = length(D.features(1,:));
    P = round(alpha * N);
    n_max = 100;
    t_max = n_max * P;
    w_t = normrnd(0, 1, 1, N);
    w_t = w_t * sqrt(N) / norm(w_t);
    w_s = zeros(1, N);
    xi = D.features;
    S = w_t * xi';
    t = 0;
    % Outer loop: Runs for n timesteps
    while t < t_max
        k = (w_s * xi' .* S) / norm(w_t);
        [~, k_min] = min(k);
        w_s = w_s + (1 / N) * xi(k_min,:) * S(k_min);
        
        % Checks if stopping condition met
        t = t + 1;
    end

    error = (1 / pi) * acos(dot(w_s, w_t) / (norm(w_s) * norm(w_t)));
end