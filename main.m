function main()
    addpath('./DTLZ/')
    addpath('./NSGA2/')
    % 设置种群大小和代数
    pop_size = 200; % 种群大小
    generations = 500; % 代数

    % 调用 NSGA-II 算法
    nsga_2(pop_size, generations);

    % 显示完成信息
    disp('NSGA-II 优化已完成。');
end