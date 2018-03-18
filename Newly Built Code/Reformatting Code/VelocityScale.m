function particles = VelocityScale(N, Particle, Tcorr)
for i = 1:N
    xVec = Particle(i).Velocity(1) * Particle(i).Velocity(1); 
    yVec = Particle(i).Velocity(2) * Particle(i).Velocity(2); 
    zVec = Particle(i).Velocity(3) * Particle(i).Velocity(3);
    
    sumVComps = xVec + yVec + zVec;
    fac = sqrt(Tcorr / sumVComps);
    Particle(i).Velocity = fac.*(Particle(i).Velocity);
end
particles = Particle;
end