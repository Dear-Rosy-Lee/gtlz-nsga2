function f = dtlz5(x, M, V)
    % DTLZ5问题的实现
    f = zeros(1, M);
    g = sum((x(M:V) - 0.5).^2);
    
    % 计算theta
    theta = zeros(1, M-1);
    theta(1) = x(1) * pi / 2;
    for i = 2:M-1
        theta(i) = (pi / (4 * (1 + g))) * (1 + 2 * g * x(i));
    end
    
    for i = 1:M
        product = 1;
        for j = 1:M-i
            product = product * cos(theta(j));
        end
        if i > 1
            product = product * sin(theta(M-i+1));
        end
        f(i) = (1 + g) * product;
    end
end
