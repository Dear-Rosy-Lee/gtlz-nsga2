function [number_of_objectives, number_of_decision_variables, min_range_of_decesion_variable, max_range_of_decesion_variable, dtlz_problem] = objective_description_function()

    % 获取目标函数数量
    g = sprintf('Input the number of objective: ');
    number_of_objectives = input(g);
    if number_of_objectives < 2
        error('This is a multi-objective optimization function hence the minimum number of objectives is two');
    end

    % 获取决策变量数量
    g = sprintf('\nInput the number of decision variables: ');
    number_of_decision_variables = input(g);
    clc

    % 获取每个决策变量的范围
    for i = 1 : number_of_decision_variables
        clc
        g = sprintf('\nInput the minimum value for decision variable %d : ', i);
        min_range_of_decesion_variable(i) = input(g);
        g = sprintf('\nInput the maximum value for decision variable %d : ', i);
        max_range_of_decesion_variable(i) = input(g);
        clc
    end

    % 选择DTLZ问题
    g = sprintf('\n请选择 DTLZ 问题 (2, 5, 或 7): '); % 提示用户从三个 DTLZ 测试问题中选择一个
    dtlz_problem = input(g);
    if ~ismember(dtlz_problem, [2, 5, 7])
        error('Invalid DTLZ problem selected. Please choose 2, 5, or 7.');
    end

    % 计算目标函数值
    x = rand((number_of_decision_variables - 10) + 10, 1); % Example input for x
    switch dtlz_problem
        case 2
            f = dtlz2(x, number_of_objectives);
        case 5
            f = dtlz5(x, number_of_objectives); % Assuming dtlz5 function exists
        case 7
            f = dtlz7(x, number_of_objectives); % Assuming dtlz7 function exists
    end

    % 提示用户编辑目标函数
    g = sprintf(['\n Now edit the function named "evaluate_objective" appropriately to match your needs.\n', ...
                 ' Make sure that the number of objective functions and decision variables match your numerical input. \n', ...
                 ' Make each objective function as a corresponding array element. \n', ...
                 ' After editing do not forget to save. \n', ...
                 ' Press "c" and enter to continue... ']);
    x = input(g, 's');
    if isempty(x)
        x = 'x';
    end
    while x ~= 'c'
        clc
        x = input(g, 's');
        if isempty(x)
            x = 'x';
        end
    end

end