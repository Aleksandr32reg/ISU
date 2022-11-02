clc 
clear
k = 1;
A = true;
start = [1,1];
finish = [4,4];
M = zeros(4);
Gates = zeros(3, 2);
Blocks = zeros(3, 2);
M(1,1) = 5;
M(4,4) = 10;

while k <= 3 
    IJ = randi([1 4], 1, 2);
    if  M(IJ(1),IJ(2)) == 0
        M(IJ(1),IJ(2)) = 1;
        Gates(k,1) = IJ(1);
        Gates(k,2) = IJ(2);
        k = k+1;
    end   
end

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

x1 = start(1);
x2 = finish(1);
y1 = start(2);
y2 = finish(2);
newGates = zeros(3,1);
newGates = [newGates Gates];
path = [];
isfinish = false;
M
while ~(isfinish)
    for i=1:size(newGates,1)
        x2 = newGates(i,2);
        y2 = newGates(i,3);
        distToGate = dist(x1,y1,x2,y2);
        newGates(i, :) = [distToGate newGates(i,2) newGates(i,3)];
    end
    newGates = sortrows(newGates)
    newGates(1, :) = [];
    if size(newGates,1) == 0
        isfinish = true;
    else
        x2 = newGates(1,2);
        y2 = newGates(1,3);
        new_path = BFS([x1 y1], [x2 y2], Blocks);
        path = [path new_path];
        x1 = newGates(1,2);
        y1 = newGates(1,3);
    end
end
M
new_path = BFS([x1 y1], finish, Blocks);
path = [path new_path];
final_path1 = [];
for i=1:2:size(path,2)
    final_path1 = [final_path1; path(i) path(i+1)];
end
final_path1
