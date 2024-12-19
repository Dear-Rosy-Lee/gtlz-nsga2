function f = dtlz2(x, M, V)
    % DTLZ2问题的实现
    % 输入: x - 决策变量矩阵
    %       M - 目标函数的数量
    %       V - 决策变量的数量
    % 输出: f - 目标函数值矩阵
    f = zeros(1, M);
    g = sum((x(M:V) - 0.5).^2);
    
    for i = 1:M
        product = 1;
        for j = 1:M-i
            product = product * cos(x(j) * pi / 2);
        end
        if i > 1
            product = product * sin(x(M-i+1) * pi / 2);
        end
        f(i) = (1 + g) * product;
    end
end