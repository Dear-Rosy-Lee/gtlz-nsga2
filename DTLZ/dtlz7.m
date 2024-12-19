function f = dtlz7(x, M, V)
    % DTLZ7问题的实现
    f = zeros(1, M);
    
    % 计算前M-1个目标函数
    for i = 1:M-1
        f(i) = x(i);
    end
    
    % 计算g
    g = 1 + (9 / (V - M + 1)) * sum(x(M:V));
    
    % 计算h
    h = M;
    for i = 1:M-1
        h = h - (f(i) / (1 + g)) * (1 + sin(3 * pi * f(i)));
    end
    
    % 计算最后一个目标函数
    f(M) = (1 + g) * h;
end
