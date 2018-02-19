%% Initializing Velocity %%
% Initializes velocity of all the particles in the system

function particles = VelocityInitialize(particles, N, Tcorr)
% Assign Random Velocities (Between -1 and 1) (units?)
for i = 1:N
    particles(i).Velocity(1) = (2 * rand) - 1;          % Initialize the x-direction velocity for particle i
    particles(i).Velocity(2) = (2 * rand) - 1;          % Initialize the y-direction velocity for particle i
    particles(i).Velocity(3) = (2 * rand) - 1;          % Initialize the z-direction velocity for particle i
end
sumV = zeros(1, 3);                                     % Sum of velocities in three axes

% Initialize System with Zero Net Momentum
for i = 1:3
    for j = 1:N
       sumV(i) = sumV(i) + particles(j).Velocity(i);    % Get sum of velocities in the ith-direction
    end
    
    % Normally distributing velocity of particles in the system?
    for j = 1:N
       particles(j).Velocity(i) =  particles(j).Velocity(i) - (sumV(i) / N);
    end
end

% Scale Initial Velocities to Set Point Temperature
% Unsure of all these variables? Where are they coming from?
for i = 1:N
    % Squaring each velocity component in the ith particle
    xVec = particles(i).Velocity(1) * particles(i).Velocity(1); 
    yVec = particles(i).Velocity(2) * particles(i).Velocity(2); 
    zVec = particles(i).Velocity(3) * particles(i).Velocity(3); 
    
    sumVComps = xVec + yVec + zVec;                              % Sum of velocity velocity squared
    fac = sqrt(Tcorr / sumVComps);
    particles(i).Velocity = fac.*(particles(i).Velocity);        % Scale velocity bet set point temperature
end
end