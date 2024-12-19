function f = initialize_variables(N, M, V, min_range, max_range,problemType)

min = min_range;
max = max_range;
K = M + V;

% 打印输入参数以检查其正确性
disp(['N: ', num2str(N), ', M: ', num2str(M), ', V: ', num2str(V)]);


for i = 1 : N
    for j = 1 : V
        f(i,j) = min(j) + (max(j) - min(j))*rand(1);
        % 打印每个决策变量的值
        disp(['f(', num2str(i), ',', num2str(j), '): ', num2str(f(i,j))]);
    end
    % 打印每个个体的决策变量
    disp(['Decision variables for individual ', num2str(i), ': ', num2str(f(i, 1:V))]);
    
    f(i,V + 1: K) = evaluate_objective(f(i,:), M, V,problemType);
    % 打印每个个体的目标值
    disp(['Objective values for individual ', num2str(i), ': ', num2str(f(i, V+1:K))]);
end