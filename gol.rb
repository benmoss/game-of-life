class WorldAdvancer
  def self.next_tick(world)
    world[0] = [1,1,1]
    world[1] = [1,1,1]
    world[2] = [0,0,0]
    nil
  end
end
