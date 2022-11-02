function adjacent_indices = get_adjacent_indices(i, j, m, n)
    adjacent_indices = [];
    x = 1;
    if i > 1
        adjacent_indices(x, 1) = i-1;
        adjacent_indices(x, 2) = j;
        x=x+1;
    end
    if i+1 < m+1
        adjacent_indices(x, 1) = i+1;
        adjacent_indices(x, 2) = j;
        x=x+1;
    end
    if j > 1
        adjacent_indices(x, 1) = i;
        adjacent_indices(x, 2) = j-1;
        x=x+1;
    end
    if j+1 < n+1
        adjacent_indices(x, 1) = i;
        adjacent_indices(x, 2) = j+1;
    end
end