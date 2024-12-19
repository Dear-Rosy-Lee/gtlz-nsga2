function f = replace_chromosome(intermediate_chromosome, M, V, pop)
% 替换染色体函数
% 输入: intermediate_chromosome - 合并后的种群
%       M - 目标函数数量
%       V - 决策变量数量
%       pop - 种群大小
% 输出: f - 选择后的新种群

% 获取中间种群大小
[N, m] = size(intermediate_chromosome);
% 根据非支配排序等级进行排序
[temp, index] = sort(intermediate_chromosome(:, M + V + 1));
clear temp m

% 按照排序结果重新排列种群
sorted_chromosome = intermediate_chromosome(index, :);


% 获取最大等级
max_rank = max(intermediate_chromosome(:, M + V + 1));
previous_index = 0;

% 按等级依次选择个体
for i = 1 : max_rank
    % 找到当前等级的最后一个个体位置
    current_index = find(sorted_chromosome(:, M + V + 1) == i, 1, 'last');
    
    if current_index > pop
        % 如果当前等级的个体数量超过需要的数量，根据拥挤度选择
        remaining = pop - previous_index;
        temp_pop = sorted_chromosome(previous_index + 1 : current_index, :);
        [temp_sort, temp_sort_index] = sort(temp_pop(:, M + V + 2), 'descend');
        for j = 1 : remaining
            f(previous_index + j, :) = temp_pop(temp_sort_index(j), :);
        end
        return;
    elseif current_index < pop
        % 如果当前等级的个体数量未达到需要的数量，全部保留
        f(previous_index + 1 : current_index, :) = sorted_chromosome(previous_index + 1 : current_index, :);
    else
        % 如果刚好达到需要的数量，全部保留并返回
        f(previous_index + 1 : current_index, :) = sorted_chromosome(previous_index + 1 : current_index, :);
        return;
    end
    previous_index = current_index;
end
end