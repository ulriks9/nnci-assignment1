% Returns struct with features and labels
% Generates P randomly generated normally distributed N-dimensional feature vectors
function dataset = data(P, N)
    dataset.features = normrnd(0, 1, P, N);
    dataset.labels = randi([0 1], P, 1);
end