function f = evaluate_objective(x, M, V, problemType)
    % x: 输入向量
    % M: 目标函数的数量
    % V: 决策变量的数量
    % problemType: DTLZ问题的类型 ('DTLZ1', 'DTLZ2', etc.)

    switch problemType
        case 2
            f = dtlz2(x, M, V);
        case 5
            f = dtlz5(x, M, V);
        case 7
            f = dtlz7(x, M, V);
        % 可以添加其他DTLZ问题的case
        otherwise
            error('Unsupported problem type');
    end
end