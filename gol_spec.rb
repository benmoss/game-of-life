require_relative 'gol'

describe "the game" do
  it "Any live cell with fewer than two live neighbours dies, as if caused by under-population." do
    world = [
      [0, 0, 0],
      [0, 1, 0],
      [0, 0, 0]
    ]
    WorldAdvancer.next_tick(world)
    world.should == [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
    ]
  end

  it "Any live cell with two or three live neighbours lives on to the next generation." do
    world = [
      [1, 1, 0],
      [1, 1, 1],
      [0, 0, 0]
    ]

    WorldAdvancer.next_tick(world)
    world.should == [
      [1, 0, 1],
      [1, 0, 1],
      [0, 1, 0]
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

  it "works with a rectangular grid" do
    world = [
      [1, 1, 1, 0],
      [0, 1, 0, 1],
      [0, 0, 0, 1]
    ]
    WorldAdvancer.next_tick(world)
    world.should == [
      [1, 1, 1, 0],
      [1, 1, 0, 1],
      [0, 0, 1, 0]
    ]
  end
end
