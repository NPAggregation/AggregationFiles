%% Initializing Velocity %%
% Initializes velocity of all the particles in the system

function particles = VelocityInitialize(Particles, N, Tcorr)
% Assign Random Velocities (Between -1 and 1) (units?)
for i = 1:N
    Particles(i).Velocity(1) = (2 * rand) - 1;
    Particles(i).Velocity(2) = (2 * rand) - 1;
    Particles(i).Velocity(3) = (2 * rand) - 1;
end

sumV = zeros(1, 3);                                     % Sum of velocities in three axes

% Initialize System with Zero Net Momentum
for j = 1:N
    sumV(1:3) = sumV(1:3) + Particles(j).Velocity(1:3);    % Get sum of velocities in the ith-direction
end
    
% Normally distributing velocity of particles in the system?
for j = 1:N
    Particles(j).Velocity(1:3) =  Particles(j).Velocity(1:3) - (sumV(1:3) / N);
end


% Scale Initial Velocities to Set Point Temperature
% Unsure of all these variables? Where are they coming from?

% Blank out Velocity scaling because I don't think it's working correctly

%{
for i = 1:N
    % Squaring each velocity component in the ith particle
    xVec = Particles(i).Velocity(1) * Particles(i).Velocity(1); 
    yVec = Particles(i).Velocity(2) * Particles(i).Velocity(2); 
    zVec = Particles(i).Velocity(3) * Particles(i).Velocity(3); 
    
    sumVComps = xVec + yVec + zVec;                              % Sum of velocity velocity squared
    fac = sqrt(Tcorr / sumVComps);
    Particles(i).Velocity = fac.*(Particles(i).Velocity);        % Scale velocity bet set point temperature
end
%}

particles = Particles;
end