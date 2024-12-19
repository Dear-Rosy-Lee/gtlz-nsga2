function f = tournament_selection(chromosome, pool_size, tour_size)
    % 锦标赛选择函数
    % 输入：chromosome 种群
    %       pool_size 交配池大小
    %       tour_size 锦标赛大小,指每次选择个体的数量
    % 获取种群大小和变量数
    [pop, variables] = size(chromosome);
    rank = variables - 1; % 排名信息
    distance = variables; % 拥挤距离信息

    % 进行锦标赛选择直到填满交配池
    for i = 1 : pool_size
        % 随机选择n个个体，n为锦标赛大小
        for j = 1 : tour_size
            candidate(j) = round(pop * rand(1));
            if candidate(j) == 0
                candidate(j) = 1;
            end
            if j > 1
                % 确保不选择相同的个体
                while ~isempty(find(candidate(1 : j - 1) == candidate(j)))
                    candidate(j) = round(pop * rand(1));
                    if candidate(j) == 0
                        candidate(j) = 1;
                    end
                end
            end
        end

        % 收集所选个体的信息
        for j = 1 : tour_size
            c_obj_rank(j) = chromosome(candidate(j), rank);
            c_obj_distance(j) = chromosome(candidate(j), distance);
        end

        % 找到排名最低的个体
        min_candidate = find(c_obj_rank == min(c_obj_rank));

        % 如果有多个个体排名最低，选择拥挤距离最大的个体
        if length(min_candidate) ~= 1
            max_candidate = find(c_obj_distance(min_candidate) == max(c_obj_distance(min_candidate)));
            if length(max_candidate) ~= 1
                max_candidate = max_candidate(1);
            end
            f(i,:) = chromosome(candidate(min_candidate(max_candidate)), :);
        else
            f(i,:) = chromosome(candidate(min_candidate(1)), :);
        end
    end
end