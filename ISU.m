clc 
clear
A = true;
start = [1,1];
finish = [4,4];
M = zeros(4);
Gates = zeros(3, 2);
Blocks = zeros(3, 2);
M(1,1) = 5;
M(4,4) = 10;

k = 1;
while k <= 3 
    IJ = randi([1 4], 1, 2);
    if  M(IJ(1),IJ(2)) == 0
        M(IJ(1),IJ(2)) = 1;
        Gates(k,1) = IJ(1);
        Gates(k,2) = IJ(2);
        k = k+1;
    end   
end
Gates(4,:) = finish; 

k = 1;
while k <= 3
    IJ = randi([1 4], 1, 2);
    if  M(IJ(1),IJ(2)) == 0
        M(IJ(1),IJ(2)) = -1;
        Blocks(k,1) = IJ(1);
        Blocks(k,2) = IJ(2);
        k = k+1;
    end   
end

M
path = BFS(start, finish, Blocks, Gates);
final_path = [];
for i=1:2:size(path,2)
    final_path = [final_path; path(i) path(i+1)];
end
final_path