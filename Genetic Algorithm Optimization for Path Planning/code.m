function path_planning_ga()

grid_size = 20;

start_pos = [2,2];
target_pos = [18,18];

obstacles = [
    5 5 4 4;
    12 2 3 6;
    8 12 5 4;
    2 14 4 3
];

num_waypoints = 5;

pop_size = 50;
num_generations = 100;
mutation_rate = 0.15;

num_vars = num_waypoints * 2;

lower_bound = ones(1,num_vars);
upper_bound = grid_size * ones(1,num_vars);

options = optimoptions('ga',...
    'PopulationSize',pop_size,...
    'MaxGenerations',num_generations,...
    'MutationFcn',@mutationadaptfeasible,...
    'Display','iter',...
    'PlotFcn',@gaplotbestf);

fitness_func = @(x) calculate_fitness(x,start_pos,target_pos,obstacles,grid_size);

[best_chrom,~] = ga(...
    fitness_func,...
    num_vars,...
    [],[],[],[],...
    lower_bound,...
    upper_bound,...
    [],...
    options);

best_chrom = round(best_chrom);

best_path = [
    start_pos;
    reshape(best_chrom,[num_waypoints,2]);
    target_pos
];

figure;
hold on;
grid on;
axis([0 grid_size 0 grid_size]);
axis square;

xlabel('X Coordinate');
ylabel('Y Coordinate');
title('Genetic Algorithm Path Planning');

obsHandle = [];

for i=1:size(obstacles,1)
    h = rectangle('Position',obstacles(i,:),...
        'FaceColor',[0.5 0.5 0.5],...
        'EdgeColor','k');
    if isempty(obsHandle)
        obsHandle = h;
    end
end

startHandle = plot(start_pos(1),start_pos(2),'go','MarkerFaceColor','g','MarkerSize',10);

targetHandle = plot(target_pos(1),target_pos(2),'ro','MarkerFaceColor','r','MarkerSize',10);

pathHandle = plot(best_path(:,1),best_path(:,2),...
    'b-o',...
    'LineWidth',2,...
    'MarkerFaceColor','y');

legend([obsHandle,startHandle,targetHandle,pathHandle],...
    {'Obstacles','Start','Target','Optimized Path'},...
    'Location','best');

hold off;

end

function total_cost = calculate_fitness(chrom,start_pos,target_pos,obstacles,grid_size)

chrom = round(chrom);

chrom = max(chrom,1);
chrom = min(chrom,grid_size);

num_waypoints = length(chrom)/2;

waypoints = reshape(chrom,[num_waypoints,2]);

full_path = [
    start_pos;
    waypoints;
    target_pos
];

path_length = 0;
obstacle_penalty = 0;

for i=1:size(full_path,1)-1

    p1 = full_path(i,:);
    p2 = full_path(i+1,:);

    path_length = path_length + norm(p2-p1);

    for t=0:0.05:1

        point = p1 + t*(p2-p1);

        for j=1:size(obstacles,1)

            obs = obstacles(j,:);

            if point(1)>=obs(1) && point(1)<=obs(1)+obs(3) && ...
               point(2)>=obs(2) && point(2)<=obs(2)+obs(4)

                obstacle_penalty = obstacle_penalty + 1000;

            end

        end

    end

end

total_cost = path_length + obstacle_penalty;

end
