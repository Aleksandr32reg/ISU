function path = yeszeros(new_path)
    path = zeros(1,20);
    path(1,1:size(new_path, 2)) = new_path;    
end