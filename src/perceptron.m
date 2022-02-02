% Trains weights w on data D. If all E > 0, success == true
function [w_s, success] = perceptron(D, alpha)
    N = length(D.features(1,:));
    P = round(alpha * N);
    n_max = 100;
    w_t = normrnd(0, 1, N, 1);
    w_t = w_t * sqrt(N) / norm(w_t);
    w_s = zeros(1, N);
    disp(w_s')
    xi = D.features;
    S = w_t * xi;
    n = 0;
    success = false;
    % Outer loop: Runs for n timesteps
    while ~success && n < n_max
        k = (w_s * xi .* S) / norm(w_t);
        w_s = w_s + (1 / N) * xi(min(k)) * S(min(k));
        
        % Checks if stopping condition met
        
        n = n + 1;
    end
end