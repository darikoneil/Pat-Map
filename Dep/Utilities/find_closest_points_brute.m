function [nearest_points] = find_closest_points_brute(Set1, Set2)

distances = pdist2(Set1, Set2);
minDistance = min(distances(:));
[rowOfA, rowOfB] = find(distances == minDistance);
nearest_points = [Set1(rowOfA, :), Set2(rowOfB, :)];

if size(nearest_points,1) > 1
    nearest_points = nearest_points(1, :);
end

