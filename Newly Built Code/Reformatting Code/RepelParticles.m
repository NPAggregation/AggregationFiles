function particles = RepelParticles(Particles, N)
responseFactor = 0.65;
for i = 1:N
   for j = (i + 1) : N
      distance = Particles(i).NeighborList(j);
      if (distance <= 3)
         Particles(i).Velocity = -(distance / responseFactor) * Particles(i).Velocity;
      end
   end
end
particles = Particles;
end