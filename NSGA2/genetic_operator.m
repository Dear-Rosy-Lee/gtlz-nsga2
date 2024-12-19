function f = genetic_operator(parent_chromosome, M, V, mu, mum, l_limit, u_limit,problemType)
    [N, ~] = size(parent_chromosome);
    p = 1; % 子代计数器

    for i = 1 : N
        was_crossover = 0; 
        was_mutation = 0;  
        if rand(1) < 0.9 % 90%概率进行交叉
            % 初始化子代
            child_1 = [];
            child_2 = [];
            % 随机选择两个不同的父代
            parent_1 = round(N * rand(1));
            if parent_1 < 1, parent_1 = 1; end
            parent_2 = round(N * rand(1));
            if parent_2 < 1, parent_2 = 1; end
            while isequal(parent_chromosome(parent_1,:), parent_chromosome(parent_2,:))
                parent_2 = round(N * rand(1));
                if parent_2 < 1, parent_2 = 1; end
            end
            parent_1 = parent_chromosome(parent_1,:);
            parent_2 = parent_chromosome(parent_2,:);

            % 对每个决策变量进行模拟二进制交叉（SBX）
            for j = 1 : V
                u(j) = rand(1);
                if u(j) <= 0.5
                    bq(j) = (2 * u(j))^(1 / (mu + 1));
                else
                    bq(j) = (1 / (2 * (1 - u(j))))^(1 / (mu + 1));
                end
                % 生成子代
                child_1(j) = 0.5 * (((1 + bq(j)) * parent_1(j)) + (1 - bq(j)) * parent_2(j));
                child_2(j) = 0.5 * (((1 - bq(j)) * parent_1(j)) + (1 + bq(j)) * parent_2(j));
                % 确保子代在决策空间内
                if child_1(j) > u_limit(j), child_1(j) = u_limit(j); end
                if child_1(j) < l_limit(j), child_1(j) = l_limit(j); end
                if child_2(j) > u_limit(j), child_2(j) = u_limit(j); end
                if child_2(j) < l_limit(j), child_2(j) = l_limit(j); end
            end
            % 评估子代的目标函数
            child_1(:, V + 1: M + V) = evaluate_objective(child_1, M, V,problemType);
            child_2(:, V + 1: M + V) = evaluate_objective(child_2, M, V,problemType);
            was_crossover = 1;
        else % 10%概率进行变异
            parent_3 = round(N * rand(1));
            if parent_3 < 1, parent_3 = 1; end
            child_3 = parent_chromosome(parent_3,:);
            % 对每个元素进行多项式变异
            for j = 1 : V
                r(j) = rand(1);
                if r(j) < 0.5
                    delta(j) = (2 * r(j))^(1 / (mum + 1)) - 1;
                else
                    delta(j) = 1 - (2 * (1 - r(j)))^(1 / (mum + 1));
                end
                child_3(j) = child_3(j) + delta(j);
                if child_3(j) > u_limit(j), child_3(j) = u_limit(j); end
                if child_3(j) < l_limit(j), child_3(j) = l_limit(j); end
            end
            child_3(:, V + 1: M + V) = evaluate_objective(child_3, M, V,problemType);
            was_mutation = 1;
        end

        % 将生成的子代加入到子代集合中
        if was_crossover
            child(p,:) = child_1;
            child(p+1,:) = child_2;
            p = p + 2;
        elseif was_mutation
            child(p,:) = child_3(1, 1 : M + V);
            p = p + 1;
        end
    end
    f = child;
end