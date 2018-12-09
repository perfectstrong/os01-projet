clear;

fin = './input/input_1000_10_10.txt';
##input_5_10_10.txt
##input_10_10_10.txt
##input_100_10_10.txt
##input_200_10_10.txt
##input_500_10_10.txt
##input_1000_10_10.txt
fout = './output/outputV2_input_1000_10_10.txt';
##outputV2_input_5_10_10.txt
##outputV2_input_10_10_10.txt
##outputV2_input_100_10_10.txt
##outputV2_input_200_10_10.txt
##outputV2_input_500_10_10.txt
##outputV2_input_1000_10_10.txt

% read input
f=fopen(fin);
tline = fgetl(f);
tlines = cell(0,1);
while ischar(tline)
    tlines{end+1,1} = tline;
    tline = fgetl(f);
end
fclose(f);

n = sscanf(tlines{1}, '%d');
max = sscanf(tlines{2}, '%f %f');
p = zeros(n, 2);
for i=1:n
    p(i,:) = sscanf(tlines{i+2}, '%f %f');
end;

% read output
f=fopen(fout);
oline = fgetl(f);
olines = cell(0,1);
while ischar(oline)
    olines{end+1,1} = oline;
    oline = fgetl(f);
end
fclose(f);

minL = sscanf(olines{1}, '%f');
disp(minL);
starts = zeros(n, 2);
ends = zeros(n, 2);
for i=1:n
    l = sscanf(olines{i+1}, '%f %f %f %f');
    starts(i,1)=l(1);
    starts(i,2)=l(2);
    ends(i,1)=l(3);
    ends(i,2)=l(4);
end

% plot
hold on;
axis([0 max(1) 0 max(2)]);
scatter(p(:,1),p(:,2),30,'b','filled');
for i=1:n
    plot([starts(i,1) ends(i,1)],[starts(i,2) ends(i,2)],'r');
end
hold off;
