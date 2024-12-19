function nsga_2(pop,gen)
    %% 输入参数检查
    if nargin < 2
        error('NSGA-II: 请提供种群大小和代数作为输入参数。');
    end
    if isnumeric(pop) == 0 || isnumeric(gen) == 0
        error('输入参数 pop 和 gen 应为整数类型');
    end
    if pop < 20 || gen < 5
        error('运行此函数的最小种群为 20, 最小代数为 5');
    end
    pop = round(pop);
    gen = round(gen);

    %% 目标函数描述
    % [M, V, min_range, max_range, dtlz_problem] = objective_description_function();
    % 通过交互获取问题类型
    while true
        dtlz_problem = input('请输入要测试的DTLZ问题编号 (2/5/7): ');
        if ismember(dtlz_problem, [2,5,7])
            break;
        else
            fprintf('输入错误,请输入2、5或7\n');
        end
    end
    [M, V, min_range, max_range, dtlz_problem] = deal(3, 10, zeros(pop,1), ones(pop,1), 2);
    fprintf('当前选择的 DTLZ 问题编号: %d\n', dtlz_problem);

    %% 初始化种群
    chromosome = initialize_variables(pop, M, V, min_range, max_range,dtlz_problem);

    %% 对初始化种群进行排序,返回排序结果
    chromosome = non_domination_sort_mod(chromosome, M, V);

    %% 开始进化过程
    colors = lines(floor(gen/10)); % 生成不同的颜色
    figure; % 创建一个新的图形窗口
    hold on; % 保持在同一个图中绘制

    for i = 1 : gen
        % 选择父代
        pool = round(pop/2);
        tour = 2;
        parent_chromosome = tournament_selection(chromosome, pool, tour);

        % 交叉和变异操作
        mu = 20;
        mum = 20;
        offspring_chromosome = genetic_operator(parent_chromosome, M, V, mu, mum, min_range, max_range,dtlz_problem);

        % 合并亲代和子代
        [main_pop,~] = size(chromosome);
        [offspring_pop,~] = size(offspring_chromosome);
        intermediate_chromosome(1:main_pop,:) = chromosome;
        intermediate_chromosome(main_pop + 1 : main_pop + offspring_pop,1 : M+V) = offspring_chromosome;

        % 对中间种群进行非支配排序
        intermediate_chromosome = non_domination_sort_mod(intermediate_chromosome, M, V);

        % 选择操作
        chromosome = replace_chromosome(intermediate_chromosome, M, V, pop);

        % 每隔10代绘制一次
        if ~mod(i,100)
            % 确保颜色索引为正整数
            color_idx = max(1, min(floor(i/10), size(colors,1)));
            if M == 2
                plot(chromosome(:,V + 1),chromosome(:,V + 2),'*', 'Color', colors(color_idx,:));
            elseif M == 3
                plot3(chromosome(:,V + 1),chromosome(:,V + 2),chromosome(:,V + 3),'*', 'Color', colors(color_idx,:));
            end
        end

        if ~mod(i,100)
            clc
            fprintf('%d 代已完成\n',i);
        end
    end

    %% 保存结果
    save ./NSGA2/solution.txt chromosome -ASCII

    %% 可视化
    if M == 2
        plot(chromosome(:,V + 1),chromosome(:,V + 2),'*');
    elseif M ==3
        plot3(chromosome(:,V + 1),chromosome(:,V + 2),chromosome(:,V + 3),'*');
    end
    hold off; % 结束保持
end