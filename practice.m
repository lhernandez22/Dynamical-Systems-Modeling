% Define the number of age classes (0 to 65)
n = 66;

% Survival rates (female only)
survival = [
    0.9979, 0.99767, 0.99727, 0.99885, 0.99889, 0.99991, 0.99992, 0.99992, 0.99993, 0.99994,...
    0.99994, 0.99994, 0.99992, 0.9999, 0.9999, 0.99988, 0.99988, 0.99981, 0.99981, 0.99976,...
    0.99976, 0.99974, 0.99974, 0.99974, 0.99973, 0.99974, 0.99974, 0.99968, 0.99962, 0.99961,...
    0.99964, 0.99962, 0.9996, 0.99956, 0.99956, 0.99952, 0.99944, 0.99934, 0.99933, 0.99924,...
    0.9992, 0.99904, 0.999, 0.99891, 0.99882, 0.99862, 0.99848, 0.99822, 0.99862, 0.99803,...
    0.99783, 0.99761, 0.9974, 0.99718, 0.99687, 0.99659, 0.99634, 0.99607, 0.99572, 0.99533,...
    0.996, 0.9963, 0.99599, 0.99556, 0.99553
];

% Adjusted fertility rates (female only)
fertility = [
    0, 0, 0, 0, 0, 0, 0, 0, 0, 0,...
    0, 0, 0, 0, 0, 0.000185364, 0.000595116, 0.001526814, 0.002980458, 0.006034086,...
    0.009477954, 0.01324377, 0.016404714, 0.020892474, 0.026863146, 0.031858218, 0.03775572,...
    0.043306884, 0.048092202, 0.051453144, 0.051565338, 0.05104827, 0.047911716, 0.044004438,...
    0.039087414, 0.034067952, 0.028263132, 0.021775392, 0.016677882, 0.012302316, 0.008370648,...
    0.005282874, 0.003038994, 0.0014634, 0.000746334, 0.000263412, 0.000112194, 0.000034146,...
    0.000029268, 0.00002439, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
];

% Initialize Leslie Matrix
L = zeros(n);

% Top row = fertility rates
L(1, :) = fertility;

% Sub-diagonal = survival rates
for i = 2:n
    L(i, i-1) = survival(i-1);
end

% Display the matrix (optional)
disp('Leslie Matrix:');
disp(L);

[V, D] = eig(L);
eigenvalues = diag(D);

%dominant eigenvalue
[dominant_value, idx] = max(real(eigenvalues));

steady_state = real(V(:, idx));
steady_state = steady_state / sum(steady_state);

fprintf('Dominant Eigenvalue (Growth Rate): %.6f\n', dominant_value);
disp('Steady State Distribution (normalized):');
disp(steady_state);

% Save as Excel file (optional)
%filename = 'Leslie_Matrix_Age_0_to_65.xlsx';
%xlswrite(filename, L);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
initial_population = [
   528385.8, 528385.8, 528385.8, 528385.8, 528385.8, 559247.2, 559247.2, 559247.2,...
    559247.2, 559247.2, 580674.2, 580674.2, 580674.2, 580674.2, 580674.2, 581599.8, 581599.8, 581599.8...
    581599.8, 581599.8, 622606, 622606, 622606, 622606, 622606, 706930.4, 706930.4, 706930.4,...
    706930.4, 706930.4, 833001.4, 833001.4, 833001.4, 833001.4, 833001.4, 985230.8, 985230.8,...
    985230.8, 985230.8, 985230.8, 851583.8, 851583.8, 851583.8, 851583.8, 851583.8, 783600,...
    783600, 783600, 783600, 783600, 762667.8, 762667.8, 762667.8, 762667.8, 762667.8, 869363,...
    869363, 869363, 869363, 869363, 1056913, 1056913, 1056913, 1056913, 1056913, 849034.8,...
];
initial_population = [528,385.80, 528,385.80, 528,385.80, 528,385.80, 528,385.80,...
559,247.20, 559,247.20, 559,247.20, 559,247.20, 559,247.20, 580,674.20, 580,674.20..
580,674.20
580,674.20
580,674.20
581,599.80
581,599.80
581,599.80
581,599.80
581,599.80
622,606.00
622,606.00
622,606.00
622,606.00
622,606.00
706,930.40
706,930.40
706,930.40
706,930.40
706,930.40
833,001.40
833,001.40
833,001.40
833,001.40
833,001.40
985,230.80
985,230.80
985,230.80
985,230.80
985,230.80
851,583.80
851,583.80
851,583.80
851,583.80
851,583.80
783,600.00
783,600.00
783,600.00
783,600.00
783,600.00
762,667.80
762,667.80
762,667.80
762,667.80
762,667.80
869,363.00
869,363.00
869,363.00
869,363.00
869,363.00
1,056,913.00
1,056,913.00
1,056,913.00
1,056,913.00
1,056,913.00
849,034.80
849,034.80
849,034.80
849,034.80
849,034.80
759128
759128
759128
759128
759128
675441.2
675441.2
675441.2
675441.2
675441.2
531947.8
531947.8
531947.8
531947.8
531947.8
343637.2
343637.2
343637.2
343637.2
343637.2
154659.4
154659.4
154659.4
154659.4
154659.4
50441.6
50441.6
50441.6
50441.6
50441.6
4871.4]
% Initialize
n_years = 10;
pop = zeros(length(initial_population), n_years + 1);
pop(:, 1) = initial_population;

% Project forward using the Leslie matrix
for t = 1:n_years
    pop(:, t+1) = L * pop(:, t);
end

% Create age labels
age_labels = (0:65)';

% Extract final population (after 10 iterations)
final_population = pop(:, end);

% Create table
final_table = table(age_labels, final_population, ...
    'VariableNames', {'Age', 'Population'});

% Display the table
disp('Final population distribution after 10 iterations:');
disp(final_table);

filtered_table = final_table(final_table.Age >= 18 & final_table.Age <= 100, :);

% Display filtered table
disp('Population distribution for ages 18 to 65 after 10 iterations:');
disp(filtered_table);

figure;
bar(filtered_table.Age, filtered_table.Population, 'FaceColor', [0.2 0.6 0.8]);
xlabel('Age');
ylabel('Population');
title('Population Distribution (Ages 18–65) After 10 Iterations');
grid on;

% Optional: Plot population over time for selected age classes
%figure;
%plot(0:n_years, pop(1:5, :)'); % Example: first 5 age classes
%xlabel('Time (years)');
%ylabel('Population');
%title('Population over time for age classes 0 to 4');
%legend('Age 0', 'Age 1', 'Age 2', 'Age 3', 'Age 4');
%grid on;
