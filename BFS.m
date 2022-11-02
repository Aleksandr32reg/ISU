function path = BFS(start, finish, Blocks)
    queue = yeszeros(start);
    while isempty(queue)==0
        path = queue(1,:) ;
        queue(1,:) = [];
        path = nozeros(path);
        node = [path(size(path,2)-1), path(size(path,2))];
        if node == finish
%             check = [1 1 1];
%             for i = 2:2:size(path)
%                 if [path(i-1) path(i)] == Gates(1,:)
%                         check(1) = 0;
%                 end
%                 if [path(i-1) path(i)] == Gates(2,:)
%                         check(2) = 0;
%                 end
%                 if [path(i-1) path(i)] == Gates(3,:)
%                         check(3) = 0;
%                 end
%             end
%             if isempty(nozeros(check))
                queue = [];
%             end
        else
            adjacent_indices = get_adjacent_indices(node(1), node(2), 4, 4);
            row_power = sum(abs(adjacent_indices'));
            adjacent_indices = adjacent_indices(row_power>0,:);
            for i=1:size(adjacent_indices,1)
                if ~(isequal(adjacent_indices(i,:), Blocks(1,:)))
                    if ~(isequal(adjacent_indices(i,:), Blocks(2,:)))
                        if ~(isequal(adjacent_indices(i,:), Blocks(3,:)))
                            new_path = [path adjacent_indices(i,:)];
                            new_path = yeszeros(new_path);
                            queue = [queue; new_path];
                        end
                    end
                end
            end
        end
    end
end  