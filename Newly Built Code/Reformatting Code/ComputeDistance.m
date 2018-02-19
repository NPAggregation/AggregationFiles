%% Distance Computing Method %%
% Computes distance between each particle in the system

function particle = ComputeDistance(Particle, N, rNbr2)
for i = 1:N
    for j = (i + 1):N
       if (i ~= j) 
            % Compute distnace between ith and jth particle, where i != j
            distanceX = (Particle(i).Position(1) - Particle(j).Position(1))^2;
            distanceY = (Particle(i).Position(2) - Particle(j).Position(2))^2;
            distanceZ = (Particle(i).Position(3) - Particle(j).Position(3))^2;
            distance = sqrt(distanceX + distanceY + distanceZ);
            % "I don't think sideH checkers make sense or understand the sideH checkers" %
            
            % Check if distance is less than cut off distance
            if (distance <= rNbr2)
                neighbouri = Neighbour(Particle(j), distance);
                neighbourj = Neighbour(Particle(i), distance);
                Particle(i).NeighborList(size(Particle(i).NeighborList) + 1) = neighbouri;
                Particle(j).NeighborList(size(Particle(j).NeighborList) + 1) = neighbourj;
            end 
       end      
    end
end
particle = Particle;
end