require_relative 'gol'

describe "the game" do
  it "Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction." do
    world = [
      [1, 1, 1],
      [0, 1, 0],
      [0, 0, 0]
    ]
    WorldAdvancer.next_tick(world)
    world.should == [
      [1, 1, 1],
      [1, 1, 1],
      [0, 0, 0]
    ]
  end

  it "Any live cell with more than three live neighbours dies, as if by overcrowding." do
    world = [
      [1, 1, 1],
      [1, 1, 1],
      [1, 1, 1]
    ]
    WorldAdvancer.next_tick(world)
    world.should == [
      [1, 0, 1],
      [0, 0, 0],
      [1, 0, 1]
    ]
  end
end
